import 'package:flutter/material.dart';
import 'package:ssh2/ssh2.dart';

import '../../entities/ssh_entity.dart';
import '../../services/ssh_service.dart';
import '../../services/storage_service.dart';
import '../../utils/constants.dart';

class ConnectionSettings extends StatefulWidget {
  final void Function(bool, SSHClient?) onConnectionChanged;
  const ConnectionSettings({Key? key, required this.onConnectionChanged})
      : super(key: key);

  @override
  _ConnectionSettingsState createState() => _ConnectionSettingsState();
}

class _ConnectionSettingsState extends State<ConnectionSettings> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ipController = TextEditingController();
  final TextEditingController _portController = TextEditingController();

  final StorageService settingsService = StorageService.shared;
  final SSHService sshService = SSHService.shared;

  @override
  void initState() {
    super.initState();
    loadSavedSettings();
  }

  bool connected = false;

  Future<void> loadSavedSettings() async {
    final settings = await settingsService.getConnectionSettings();
    _usernameController.text = settings['username']!;
    _passwordController.text = settings['password']!;
    _ipController.text = settings['ipAddress']!;
    _portController.text = settings['port']!;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: defaultPadding,
            ),
            const Text(
              'Establish connection with the system',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.only(left: 300, right: 300),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.transparent),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _ipController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'IP Address',
                        prefixIcon: Icon(Icons.network_cell),
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter an IP address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _portController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Port',
                        prefixIcon: Icon(Icons.router),
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a port';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32.0),
                    ElevatedButton(
                      onPressed: () async {
                        final username = _usernameController.text;
                        final password = _passwordController.text;
                        final ipAddress = _ipController.text;
                        final port = int.parse(_portController.text);

                        final connectionSettings = SSHEntity(
                          host: ipAddress,
                          port: port,
                          username: username,
                          passwordOrKey: password,
                        );

                        await settingsService.saveConnectionSettings(
                          username,
                          password,
                          ipAddress,
                          port.toString(),
                        );
                        try {
                          await sshService.connect(connectionSettings);
                          setState(() {
                            connected = true;
                          });
                          const snackBar = SnackBar(
                              content: Text('¡Connection successful!'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          widget.onConnectionChanged(
                              connected, sshService.client);
                        } catch (e) {
                          print('Connection error : $e');
                          setState(() {
                            connected = false;
                          });
                          const snackBar =
                              SnackBar(content: Text('¡Connection error'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          widget.onConnectionChanged(connected, null);
                        }
                      },
                      child: const Text('Connect'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
