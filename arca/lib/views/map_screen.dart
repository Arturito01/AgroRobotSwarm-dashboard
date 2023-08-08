import 'dart:async';

import 'package:arca/entities/kml/look_at_entity.dart';
import 'package:arca/services/lg_service.dart';
import 'package:arca/utils/constants.dart';
import 'package:arca/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  @override
  void initState() {
    super.initState();
    selectedLand = widget.viewModel.landSelected!;
    loadCoords();
    addCustomIcon();
  }

  void loadMarkers() {
    for (int i = 0; i < widget.robots.length; i++) {
      Robot robot = widget.robots[i];
      Marker marker = Marker(
        markerId: MarkerId("marker_$i"),
        position: LatLng(selectedLand!.lat, selectedLand!.long),
        infoWindow: InfoWindow(title: robot.name),
        icon: markerIcon,
      );
      markers.add(marker);
    }
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
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

  void loadCoords() {
    double? latitude;
    double? longitude;

    latitude = selectedLand?.lat;
    longitude = selectedLand?.long;

    cameraPosition = CameraPosition(
      target: LatLng(latitude!, longitude!),
      zoom: 19,
    );
    _sendKML();
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

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
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton.extended(
                      onPressed: _sendOrbit,
                      label: const Text('Send Orbit'),
                      icon: const Icon(Icons.directions_boat),
                      heroTag: null,
                    ),
                  ],
                ),
              ))
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

  Future<void> _sendOrbit() async {
    final lookAt = LookAtEntity(
        lng: cameraPosition.target.longitude,
        lat: cameraPosition.target.latitude,
        range: '0',
        tilt: cameraPosition.tilt,
        heading: '0',
        zoom: cameraPosition.zoom.zoomLG);
    final orbit = LGService.shared?.buildOrbit(lookAt);

    await LGService.shared?.sendOrbit(orbit!, "Orbit");
  }
}
