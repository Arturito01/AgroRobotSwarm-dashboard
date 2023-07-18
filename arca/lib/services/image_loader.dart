import 'dart:convert';
import 'package:flutter/services.dart';

class ImageLoader {
  static late List<String> images = [];
  static final List<String> _imageList = [];


  static Future<List<String>> loadImagesFromFolder(String folderPath) async {

    final manifestJson = await rootBundle.loadString('AssetManifest.json');
    final manifest = json.decode(manifestJson) as Map<String, dynamic>;

    for (final assetPath in manifest.keys) {
      if (assetPath.startsWith(folderPath) && (assetPath.endsWith('.jpg') || assetPath.endsWith('.png'))) {
        _imageList.add(assetPath);
      }
    }
    return _imageList;
  }
}