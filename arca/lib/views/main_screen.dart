import 'package:arca/views/admin_screen.dart';
import 'package:arca/views/field_selection_screen.dart';
import 'package:arca/views/pages/empty_page.dart';
import 'package:arca/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:arca/model_views/constant_view_model.dart';
import 'package:arca/utils/constants.dart';
import 'package:ssh2/ssh2.dart';
import '../models/robot.dart';
import 'pages/robot_detail_page.dart';
import 'calendar_screen.dart';
import 'gallery_screen.dart';
import 'global_info_screen.dart';
import 'info_screen.dart';
import 'map_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainState();
}

class _MainState extends State<MainScreen> {
  final ConstantViewModel viewModel = ConstantViewModel();
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;
  String robotName = "";
  String bodyContent = 'Main';

  Future<void> _incrementCounter(String robotName) async {
    await viewModel.addNewRobot(robotName);
    setState(() {});
  }

  Future<void> _deleteRobot(int robotId) async {
    await viewModel.deleteRobot(robotId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final robots = viewModel.getRobots();
    final appBar = AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: Image.asset('assets/images/arca-no-text.png'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SplashScreenPage()),
              );
            },
          );
        },
      ),
      backgroundColor: secondaryColor,
      toolbarHeight: 60,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      padding: const EdgeInsets.all(defaultPadding),
                      decoration: const BoxDecoration(color: notSelected),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      if (robots.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("YOU DON'T HAVE ROBOTS"),
                              content:
                                  Text('Add robots on the bottom right page'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cerrar'),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GlobalInfoWidget(
                                    robots: viewModel.getRobots())));
                      }
                    },
                    child: const Text(
                      'GLOBAL INFO',
                      style: TextStyle(color: textNotSelected),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(color: notSelected),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GalleryScreen()));
                    },
                    child: const Text(
                      'GALLERY',
                      style: TextStyle(color: textNotSelected),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(color: notSelected),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MapScreen()));
                    },
                    child: const Text(
                      'MAP',
                      style: TextStyle(color: textNotSelected),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(color: notSelected),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CalendarScreen()));
                    },
                    child: const Text(
                      'CALENDAR',
                      style: TextStyle(color: textNotSelected),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 480),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.south_america, color: Colors.white, size: 30),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FieldScreen()),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.info, color: Colors.white, size: 30),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const InfoScreen()));
          },
        ),
        IconButton(
          icon: const Icon(Icons.settings, color: Colors.white, size: 30),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AdminScreen()),
            );
          },
        ),
      ],
    );

    if (robots.isEmpty) {
      return Scaffold(
        appBar: appBar,
        body: const EmptyPage(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddRobotDialog(context);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
    } else if (robots.length == 1) {
      return Scaffold(
        appBar: appBar,
        body: Stack(
          children: [
            Positioned.fill(
              child: RobotDetailPage(
                  robot: robots[0],
                  deletePressed: () {
                    _deleteRobot(robots[0].id);
                  }),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddRobotDialog(context);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
    } else {
      return Scaffold(
        appBar: appBar,
        bottomNavigationBar: NavigationBar(
          labelBehavior: labelBehavior,
          selectedIndex: currentPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          destinations: getDestinations(robots),
        ),
        body: Stack(
          children: [
            Positioned.fill(
                child: RobotDetailPage(
                    robot: robots[currentPageIndex],
                    deletePressed: () {
                      _deleteRobot(robots[currentPageIndex].id);
                    })),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddRobotDialog(context);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
    }
  }

  void _showAddRobotDialog(BuildContext context) {
    //poner en page
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Agregar Robot'),
          content: TextField(
            onChanged: (value) {
              robotName =
                  value; // Actualizar el valor del nombre del robot al escribir en el TextField
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Cerrar el pop-up sin guardar el robot
              },
            ),
            TextButton(
              child: const Text(
                'Agregar',
              ),
              onPressed: () {
                _incrementCounter(robotName);
                Navigator.of(context)
                    .pop(); // Cerrar el pop-up después de agregar el robot
              },
            ),
          ],
        );
      },
    );
  }

  List<NavigationDestination> getDestinations(List<Robot?> robots) {
    List<NavigationDestination> array = [];
    for (int i = 0; i < robots.length; i++) {
      final navigation = NavigationDestination(
        icon: const Icon(Icons.fire_truck_outlined),
        label: robots[i]?.name ?? "",
      );
      array.add(navigation);
    }
    return array;
  }
}
