import 'dart:io';
import 'package:arca/models/mocks/kml_path.dart';
import 'package:xml/xml.dart';
import 'package:xml/xpath.dart';

class KMLService {
  static void loadKMLFromFile() async{
    for(File file in KMLPath.getKMLFiles()){
      final document = XmlDocument.parse(file.readAsStringSync());
      print(document.xpath('//Folder[@name="Contorno"]'));
    }
  }

}
