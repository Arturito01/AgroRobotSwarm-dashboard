import 'dart:async';

import 'package:arca/entities/kml/look_at_entity.dart';
import 'package:arca/services/lg_service.dart';
import 'package:arca/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../model_views/constant_view_model.dart';
import '../models/city.dart';
import '../models/country.dart';
import '../models/land.dart';

class MapScreen extends StatefulWidget {
  final ConstantViewModel viewModel;
  const MapScreen({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  Country? selectedCountry;
  City? selectedCity;
  Land? selectedLand;

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  List<LatLng> kmlCoordinates = [];
  late CameraPosition cameraPosition;

  String selectedRobotImage = 'assets/robots/amiga.png';

  List<String> robotImages = [
    'assets/robots/amiga.png',
    "assets/robots/Naïo Technologies.png",
    "assets/robots/NEW_Burro_TRANSPARENCIES_01-Landscape.png"
  ];
  int currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedLand = widget.viewModel.landSelected!;
    addCustomIcon();
    loadCoords();
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), selectedRobotImage)
        .then((icon) {
      setState(() {
        markerIcon = icon;
      });
    });
  }

  void loadCoords() {
    double? latitude;
    double? longitude;

    latitude = selectedLand?.lat;
    longitude = selectedLand?.long;

    cameraPosition = CameraPosition(
      target: LatLng(latitude!, longitude!),
      zoom: 18,
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
            markers: {
              Marker(
                markerId: MarkerId("marker1"),
                position: LatLng(0.5949246457564761, 41.61732984163952),
                icon: markerIcon,
              )
            },
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton.extended(
                onPressed: _showImageSelectionDialog,
                label: const Text('Select Robot'),
                icon: const Icon(Icons.fire_truck),
              ),
            ),
          ),
          _buildSelectedImage(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _sendKML,
        label: const Text('Send KML'),
        icon: const Icon(Icons.directions_boat),
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
  }

  Widget _buildSelectedImage() {
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
                      width:
                          200,
                      height:
                          200,
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
  }
}
