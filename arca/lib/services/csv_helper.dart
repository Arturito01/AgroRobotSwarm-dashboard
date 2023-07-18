import 'package:arca/models/mocks/mocked_robot.dart';
import 'package:arca/services/db_helper.dart';
import 'package:csv/csv.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class CSVHelper {

  static Future<String> loadRobotAsset() async {
    return await rootBundle.loadString('assets/data/robot_data.csv');
  }

  static Future<void> getRobotsFromFile() async {
    final input = await loadRobotAsset();
    List<List<dynamic>> fields =
        const CsvToListConverter(fieldDelimiter: ';').convert(input);

    for (List<dynamic> robotFields in fields) {
      final String activeValue = robotFields[4];
      final bool active = (activeValue == 'true') ? true : false;

      final String warningsValue = robotFields[5];
      final bool warnings = (warningsValue == 'true') ? true : false;

      final String instructionsValue = robotFields[6];
      final bool instructions = (instructionsValue == 'true') ? true : false;
      final mockedRobot = MockedRobot.from(
        id: robotFields[0],
          robotId: robotFields[1],
          name: robotFields[2],
          battery: int.parse(robotFields[3].toString()),
          active: active,
          warnings: warnings,
          instructions: instructions,
          actualKg: int.parse(robotFields[7].toString()),
          actualDistance: double.parse(robotFields[8].toString()),
          totalKg: int.parse(robotFields[9].toString()),
          totalDistance: double.parse(robotFields[10].toString()),
          landId: int.parse(robotFields[11].toString()),
          cityId: int.parse(robotFields[12].toString()),
          countryId: int.parse(robotFields[13].toString()));
      DBProvider.addNewRobotFromCSV(mockedRobot);
    }
  }
}
