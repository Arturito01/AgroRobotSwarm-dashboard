import 'package:arca/models/mocks/coordinarte_kml_model.dart';

class LandKMLModel {
  final String name;
  final int id;
  final List<CoordinateKmlModel> perimeter;
  final List<CoordinateKmlModel> path;

  LandKMLModel(
      {required this.name,
      required this.id,
      required this.perimeter,
      required this.path});
  @override
  String toString() {
    return "LandKMLModel: {\nname = $name, \nid = $id, \nperimeter = $perimeter, \npath = $path\n}";
  }
}
