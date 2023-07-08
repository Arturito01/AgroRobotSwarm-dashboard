import 'package:isar/isar.dart';
import '../models/mocks/mocked_robot.dart';
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

  static Future<void> deleteRobot(int robotId) async {
    await shared.writeTxn(() async {
      final robot = await shared.robots.get(robotId);
      if (robot != null) {
        await shared.robots.delete(robotId);
      }
    });
  }

  static List<Robot> getRobots() {
    final optionalRobots = shared.robots.where().findAllSync();
    List<Robot> newNonOptionalList = optionalRobots.whereType<Robot>().toList();

    return mockedRobot + newNonOptionalList;
  }


}
