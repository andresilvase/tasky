import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:taski/core/utils/functions.dart';

import '../../fixtures/fixtures.dart';
import '../../mocks/fake_path_provider.dart';
import '../../mocks/file_builder.dart';
import '../../mocks/mocks.mocks.dart';

import 'package:path_provider/path_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late FileBuilder fileBuilder;
  late MockFile mockSourceFile;
  late MockFile mockNewFile;

  late String destinationPath;
  late String sourcePath;

  setUp(() {
    mockSourceFile = MockFile();
    mockNewFile = MockFile();

    destinationPath = '$fakeAppPath/photo.jpg';
    sourcePath = '/path/to/source/photo.jpg';

    fileBuilder = FileBuilder(
      destinationPath: destinationPath,
      mockSourceFile: mockSourceFile,
      mockNewFile: mockNewFile,
      sourcePath: sourcePath,
    );

    PathProviderPlatform.instance = FakePathProvider();
  });

  test('saveToAppDirectory should save file and return new file path', () async {
    when(mockSourceFile.exists()).thenAnswer((_) async => true);

    when(mockSourceFile.readAsBytes()).thenAnswer((_) async => Uint8List.fromList([1, 2, 3]));

    when(mockNewFile.writeAsBytes([1, 2, 3])).thenAnswer((_) async => mockNewFile);

    final Directory appDir = await getApplicationDocumentsDirectory();

    expect(appDir.path, fakeAppPath);

    final newFilePath = await saveToAppDirectory(
      sourcePath,
      fileFactory: (path) {
        return fileBuilder.fileFactory(path: path);
      },
    );

    expect(newFilePath, destinationPath);

    verify(mockSourceFile.exists()).called(1);
    verify(mockSourceFile.readAsBytes()).called(1);
    verify(mockNewFile.writeAsBytes(Uint8List.fromList([1, 2, 3]))).called(1);
  });

  test('saveToAppDirectory should throw exception if source file does not exist', () async {
    when(mockSourceFile.exists()).thenAnswer((_) async => false);

    when(mockSourceFile.readAsBytes()).thenAnswer((_) async => Uint8List.fromList([1, 2, 3]));

    when(mockNewFile.writeAsBytes([1, 2, 3])).thenAnswer((_) async => mockNewFile);

    final Directory appDir = await getApplicationDocumentsDirectory();

    expect(appDir.path, fakeAppPath);

    expect(
      () async => await saveToAppDirectory(
        sourcePath,
        fileFactory: (path) {
          return fileBuilder.fileFactory(path: path);
        },
      ),
      throwsA(isA<FileSystemException>()),
    );
  });

  test('saveToAppDirectory should use default File constructor when fileFactory is null', () async {
    expect(
      () async => await saveToAppDirectory(sourcePath),
      throwsA(isA<FileSystemException>()),
    );
  });
}
