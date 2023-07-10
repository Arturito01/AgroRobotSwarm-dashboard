import 'package:arca/services/csv_helper.dart';
import 'package:arca/services/settings_service.dart';
import 'package:flutter/material.dart';

import 'package:arca/views/splash_screen.dart';

import 'package:arca/utils/colors.dart';

import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';
import 'package:arca/services/db_helper.dart';
import 'package:arca/models/robot.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationSupportDirectory();

  final isar =
      await Isar.open([RobotSchema], directory: dir.path, inspector: true);
  DBProvider.shared = isar;
  DBProvider.deleteAllRobots();
  await CSVHelper.getRobotsFromFile();
  SettingsService.storage = await SharedPreferences.getInstance();

  runApp(const MyApp());
}


/*void setLogos(LGService lgService) async {
  try {
    await lgService.setLogos();
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
}*/

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //setLogos();

    return MaterialApp(
      title: 'Agro Robot Controll App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        canvasColor: Colors.transparent,
        fontFamily: 'Poppins',
        primarySwatch: MaterialColor(
          ThemeColors.backgroundColorHex,
          ThemeColors.backgroundColorMaterial,
        ),
        scaffoldBackgroundColor: ThemeColors.backgroundColor,
      ),
      home: const SplashScreenPage(),
    );
  }
}
