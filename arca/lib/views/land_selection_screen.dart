import 'package:arca/utils/constants.dart';
import 'package:flutter/material.dart';

import '../models/city.dart';
import '../models/country.dart';
import '../models/land.dart';
import '../services/lg_service.dart';

class LandSelectionScreen extends StatefulWidget {
  final List<Country> countryList;
  final List<City> cityList;
  final List<Land> landList;
  final Country? country;
  final City? city;
  final Land? land;
  final Function(Country, City, Land) applyChanges;

  const LandSelectionScreen(
      {Key? key,
      required this.country,
      required this.city,
      required this.land,
      required this.applyChanges,
      required this.countryList,
      required this.cityList,
      required this.landList})
      : super(key: key);

  @override
  _LandSelectionScreenState createState() => _LandSelectionScreenState();
}

class CustomLoadingDialog extends StatelessWidget {
  const CustomLoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Applying Changes...'),
        ],
      ),
    );
  }
}

class _LandSelectionScreenState extends State<LandSelectionScreen> {
  late Country selectedCountry;
  late City selectedCity;
  late Land selectedLand;

  @override
  void initState() {
    super.initState();
    selectedCountry = widget.country!;
    selectedCity = widget.city!;
    selectedLand = widget.land!;
  }

  void _onCountryChanged(Country? country) {
    if (country != null) {
      setState(() {
        selectedCountry = country;
        selectedCity = widget.cityList
            .firstWhere((city) => city.country == selectedCountry);
        selectedLand =
            widget.landList.firstWhere((land) => land.city == selectedCity);
      });
    }
  }

  void applyChanges(BuildContext context) async {
    widget.applyChanges(selectedCountry, selectedCity, selectedLand);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CustomLoadingDialog();
      },
    );

    await Future.delayed(Duration(seconds: 3));
    Navigator.pop(context);
    LGService.shared?.clearKml(keepLogos: true);
    Navigator.pop(context);
  }

  void _onCityChanged(City? city) {
    if (city != null) {
      setState(() {
        selectedCity = city;
        selectedLand =
            widget.landList.firstWhere((land) => land.city == selectedCity);
      });
    }
  }

  void _onLandChanged(Land? land) {
    if (land != null) {
      setState(() {
        selectedLand = land;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text(
          'Land Selection',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
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
              Icons.south_america,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
                width: 300,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: selected,
                    border: Border.all(
                      color: Colors.black38,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.57),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: DropdownButton<Country>(
                      value: selectedCountry,
                      onChanged: _onCountryChanged,
                      dropdownColor: selected,
                      items: widget.countryList.map((Country country) {
                        return DropdownMenuItem<Country>(
                          value: country,
                          child: Text(
                            country.country,
                            style: TextStyle(
                              color: textSelected,
                              fontSize: 20,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 60,
                width: 300,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: selected,
                    border: Border.all(
                      color: Colors.black38,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.57),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: DropdownButton<City>(
                      value: selectedCity,
                      onChanged: _onCityChanged,
                      dropdownColor: selected,
                      items: widget.cityList
                          .where(
                              (city) => city.country.id == selectedCountry.id)
                          .map((City city) {
                        return DropdownMenuItem<City>(
                          value: city,
                          child: Text(
                            city.city,
                            style: const TextStyle(
                              color: textSelected,
                              fontSize: 20,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 60,
                width: 300,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: selected,
                    border: Border.all(
                      color: Colors.black38,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.57),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: DropdownButton<Land>(
                      value: selectedLand,
                      onChanged: _onLandChanged,
                      dropdownColor: selected,
                      items: widget.landList
                          .where((land) =>
                              (land.city.id == selectedCity.id) &&
                              (land.city.country.id == selectedCountry.id))
                          .map((Land land) {
                        return DropdownMenuItem<Land>(
                          value: land,
                          child: Text(
                            land.land,
                            style: const TextStyle(
                              color: textSelected,
                              fontSize: 20,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                height: 60,
                width: 300,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: selected,
                    border: Border.all(
                      color: Colors.black38,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.57),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      child: const Text(
                        "GO!",
                        style: TextStyle(
                          color: textSelected,
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        applyChanges(context);
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
