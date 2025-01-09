import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:taski/core/db/abstract_db.dart';
import 'package:mockito/annotations.dart';
import 'package:taski/core/utils/asset_picker.dart';
import 'package:taski/core/utils/storage_permission.dart';

@GenerateMocks([
  DevicePermission,
  AssetPicker,
  ImagePicker,
  Database,
  File,
])
void main() {}
