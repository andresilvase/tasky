import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';
import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';
import 'package:tasky/core/constants/widgets_keys.dart';
import 'package:tasky/core/utils/asset_picker.dart';
import 'package:tasky/core/utils/device_permission.dart';
import 'package:tasky/main.dart';

import '../test/mocks/image_picker.dart';
import '../test/mocks/permission_handler.dart';
import 'features/auth/common/create_account_common_flow.dart';
import 'features/auth/profile/update_display_name_test.dart';
import 'features/auth/profile/update_photo_profile.dart';
import 'features/common/init_app.dart';

import 'features/language/common/open_language_settings_flow.dart';
import 'features/tasks/create_task_when_list_is_empty_test.dart';

import 'features/tasks/delete_all_tasks_test.dart';
import 'features/tasks/search_task_by_description.dart';
import 'features/tasks/search_task_by_title.dart';
import 'features/tasks/complete_task_test.dart';
import 'features/tasks/create_task_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late MockPermissionHandlerPlatform permissionHandlerPlatformMock;
  late MockImagePickerPlatformMock imagePickerPlatformMock;
  late ImagePicker picker;

  setUp(() async {
    final mockedPhoto =
        '/Users/andresilva/Library/Developer/CoreSimulator/Devices/97FA45C4-4EDC-4A00-A895-A4130D13F6F9/data/Media/DCIM/100APPLE/IMG_0006.JPG';

    await init();

    permissionHandlerPlatformMock = MockPermissionHandlerPlatform();
    PermissionHandlerPlatform.instance = permissionHandlerPlatformMock;

    imagePickerPlatformMock = MockImagePickerPlatformMock();
    ImagePickerPlatform.instance = imagePickerPlatformMock;
    picker = ImagePicker();

    Get.put<DevicePermission>(
      DevicePermission(
        cameraPermission: Permission.camera,
        galeryPermission: Permission.photos,
      ),
    );

    Get.put(AssetPicker(picker));

    when(imagePickerPlatformMock.getImageFromSource(source: anyNamed('source'), options: anyNamed('options')))
        .thenAnswer((Invocation _) async => XFile(mockedPhoto));
  });

  testWidgets('#Setup Account', (tester) async {
    await initApp(tester);

    await createAccountCommon(tester);
  });

  group('#Manage Profile', () {
    testWidgets('#Update Photo Profile', (tester) async {
      await initApp(tester);

      await updatePhotoProfile(tester);
      await updateUserDisplayName(tester, saveToStorage: true);
      await Future.delayed(const Duration(seconds: 2));
    });
  });

  testWidgets('#Language - Change to Portuguese', (tester) async {
    await initApp(tester);

    await openLanguageSettings(tester);

    const String locale = 'pt';

    await tester.tap(find.byKey(const Key(locale)));
    await tester.pumpAndSettle();

    final selectedLanguageItem = find.byKey(const Key(WidgetKeys.portugueseLanguage));
    expect(selectedLanguageItem, findsOneWidget);

    final visible = tester.widget<Visibility>(selectedLanguageItem).visible;
    expect(visible, true);

    await tester.tap(find.byKey(const Key(WidgetKeys.headerCloseButton)));
    await tester.pumpAndSettle();
  });

  group('#Manage Tasks', () {
    createTaskWhenListIsEmpty();
    createTask();
    completeTask();
    searchTaskByTitle();
    searchTaskByDescription();
  });

  testWidgets('#Change to Dark Mode', (tester) async {
    await initApp(tester);

    await tester.tap(find.byKey(const Key(WidgetKeys.headerProfilePicture)));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key(WidgetKeys.menuThemeButton)));
    await tester.pumpAndSettle();
  });

  group('#Delete Tasks', () {
    deleteAllTasksAtOnce();
  });
}
