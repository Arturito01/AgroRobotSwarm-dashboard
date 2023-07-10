import 'package:flutter/material.dart';
import 'package:ssh2/ssh2.dart';
import '../../utils/constants.dart';
import 'package:arca/services/lg_service.dart';

class LGSettings extends StatelessWidget {
  final bool connected;
  final SSHClient? sshClient;
  LGService? lgService;
  LGSettings({Key? key, required this.connected, required this.sshClient})
      : super(key: key) {
    lgService = createLGService(sshClient);
  }

  static LGService? createLGService(SSHClient? sshClient) {
    if (sshClient != null) {
      LGService.shared = LGService(sshClient);
      return LGService.shared;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    lgService?.setLogos();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: defaultPadding,
            ),
            const Text(
              'Control your system',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              connected ? "Connected" : "Disconnected",
              style: TextStyle(
                fontSize: 30,
                color: connected ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 300,
              child: ElevatedButton.icon(
                onPressed: () {lgService?.setRefresh();},
                icon: const Icon(Icons.settings),
                label: const Text('SET SLAVES REFRESH'),
              ),
            ),
            const SizedBox(height: defaultPadding),
            SizedBox(
              width: 300,
              child: ElevatedButton.icon(
                onPressed: () {lgService?.resetRefresh();},
                icon: const Icon(Icons.refresh),
                label: const Text('RESET SLAVES REFRESH'),
              ),
            ),
            const SizedBox(height: defaultPadding),
            SizedBox(
              width: 300,
              child: ElevatedButton.icon(
                onPressed: () {lgService?.clearKml();},
                icon: const Icon(Icons.clear_all),
                label: const Text('CLEAR KML + LOGOS'),
              ),
            ),
            const SizedBox(height: defaultPadding),
            SizedBox(
              width: 300,
              child: ElevatedButton.icon(
                onPressed: () {lgService?.relaunch();},
                icon: const Icon(Icons.refresh),
                label: const Text('RELAUNCH'),
              ),
            ),
            const SizedBox(height: defaultPadding),
            SizedBox(
              width: 300,
              child: ElevatedButton.icon(
                onPressed: () {lgService?.reboot();},
                icon: const Icon(Icons.restart_alt),
                label: const Text('REBOOT'),
              ),
            ),
            const SizedBox(height: defaultPadding),
            SizedBox(
              width: 300,
              child: ElevatedButton.icon(
                onPressed: () {lgService?.poweroff();},
                icon: const Icon(Icons.power_settings_new),
                label: const Text('POWER OFF'),
              ),
            ),
            const SizedBox(height: defaultPadding),
          ],
        ),
      ),
    );
  }
}
