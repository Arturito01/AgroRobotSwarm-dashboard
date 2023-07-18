import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

import 'city.dart';
import 'country.dart';
import 'land.dart';

class LandSelection {
  static List<Country> countries = [];
  static List<City> cities = [];
  static List<Land> lands = [];

  static Future<String> loadLandAsset() async {
    return await rootBundle.loadString('assets/data/land_data.csv');
  }

  static Future<void> getLandFromFile() async {
    final input = await loadLandAsset();
    List<List<dynamic>> fields =
        const CsvToListConverter(fieldDelimiter: ';').convert(input);

    Set<String> addedCountryName = {};
    Set<String> addedCityName = {};

    for (int i = 0; i < fields.length; i++) {
      final countryId = fields[i][1] as int;
      final cityId = fields[i][2] as int;
      final landId = fields[i][3] as int;
      final countryName = fields[i][4] as String;
      final countryLongitude = fields[i][5] as double;
      final countryLatitude = fields[i][6] as double;
      final cityName = fields[i][7] as String;
      final cityLongitude = fields[i][8] as double;
      final cityLatitude = fields[i][9] as double;
      final landName = fields[i][10] as String;

      Country country;
      if (!addedCountryName.contains(countryName)) {
        country = Country(
            id: countryId,
            country: countryName,
            long: countryLongitude,
            lat: countryLatitude);
        countries.add(country);
        addedCountryName.add(countryName);
      } else {
        country = countries.firstWhere((c) => c.country == countryName);
      }

      City city;
      if (!addedCityName.contains(cityName)) {
        city = City(
            id: cityId,
            country: country,
            city: cityName,
            long: cityLongitude,
            lat: cityLatitude);
        cities.add(city);
        addedCityName.add(cityName);
      } else {
        city = cities.firstWhere((c) => c.city == cityName);
      }

      Land land;
      land = Land(id: landId, city: city, land: landName);
      lands.add(land);

    }
  }
}
