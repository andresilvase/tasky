import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:taski/core/utils/storage_permission.dart';
import 'package:taski/core/constants/widgets_keys.dart';
import 'package:taski/core/utils/asset_picker.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app_settings/app_settings.dart';
import 'package:taski/core/widgets/popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum PickerAssetType { photo }

enum RequestAccess { galery, camera }

mixin Pickers {
  Future<void> pickAnAsset({
    required void Function(String? filePath) onAssetPicked,
    required StoragePermission storagePermission,
    required PickerAssetType pickerAssetType,
    required BuildContext context,
    required AssetPicker picker,
  }) async {
    showDialog(
      context: context,
      builder: (context) {
        final bool isDarkMode = Theme.of(Get.context!).brightness == Brightness.dark;

        return AlertDialog(
          content: SizedBox(
            height: 68,
            child: Column(
              children: [
                selectResourceText(
                  key: const Key(WidgetKeys.pickAssetFromCamera),
                  text: AppLocalizations.of(context)!.takePhoto,
                  color: TaskiColors.blue,
                  onTap: () async {
                    Get.back();

                    final cameraAccessPermission = await storagePermission.requestCameraPermission();

                    if (cameraAccessPermission.isPermanentlyDenied) {
                      requestAccessPopup(Get.context!, RequestAccess.camera);
                    } else {
                      XFile? pic = await picker.pickImage(source: ImageSource.camera);

                      onAssetPicked(pic?.path);
                    }
                  },
                ),
                Divider(height: 32),
                selectResourceText(
                  key: const Key(WidgetKeys.pickAssetFromGalery),
                  text: AppLocalizations.of(context)!.chooseFromGallery,
                  color: isDarkMode ? TaskiColors.paleWhite : TaskiColors.statePurple,
                  onTap: () async {
                    Get.back();
                    final galleryAccessPermission = await storagePermission.requestGaleryPermission();

                    if (galleryAccessPermission.isPermanentlyDenied) {
                      requestAccessPopup(Get.context!, RequestAccess.galery);
                    } else {
                      XFile? pic = await picker.pickImage(source: ImageSource.gallery);

                      onAssetPicked(pic?.path);
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget selectResourceText({
    required Function()? onTap,
    required String text,
    required Color color,
    required Key key,
  }) {
    return InkWell(
      key: key,
      onTap: onTap,
      child: SizedBox(
        height: 18,
        width: Get.width,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.0,
            color: color,
          ),
        ),
      ),
    );
  }

  void requestAccessPopup(BuildContext context, RequestAccess requestAccess) async {
    return await showDialog(
      context: context,
      builder: (ctx) {
        final message = requestAccess == RequestAccess.camera
            ? AppLocalizations.of(context)!.requestCameraAccess
            : AppLocalizations.of(context)!.requestGalleryAccess;

        return PopUpMessage(
          key: Key(WidgetKeys.requestAccessPopup),
          confirmAction: () {
            AppSettings.openAppSettings(type: AppSettingsType.internalStorage);
            Get.back();
          },
          backGroundColor: TaskiColors.blue10,
          title: 'Solicitação de acesso',
          denyAction: () => Get.back(),
          confirmText: AppLocalizations.of(context)!.yes,
          denyText: AppLocalizations.of(context)!.no,
          message: message,
        );
      },
    );
  }
}
