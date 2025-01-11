import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:tasky/core/utils/device_permission.dart';
import 'package:tasky/core/utils/asset_picker.dart';
import 'package:tasky/core/db/abstract_db.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter/material.dart';
import 'dart:io';

@GenerateMocks([
  BuildContext,
  DevicePermission,
  AssetPicker,
  Database,
  File,
], customMocks: <MockSpec<dynamic>>[
  MockSpec<ImagePickerPlatform>()
])
void main() {}
