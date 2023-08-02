import 'package:arca/models/lands_data.dart';
import 'package:arca/models/robot.dart';
import 'package:arca/services/csv_helper.dart';
import 'package:arca/services/db_helper.dart';
import 'package:arca/services/image_loader.dart';
import 'package:arca/services/kml_service.dart';
import 'package:arca/services/land_service.dart';
import 'package:arca/services/lg_service.dart';
import 'package:arca/services/ssh_service.dart';
import 'package:arca/services/storage_service.dart';
import 'package:arca/utils/colors.dart';
import 'package:arca/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationSupportDirectory();

  final isar =
      await Isar.open([RobotSchema], directory: dir.path, inspector: true);
  DBProvider.shared = isar;
  DBProvider.deleteAllRobots();
  await CSVHelper.getRobotsFromFile();
  await LandSelection.getLandFromFile();
  StorageService.storage = await SharedPreferences.getInstance();
  LandService.storage = await SharedPreferences.getInstance();
  await SSHService.shared.initializeSSH();
  setLogos();
  clearKML();
  ImageLoader.images =
      await ImageLoader.loadImagesFromFolder('assets/gallery/vineyard');
  KMLService.loadKMLFromFile();
  runApp(const MyApp());
}

void setLogos() async {
  try {
    await LGService.shared?.setLogos();
  } catch (e) {
    print(e);
  }
}

void clearKML() async {
  try {
    await LGService.shared?.clearKml();
  } catch (e) {
    print(e);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
