import 'package:flutter/services.dart';

class KMLService {
  Future<String> loadKMLFromFile(String filePath) async {
    return await rootBundle.loadString(filePath);
  }
}
