import 'dart:io';

import 'package:arca/models/mocks/kml_path.dart';
import 'package:xml/xml.dart';

class KMLService {
  static void loadKMLFromFile() async {
    for (File file in KMLPath.getKMLFiles()) {
      final document = XmlDocument.parse(await file.readAsString());
      final folders = document.findAllElements('Folder');
      int counter = 0;
      XmlElement? name;

      for (XmlElement folder in folders) {
        if (counter == 0) {
          // Get names
          name = folder.getElement("name");
        } else if (counter == 1) {
          // Get contornos
          name = folder.getElement("name");
          print(folder);
        } else if (counter == 2) {
          // Get puntos
          name = folder.getElement("name");
        }
        if (counter == 2) {
          counter = 0;
        } else {
          counter += 1;
        }
        print(name);
      }
    }
  }
}
