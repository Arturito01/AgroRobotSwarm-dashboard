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

  late CameraPosition cameraPosition;

  @override
  void initState() {
    super.initState();
    selectedCountry = widget.viewModel.countrySelected!;
    selectedCity = widget.viewModel.citySelected!;
    selectedLand = widget.viewModel.landSelected!;
    loadCoords();
  }

  void loadCoords() {
    double? latitude;
    double? longitude;

    latitude = selectedCountry?.lat;
    longitude = selectedCountry?.long;

    cameraPosition = CameraPosition(
      target: LatLng(latitude!, longitude!),
      zoom: 6,
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
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: cameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _sendKML,
        label: const Text('Send KML'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _sendKML() async {
    await LGService.shared?.sendTour(LookAtEntity(lng: cameraPosition.target.longitude, lat: cameraPosition.target.latitude, range: '1500', tilt: '60', heading: '0'));
  }
}
