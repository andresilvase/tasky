import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:mockito/mockito.dart';
import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';
import 'package:tasky/core/constants/assets.dart';
import 'package:tasky/core/constants/widgets_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart';
import 'package:tasky/core/utils/asset_picker.dart';
import 'package:tasky/core/utils/device_permission.dart';
import 'package:tasky/main.dart';

import '../../../../test/mocks/image_picker.dart';
import '../../../../test/mocks/permission_handler.dart';
import '../common/create_account_common_flow.dart';

Future<void> updatePhotoProfile(WidgetTester tester) async {
  await tester.tap(find.byKey(const Key(WidgetKeys.headerProfilePicture)));
  await tester.pumpAndSettle();

  await tester.tap(find.byKey(const Key(WidgetKeys.menuAccountButton)));
  await tester.pumpAndSettle();

  await tester.tap(find.byKey(const Key(WidgetKeys.changePhoto)));
  await tester.pumpAndSettle();

  await tester.tap(find.byKey(const Key(WidgetKeys.pickAssetFromGalery)));
  await tester.pumpAndSettle();
}
