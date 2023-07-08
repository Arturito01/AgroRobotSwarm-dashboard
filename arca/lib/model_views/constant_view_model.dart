
import '../models/robot.dart';
import '../services/db_helper.dart';


class ConstantViewModel {

 Future<void> addNewRobot(String name) async {
    await DBProvider.addNewRobot(name);
  }

  Future<void> deleteRobot(int robotId) async {
    await DBProvider.deleteRobot(robotId);
  }

  List<Robot> getRobots() {
    return DBProvider.getRobots();
  }

}
