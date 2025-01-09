import 'mocks.mocks.dart';
import 'dart:io';

class FileBuilder {
  final String destinationPath;
  final MockFile mockNewFile;

  final MockFile mockSourceFile;
  final String sourcePath;

  FileBuilder({
    required this.destinationPath,
    required this.mockSourceFile,
    required this.mockNewFile,
    required this.sourcePath,
  });

  File fileFactory({required String path}) {
    if (path == sourcePath) return mockSourceFile;
    if (path == destinationPath) return mockNewFile;
    throw ArgumentError('Unexpected path: $path');
  }
}
