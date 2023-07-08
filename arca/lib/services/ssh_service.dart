import 'package:arca/entities/ssh_entity.dart';
import 'package:ssh2/ssh2.dart';

class SSHService {
  late SSHClient client;

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
}
