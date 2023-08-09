import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileService {
  Future<File> createFile(String name, String content) async {
    print(content);
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$name');
    file.writeAsStringSync(content);

    return file;
  }

}
