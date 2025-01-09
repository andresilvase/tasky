import 'dart:io';

import 'package:taski/core/db/abstract_db.dart';
import 'package:mockito/annotations.dart';
import 'package:taski/core/utils/asset_picker.dart';
import 'package:taski/core/utils/storage_permission.dart';

@GenerateMocks([
  StoragePermission,
  AssetPicker,
  Database,
  File,
])
void main() {}
