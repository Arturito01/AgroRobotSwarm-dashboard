import 'dart:io';

import 'package:arca/models/lands_data.dart';
import 'package:arca/models/mocks/coordinarte_kml_model.dart';
import 'package:arca/models/mocks/kml_path.dart';
import 'package:xml/xml.dart';

import '../models/land.dart';

class KMLService {
  List<Land> lands = [];
  static void loadKMLFromFile() async {
    final files = await KMLPath.getKMLFiles();
    for (File file in files) {
      final document = XmlDocument.parse(await file.readAsString());
      final folders = document.findAllElements('Folder');
      int counter = 0;
      XmlElement? name;
      String cityName = "";
      int landId = 0;
      List<CoordinateKmlModel> perimeterList = [];
      List<CoordinateKmlModel> pathList = [];

      for (XmlElement folder in folders) {
        if (counter == 0) {
          // Get names
          name = folder.getElement("name");
          final children = name!.children[0].toString().split(" ").toList();
          cityName = children[0];
          landId = int.parse(children[1]);
        } else if (counter == 1) {
          // Get contornos
          name = folder.getElement("name");
          final placemarks = folder.findAllElements("Placemark");
          for (XmlElement point in placemarks) {
            final points = point.findAllElements("Point");
            for (XmlElement coordinates in points) {
              final coord = coordinates.getElement("coordinates");
              final children = coord!.children[0]
                  .toString()
                  .split(",")
                  .map((e) => double.parse(e))
                  .toList();
              final coordinate = CoordinateKmlModel(children);
              perimeterList.add(coordinate);
            }
          }
        } else if (counter == 2) {
          // Get puntos
          name = folder.getElement("name");
          final placemarks = folder.findAllElements("Placemark");
          for (XmlElement point in placemarks) {
            final points = point.findAllElements("Point");
            for (XmlElement coordinates in points) {
              final coord = coordinates.getElement("coordinates");
              final children = coord!.children[0]
                  .toString()
                  .split(",")
                  .map((e) => double.parse(e))
                  .toList();
              final coordinate = CoordinateKmlModel(children);
              pathList.add(coordinate);
            }
          }
        }
        if (counter == 2) {
          try {
            final land = LandSelection.lands.firstWhere((element) =>
                cityName == element.city.city && landId == element.id);
            land.perimeter = perimeterList;
            land.path = pathList;
            print(land);
          } catch (error) {
            print(error);
          }
          perimeterList = [];
          pathList = [];
          counter = 0;
        } else {
          counter += 1;
        }
      }
    }
  }
}
