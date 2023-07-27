import 'dart:async';

import 'package:arca/entities/kml/look_at_entity.dart';
import 'package:arca/services/lg_service.dart';
import 'package:arca/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../model_views/constant_view_model.dart';
import '../models/land.dart';
import '../models/robot.dart';

class MapScreen extends StatefulWidget {
  final ConstantViewModel viewModel;
  final List<Robot> robots;
  const MapScreen({Key? key, required this.viewModel, required this.robots}) : super(key: key);

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  Land? selectedLand;

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  late CameraPosition cameraPosition;
  bool showExtraButton = false;
  Set<Marker> markers = {};

  String selectedRobotImage = 'assets/robots/amiga2.png';

  List<String> robotImages = [
    'assets/robots/amiga.png',
    "assets/robots/Naïo Technologies.png",
    "assets/robots/NEW_Burro_TRANSPARENCIES_01-Landscape.png"
  ];
  int currentImageIndex = 0;

  @override
  void initState(){
    super.initState();
    selectedLand = widget.viewModel.landSelected!;
    loadCoords();
    addCustomIcon();
  }

  void loadMarkers(){
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
            markers: markers,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton.extended(
                onPressed: () {}, //_showImageSelectionDialog,
                label: const Text('Select Robot'),
                icon: const Icon(Icons.fire_truck),
                heroTag: null,
              ),
            ),
          ),
          //_buildSelectedImage(),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton.extended(
                      onPressed: _sendKML,
                      label: const Text('Send KML'),
                      icon: const Icon(Icons.directions_boat),
                      heroTag: null,
                    ),
                    if (showExtraButton)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: FloatingActionButton(
                          onPressed: _sendOrbit,
                          child: Icon(Icons.add),
                          heroTag: null,
                        ),
                      ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Future<void> _sendKML() async {
    await LGService.shared?.sendTour(LookAtEntity(
        lng: cameraPosition.target.longitude,
        lat: cameraPosition.target.latitude,
        range: '1500',
        tilt: '60',
        heading: '0'));
    setState(() {
      showExtraButton = true;
    });
  }

  Future<void> _sendOrbit() async {
    final orbit = LGService.shared?.buildOrbit(selectedLand!);
    await LGService.shared?.sendTour(orbit as LookAtEntity);
  }

  /*Widget _buildSelectedImage() {
    if (selectedRobotImage.isNotEmpty) {
      return Stack(
        children: [
          Center(
            child: Image.asset(
              selectedRobotImage,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 40,
            right: 16,
            child: IconButton(
              icon: const Icon(
                Icons.close,
                size: 50,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  selectedRobotImage = '';
                });
              },
            ),
          ),
        ],
      );
    } else {
      return SizedBox.shrink();
    }
  }

  void _showImageSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Select Robot Image'),
              content: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      child: Image.asset(
                        robotImages[currentImageIndex],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            setState(() {
                              currentImageIndex = (currentImageIndex - 1) >= 0
                                  ? (currentImageIndex - 1)
                                  : (robotImages.length - 1);
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward),
                          onPressed: () {
                            setState(() {
                              currentImageIndex =
                                  (currentImageIndex + 1) % robotImages.length;
                            });
                          },
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedRobotImage = robotImages[currentImageIndex];
                          addCustomIcon();
                        });
                        Navigator.pop(context);
                      },
                      child: const Text('Confirm Selection'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }*/
}
