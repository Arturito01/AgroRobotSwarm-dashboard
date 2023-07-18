import 'package:shared_preferences/shared_preferences.dart';

class LandService {
  static late SharedPreferences storage;
  static LandService shared = LandService();

  Future<void> saveLandSelection(String landId) async {
    await storage.setString('landId', landId);
  }

  Future<void> saveCountrySelection(String countryId) async {
    await storage.setString('countryId', countryId);
  }

  Future<void> saveCitySelection(String cityId) async {
    await storage.setString('cityId', cityId);
  }

  Future<Map<String, String>> getLandSelection() async {
    final countryId = await storage.getString('countryId');
    final cityId = await storage.getString('cityId');
    final landId = await storage.getString('landId');

    return {
      'countryId': countryId ?? '0',
      'cityId': cityId ?? '0',
      'landId': landId ?? '0',
    };
  }
}
