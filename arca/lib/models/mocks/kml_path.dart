import 'dart:io';

class KMLPath {
  static String argentineCa1 = "assets/kml/Argentine/Cafayate/Cafayate1.kml";
  static String argentineCa2 = "assets/kml/Argentine/Cafayate/Cafayate2.kml";
  static String argentineCa3 = "assets/kml/Argentine/Cafayate/Cafayate3.kml";
  static String argentineCa4 = "assets/kml/Argentine/Cafayate/Cafayate4.kml";
  static String argentineCa5 = "assets/kml/Argentine/Cafayate/Cafayate5.kml";

  static String argentineCc1 =
      "assets/kml/Argentine/Colonia_Caroya/Colonia_Caroya1.kml";
  static String argentineCc2 =
      "assets/kml/Argentine/Colonia_Caroya/Colonia_Caroya2.kml";
  static String argentineCc3 =
      "assets/kml/Argentine/Colonia_Caroya/Colonia_Caroya3.kml";
  static String argentineCc4 =
      "assets/kml/Argentine/Colonia_Caroya/Colonia_Caroya4.kml";
  static String argentineCc5 =
      "assets/kml/Argentine/Colonia_Caroya/Colonia_Caroya5.kml";

  static List<String> _getKMLPaths() {
    return [
      argentineCa1,
      argentineCa2,
      argentineCa3,
      argentineCa4,
      argentineCa5,
      argentineCc1,
      argentineCc2,
      argentineCc3,
      argentineCc4,
      argentineCc5,
    ];
  }

  static List<File> getKMLFiles() {
    List<File> files = [];
    for (String path in _getKMLPaths()) {
      files.add(File(path));
    }
    return files;
  }
}
