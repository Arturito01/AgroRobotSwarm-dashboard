import 'city.dart';

class Land {
  final int id;
  final City city;
  final String land;
  final double long;
  final double lat;

  Land({required this.id, required this.city, required this.land, required this.long, required this.lat});

  @override
  String toString() {
    return "land: {id = $id, city = $city, land = $land}\n";
  }
}

