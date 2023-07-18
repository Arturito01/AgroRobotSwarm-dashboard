import 'package:isar/isar.dart';

part 'robot.g.dart';

@collection
class Robot {
  Id id = Isar.autoIncrement;

  int robotId = Isar.autoIncrement;

  String? name;

  int battery = 100;

  bool active = false;

  bool warnings = false;

  bool instructions = false;

  int actualKg = 0;

  double actualDistance = 0.0;

  int totalKg = 0;

  double totalDistance = 0.0;

  int landId = 0;
  int cityId = 0;
  int countryId = 0;
}
