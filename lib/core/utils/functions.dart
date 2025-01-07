import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<String> saveToAppDirectory(String path) async {
  final appDirectory = await getApplicationDocumentsDirectory();
  final fileName = path.split('/').last;
  final newPath = '${appDirectory.path}/$fileName';
  final file = File(newPath);
  await file.writeAsBytes(await file.readAsBytes());
  return newPath;
}
