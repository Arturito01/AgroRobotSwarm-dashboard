import 'package:arca/model_views/constant_view_model.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../utils/constants.dart';

class FieldScreen extends StatefulWidget {
  const FieldScreen({super.key});

  @override
  _FieldScreenState createState() => _FieldScreenState();
}

class _FieldScreenState extends State<FieldScreen> {
  final ConstantViewModel viewModel = ConstantViewModel();


/*  void _loadData()  {
    viewModel.loadCSVData();
  }*/

  @override
  Widget build(BuildContext context) {
    //_loadData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text('Field Selection',
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
              Icons.south_america,
              color: Colors.white,
            ),
          )
        ],
      ),
      body:Container()); /** Center(child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DropdownButton<Country>(
            value: selectedCountry,
            hint: const Text('Select a country', style: TextStyle(color: Colors.white),),
            onChanged: (Country? country) {
              setState(() {
                selectedCountry = country;
                selectedCity = null;
                selectedField = null;
              });
            },
            items: _buildCountryDropdownItems(),
          ),
          DropdownButton<City>(
            value: selectedCity,
            hint: const Text('Select a city', style: TextStyle(color: Colors.white)),
            onChanged: (City? city) {
              setState(() {
                selectedCity = city;
                selectedField = null;
              });
            },
            items: _buildCityDropdownItems(),
          ),
          DropdownButton<Field>(
            value: selectedField,
            hint: const Text('Select a field', style: TextStyle(color: Colors.white)),
            onChanged: (Field? field) {
              setState(() {
                selectedField = field;
              });
            },
            items: _buildFieldDropdownItems(),
          ),
        ],
      ),)**/

  }
/**
  List<DropdownMenuItem<Country>> _buildCountryDropdownItems() {
    final countries = viewModel.getCountries();
    return countries.map((country) {
      return DropdownMenuItem<Country>(
        value: country,
        child: Text(country.name),
      );
    }).toList();
  }

  List<DropdownMenuItem<City>> _buildCityDropdownItems() {
    if (selectedCountry == null) {
      return [];
    }

    final cities = viewModel.getCitiesForCountry(selectedCountry);
    return cities.map((city) {
      return DropdownMenuItem<City>(
        value: city,
        child: Text(city.name),
      );
    }).toList();
  }
  List<DropdownMenuItem<Field>> _buildFieldDropdownItems() {
    if (selectedCity == null) {
      return [];
    }

    final fields = viewModel.getFieldsForCity(selectedCity);
    return fields.map((field) {
      return DropdownMenuItem<Field>(
        value: field,
        child: Text(field.name),
      );
    }).toList();
  }**/
}