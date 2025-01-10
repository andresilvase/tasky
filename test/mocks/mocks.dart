import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasky/core/db/abstract_db.dart';
import 'package:mockito/annotations.dart';
import 'package:tasky/core/utils/asset_picker.dart';
import 'package:tasky/core/utils/storage_permission.dart';

@GenerateMocks([
  BuildContext,
  DevicePermission,
  AssetPicker,
  ImagePicker,
  Database,
  File,
])
void main() {}
