import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<String> saveToAppDirectory(String path, {File Function(String)? fileFactory}) async {
  try {
    final appDirectory = await getApplicationDocumentsDirectory();

    final fileName = path.split('/').last;

    final newPath = '${appDirectory.path}/$fileName';

    final fileCreator = fileFactory ?? (path) => File(path);

    final file = fileCreator(path);

    if (!await file.exists()) {
      throw FileSystemException('Source file does not exist', newPath);
    }

    final bytes = await file.readAsBytes();

    final newFile = fileCreator(newPath);
    await newFile.writeAsBytes(bytes);

    return newPath;
  } catch (e) {
    rethrow;
  }
}
