import 'country.dart';

class City {
  final int id;
  final Country country;
  final String city;
  final double long;
  final double lat;

  City({required this.id, required this.country, required this.city, required this.long, required this.lat});

  @override
  String toString() {
    return "city: {id = $id, city = $city, country = $country}\n";
  }
}