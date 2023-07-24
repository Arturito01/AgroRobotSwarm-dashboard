import 'package:arca/models/lands_data.dart';
import '../models/city.dart';
import '../models/country.dart';
import '../models/land.dart';
import '../models/robot.dart';
import '../services/db_helper.dart';

class ConstantViewModel {
  Future<void> addNewRobot(String name, int countryId, int cityId, int landId, int id) async {
    await DBProvider.addNewRobot(name, countryId, cityId, landId, id);
  }

  Future<void> deleteRobot(int robotId) async {
    await DBProvider.deleteRobot(robotId);
  }

  List<Robot> getRobots() {

    return DBProvider.getRobots(countrySelected?.id, citySelected?.id, landSelected?.id);
  }

  late List<Country> countries;
  late List<City> cities;
  late List<Land> lands;

  Country? countrySelected;
  City? citySelected;
  Land? landSelected;

  ConstantViewModel() {
    countries = LandSelection.countries;
    cities = LandSelection.cities;
    lands = LandSelection.lands;

    if (countries.isNotEmpty) {
      countrySelected = countries[0];
    }

    if (cities.isNotEmpty) {
      citySelected = cities[0];
    }

    if (lands.isNotEmpty) {
      landSelected = lands[0];
    }
  }
  Country getCountryById(int id){
    return countries[id];
  }
  City getCityById(int id){
    return cities[id];
  }
  Land getLandById(int id){
    return lands[id];
  }
}
