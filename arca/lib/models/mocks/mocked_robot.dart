import '../robot.dart';

class MockedRobot {
  static Robot from(
      {required int id,
      required String name,
      required int battery,
      required bool active,
      required bool warnings,
      required bool instructions,
      required int actualKg,
      required double actualDistance,
      required int totalKg,
      required double totalDistance,
      required int landId,
      required int cityId,
      required int countryId}) {
    final finalRobot = Robot();
    finalRobot.id= id;
    finalRobot.name = name;
    finalRobot.battery = battery;
    finalRobot.active = active;
    finalRobot.warnings = warnings;
    finalRobot.instructions = instructions;
    finalRobot.actualKg = actualKg;
    finalRobot.actualDistance = actualDistance;
    finalRobot.totalKg = totalKg;
    finalRobot.totalDistance = totalDistance;
    finalRobot.landId = landId;
    finalRobot.cityId = cityId;
    finalRobot.countryId = countryId;

    return finalRobot;
  }
}
