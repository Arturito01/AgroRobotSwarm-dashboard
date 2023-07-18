import 'city.dart';

class Land {
  final int id;
  final City city;
  final String land;

  Land({required this.id, required this.city, required this.land});

  @override
  String toString() {
    return "land: {id = $id, city = $city, land = $land}\n";
  }
}

