import 'package:arca/entities/ssh_entity.dart';
import 'package:arca/services/lg_service.dart';
import 'package:arca/services/storage_service.dart';
import 'package:ssh2/ssh2.dart';

class SSHService {
  late SSHClient client;
  bool connected = false;
  static SSHService shared = SSHService();

  Future<void> connect(SSHEntity connectionSettings) async {
    client = SSHClient(
      host: connectionSettings.host,
      port: connectionSettings.port,
      username: connectionSettings.username,
      passwordOrKey: connectionSettings.passwordOrKey,
    );
    await client.connect();
  }

  Future<String?> executeCommand(String command) async {
    return await client.execute(command);
  }

  Future<void> disconnect() async {
    await client.disconnect();
  }

  Future<void> initializeSSH() async {
    final map = await StorageService.shared.getConnectionSettings();
    final username = map["username"] ?? "";
    final password = map["password"] ?? "";
    final ipAddress = map["ipAddress"] ?? "";
    final port = int.parse(map["port"] ?? "22");

    final connectionSettings = SSHEntity(
      host: ipAddress,
      port: port,
      username: username,
      passwordOrKey: password,
    );

    try {
      await connect(connectionSettings);
      LGService.shared = LGService(client);
      print("Connection ssh done!");
      connected = true;
    } catch (e) {
      print('Connection ssh error : $e');
      connected = false;
    }
  }

  Future<void> upload(String filePath) async {

      await client.sftpUpload(
          path: filePath,
          toPath: '/var/www/html',
          callback: (progress) {
            print('Sent $progress');
          });

  }
}
