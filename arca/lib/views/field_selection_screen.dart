import 'package:flutter/material.dart';
import 'package:arca/model_views/constant_view_model.dart';
import 'package:arca/utils/constants.dart';
import '../models/city.dart';
import '../models/country.dart';
import '../models/land.dart';

class FieldScreen extends StatefulWidget {
  final ConstantViewModel viewModel;
  const FieldScreen({Key? key, required this.viewModel}) : super(key: key);

  @override
  _LandSelectionState createState() => _LandSelectionState();
}

class _LandSelectionState extends State<FieldScreen> {
  Country? selectedCountry;
  City? selectedCity;
  Land? selectedLand;

  @override
  void initState() {
    super.initState();
    selectedCountry = widget.viewModel.countrySelected;
    selectedCity = widget.viewModel.citySelected;
    selectedLand = widget.viewModel.landSelected;
  }

  void _onCountryChanged(Country? country) {
    setState(() {
      selectedCountry = country;
      selectedCity = widget.viewModel.cities.firstWhere((city) => city.country == selectedCountry);
      selectedLand = widget.viewModel.lands.firstWhere((land) => land.city == selectedCity);
      widget.viewModel.countrySelected = country;
      widget.viewModel.citySelected = widget.viewModel.cities.firstWhere((city) => city.country == selectedCountry);
      widget.viewModel.landSelected = widget.viewModel.lands.firstWhere((land) => land.city == selectedCity);
    });
  }

  void _onCityChanged(City? city) {
    setState(() {
      selectedCity = city;
      selectedLand = widget.viewModel.lands.firstWhere((land) => land.city == selectedCity);
      widget.viewModel.citySelected = city;
      widget.viewModel.landSelected = widget.viewModel.lands.firstWhere((land) => land.city == selectedCity);

    });
  }

  void _onLandChanged(Land? land) {
    setState(() {
      selectedLand = land;
      widget.viewModel.landSelected = land;
    });
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
                      items: widget.viewModel.countries.map((Country country) {
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
                      items: widget.viewModel.cities
                          .where(
                              (city) => city.country.id == selectedCountry?.id)
                          .map((City city) {
                        return DropdownMenuItem<City>(
                          value: city,
                          child: Text(
                            city.city,
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
                      items: widget.viewModel.lands
                          .where((land) => (land.city.id == selectedCity?.id) && (land.city.country.id == selectedCountry?.id))
                          .map((Land land) {
                        return DropdownMenuItem<Land>(
                          value: land,
                          child: Text(
                            land.land,
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
            ],
          ),
        ),
      ),
    );
  }
}
