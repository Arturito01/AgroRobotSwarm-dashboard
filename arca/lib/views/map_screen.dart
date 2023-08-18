import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:arca/entities/kml/look_at_entity.dart';
import 'package:arca/entities/kml/polygon_entity.dart';
import 'package:arca/models/lands_data.dart';
import 'package:arca/models/mocks/coordinarte_kml_model.dart';
import 'package:arca/services/lg_service.dart';
import 'package:arca/utils/constants.dart';
import 'package:arca/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../entities/kml/orbit.dart';
import '../model_views/constant_view_model.dart';
import '../models/land.dart';
import '../models/robot.dart';

class MapScreen extends StatefulWidget {
  final ConstantViewModel viewModel;
  final List<Robot> robots;
  const MapScreen({Key? key, required this.viewModel, required this.robots})
      : super(key: key);

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  Land? selectedLand;

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  late CameraPosition cameraPosition;
  Set<Marker> markers = {};
  String selectedRobotImage = 'assets/robots/amiga2.png';
  final Set<Polygon> _polygon = HashSet<Polygon>();
  List<LatLng> perimeter = [];
  List<LatLng> path = [];

  Timer? _updateTimer;
  final List<int> _currentPathIndexList = [];

  @override
  void initState() {
    super.initState();
    selectedLand = widget.viewModel.landSelected!;
    selectedLand ??= LandSelection.lands.firstWhere(
        (element) => element.city.city == "Lleida" && element.id == 0);

    loadCoords();
  }

  Future<void> loadMarkers() async {
    Set<int> uniqueRandomIndices = {};
    while (uniqueRandomIndices.length < widget.robots.length) {
      int randomIndex = Random().nextInt(path.length);
      uniqueRandomIndices.add(randomIndex);
    }

    List<int> shuffledIndices = uniqueRandomIndices.toList()..shuffle();
    for (int i = 0; i < widget.robots.length; i++) {
      _currentPathIndexList.add(shuffledIndices[i]);
      Robot robot = widget.robots[i];
      Marker marker = Marker(
        markerId: MarkerId("marker_$i"),
        position: path[_currentPathIndexList[i]],
        infoWindow: InfoWindow(title: robot.name),
        icon: markerIcon,
      );
      markers.add(marker);
    }

    await _sendPolygon();
  }

  void loadCoords() async {
    double? latitude;
    double? longitude;

    latitude = selectedLand?.lat;
    longitude = selectedLand?.long;

    cameraPosition = CameraPosition(
      target: LatLng(latitude!, longitude!),
      zoom: 19,
    );
    _sendKML();
    await _loadPolygon();
    await _loadPath();
  }

  Future<void> _loadPolygon() async {
    for (CoordinateKmlModel coords in selectedLand!.perimeter) {
      perimeter.add(LatLng(coords.longitude, coords.latitude));
    }

    _polygon.add(Polygon(
        polygonId: const PolygonId('1'),
        points: perimeter,
        fillColor: Colors.blue.withOpacity(0.1),
        strokeColor: Colors.blue,
        strokeWidth: 4));
  }

  Future<void> _loadPath() async {
    for (CoordinateKmlModel coords in selectedLand!.path) {
      path.add(LatLng(coords.longitude, coords.latitude));
    }
    await addCustomIcon();
  }

  Future<void> addCustomIcon() async {
    await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      selectedRobotImage,
    ).then(
      (icon) {
        setState(() {
          markerIcon = icon;
          loadMarkers();
        });
      },
    );
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  void dispose() {
    _updateTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text('Map',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
          splashRadius: 24,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.map,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: cameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            polygons: _polygon,
            onCameraMove: (position) =>
                setState(() => cameraPosition = position),
            onCameraIdle: () async => await LGService.shared?.sendTour(
                cameraPosition.target.latitude,
                cameraPosition.target.longitude,
                cameraPosition.zoom.zoomLG,
                cameraPosition.tilt,
                cameraPosition.bearing),
            markers: markers,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton.extended(
                    onPressed: _buildOrbit,
                    label: const Text('Send Orbit'),
                    icon: const Icon(Icons.directions_boat),
                    heroTag: null,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton.extended(
                    onPressed: _showPath,
                    label: const Text('Show path on LG'),
                    icon: const Icon(Icons.play_arrow),
                    heroTag: null,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _sendKML() async {
    await LGService.shared?.sendTour(
        cameraPosition.target.latitude,
        cameraPosition.target.longitude,
        cameraPosition.zoom.zoomLG,
        cameraPosition.tilt,
        cameraPosition.bearing);
  }

  Future<void> _showPath() async {
    String query = "playtour=RobotPath";
    await LGService.shared?.query(query);
  }

  Future<void> _sendPolygon() async {
    Future.delayed(const Duration(seconds: 3));
    List<LatLng> markerList = [];
    for (Marker marker in markers) {
      markerList
          .add(LatLng(marker.position.latitude, marker.position.longitude));
    }
    final lookAt = LookAtEntity.lookAtLinear(
        cameraPosition.target.latitude,
        cameraPosition.target.longitude,
        cameraPosition.zoom.zoomLG,
        cameraPosition.tilt,
        cameraPosition.bearing);
    final kml = PolygonEntity("Polygon", perimeter, lookAt, markerList,
        cameraPosition, widget.robots, path, _currentPathIndexList);

    await LGService.shared?.sendKml(kml.body);
  }

  Future<void> _buildOrbit() async {
    final lookAt = LookAtEntity(
        lng: selectedLand!.long,
        lat: selectedLand!.lat,
        range: '1500',
        tilt: cameraPosition.tilt,
        heading: '0',
        zoom: cameraPosition.zoom.zoomLG);
    final orbit = OrbitEntity.buildOrbit(OrbitEntity.tag(lookAt));
    await LGService.shared?.sendOrbit(orbit, "Orbit");
  }
}
