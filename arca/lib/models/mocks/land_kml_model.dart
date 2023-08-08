import 'package:arca/models/mocks/coordinarte_kml_model.dart';

class LandKMLModel {
  final String name;
  final int landId;
  final List<CoordinateKmlModel> perimeter;
  final List<CoordinateKmlModel> path;

  LandKMLModel(
      {required this.name,
      required this.landId,
      required this.perimeter,
      required this.path});
  @override
  String toString() {
    return "LandKMLModel: {\nname = $name, \nlandId = $landId, \nperimeter = $perimeter, \npath = $path\n}";
  }
}
