import 'package:arca/models/mocks/mocked_robot.dart';
import 'package:csv/csv.dart';
import '../models/robot.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class CSVHelper {
  static Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/data/prueba.csv');
  }

  static Future<List<Robot>> getRobotsFromFile() async {
    final input = await loadAsset();
    List<List<dynamic>> fields =
        const CsvToListConverter(fieldDelimiter: ';').convert(input);

    final List<Robot> robots = [];

    for (List<dynamic> robotFields in fields) {
      final String activeValue = robotFields[3];
      final bool active = (activeValue == 'true') ? true : false;

      final String warningsValue = robotFields[4];
      final bool warnings = (warningsValue == 'true') ? true : false;

      final String instructionsValue = robotFields[5];
      final bool instructions = (instructionsValue == 'true') ? true : false;
      final mockedRobot = MockedRobot.from(
          id: robotFields[0],
          name: robotFields[1],
          battery: int.parse(robotFields[2].toString()),
          active: active,
          warnings: warnings,
          instructions: instructions,
          actualKg: int.parse(robotFields[6].toString()),
          actualDistance: double.parse(robotFields[7].toString()),
          totalKg: int.parse(robotFields[8].toString()),
          totalDistance: double.parse(robotFields[9].toString()),
          landId: int.parse(robotFields[10].toString()),
          cityId: int.parse(robotFields[11].toString()),
          countryId: int.parse(robotFields[12].toString()));
      robots.add(mockedRobot);
    }

    return robots;
  }
}
