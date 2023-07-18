import 'package:arca/model_views/constant_view_model.dart';
import 'package:isar/isar.dart';
import '../models/robot.dart';

class DBProvider {
  static late Isar shared;
  static List<Robot> mockedRobot = [];

  static Future<void>  addNewRobot(String name) async {
    final newRobot = Robot()..name = name;
    await shared.writeTxn(() async {
      await shared.robots.put(newRobot); // insert & update
    });
  }

  static Future<void>  addNewRobotFromCSV(Robot robot) async {
    await shared.writeTxn(() async {
      await shared.robots.put(robot); // insert & update
    });
  }

  static Future<void> deleteRobot(int robotId) async {
    await shared.writeTxn(() async {
      final robot = await shared.robots.get(robotId);
      if (robot != null) {
        await shared.robots.delete(robotId);
      }
    });
  }

  static List<Robot> getRobots(int? countrySelected, int? citySelected, int? fieldSelected) {
    if (countrySelected != null && citySelected != null && fieldSelected != null) {
      final optionalRobots = shared.robots
          .filter()
          .countryIdEqualTo(countrySelected)
          .cityIdEqualTo(citySelected)
          .landIdEqualTo(fieldSelected)
          .findAllSync();

      List<Robot> newNonOptionalList = optionalRobots.whereType<Robot>().toList();

      return newNonOptionalList;
    } else {
      // Si no se seleccionó ningún país, ciudad o terreno, devolver una lista vacía
      return [];
    }
  }

  static Future<void> deleteAllRobots() async {
    await shared.writeTxn(() async {
      await shared.robots.filter().activeEqualTo(false).deleteAll();
    });
  }
}
