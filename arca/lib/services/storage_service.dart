import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static late SharedPreferences storage;
  static StorageService shared = StorageService();

  Future<void> saveConnectionSettings(
      String username, String password, String ipAddress, String port) async {
    await storage.setString('username', username);
    await storage.setString('password', password);
    await storage.setString('ipAddress', ipAddress);
    await storage.setString('port', port);
  }

  Future<Map<String, String>> getConnectionSettings() async {
    final username = await storage.getString('username');
    final password = await storage.getString('password');
    final ipAddress = await storage.getString('ipAddress');
    final port = await storage.getString('port');

    return {
      'username': username ?? '',
      'password': password ?? '',
      'ipAddress': ipAddress ?? '',
      'port': port ?? '22',
    };
  }

}
