import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<String> saveToAppDirectory(String path) async {
  try {
    final appDirectory = await getApplicationDocumentsDirectory();

    final fileName = path.split('/').last;

    final newPath = '${appDirectory.path}/$fileName';

    final file = File(path);

    if (!await file.exists()) {
      throw FileSystemException('Source file does not exist', newPath);
    }

    final bytes = await file.readAsBytes();

    final newFile = File(newPath);
    await newFile.writeAsBytes(bytes);

    return newPath;
  } catch (e) {
    rethrow;
  }
}
