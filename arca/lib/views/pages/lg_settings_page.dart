import 'package:arca/services/lg_service.dart';
import 'package:arca/services/ssh_service.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class LGSettingsPage extends StatelessWidget {
  LGSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LGService.shared?.setLogos();
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
                SSHService.shared.connected ? "Connected" : "Disconnected",
                style: TextStyle(
                  fontSize: 30,
                  color: SSHService.shared.connected ? Colors.green : Colors
                      .red,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 300,
                child: ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Confirmation'),
                          content: Text('Are you sure you want to set slaves refresh?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                LGService.shared?.setRefresh();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.settings),
                  label: const Text('SET SLAVES REFRESH'),
                ),
              ),
              const SizedBox(height: defaultPadding),
              SizedBox(
                width: 300,
                child: ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Confirmation'),
                          content: Text('Are you sure you want to reset slaves refresh?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                LGService.shared?.setRefresh();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('RESET SLAVES REFRESH'),
                ),
              ),
              const SizedBox(height: defaultPadding),
              SizedBox(
                width: 300,
                child: ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Confirmation'),
                          content: Text('Are you sure you want to clear kml and logos?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                LGService.shared?.clearKml();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.clear_all),
                  label: const Text('CLEAR KML + LOGOS'),
                ),
              ),
              const SizedBox(height: defaultPadding),
              SizedBox(
                width: 300,
                child: ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Confirmation'),
                          content: Text('Are you sure you want to relaunch?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                LGService.shared?.relaunch();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('RELAUNCH'),
                ),
              ),
              const SizedBox(height: defaultPadding),
              SizedBox(
                width: 300,
                child: ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Confirmation'),
                          content: Text('Are you sure you want to reboot?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                LGService.shared?.reboot();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.restart_alt),
                  label: const Text('REBOOT'),
                ),
              ),
              const SizedBox(height: defaultPadding),
              SizedBox(
                width: 300,
                child: ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Confirmation'),
                          content: Text('Are you sure you want to poweroff?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                LGService.shared?.poweroff();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.power_settings_new),
                  label: const Text('POWER OFF'),
                ),
              ),
              const SizedBox(height: defaultPadding),

              const SizedBox(height: defaultPadding),
            ],
          ),
        ),
      );

  }
}
