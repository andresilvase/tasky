import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app_settings/app_settings.dart';
import 'package:taski/core/widgets/popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

enum PickerAssetType { photo }

enum RequestAccess { galery, camera }

mixin Pickers {
  Future<void> pickAnAsset({
    required void Function(File?) onAssetPicked,
    required PickerAssetType pickerAssetType,
    required BuildContext context,
  }) async {
    final ImagePicker picker = ImagePicker();

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
                  text: AppLocalizations.of(context)!.takePhoto,
                  color: TaskiColors.blue,
                  onTap: () async {
                    Get.back();
                    final cameraAccessPermission = await Permission.camera.request();

                    if (cameraAccessPermission.isPermanentlyDenied) {
                      requestAccessPopup(Get.context!, RequestAccess.camera);
                    } else {
                      XFile? pic = await picker.pickImage(source: ImageSource.camera);

                      if (pic != null) onAssetPicked(File(pic.path));
                    }
                  },
                ),
                Divider(height: 32),
                selectResourceText(
                  text: AppLocalizations.of(context)!.chooseFromGallery,
                  color: isDarkMode ? TaskiColors.paleWhite : TaskiColors.statePurple,
                  onTap: () async {
                    Get.back();
                    final photosAccessPermission = await Permission.photos.request();

                    if (photosAccessPermission.isPermanentlyDenied) {
                      requestAccessPopup(Get.context!, RequestAccess.galery);
                    } else {
                      XFile? pic = await picker.pickImage(source: ImageSource.gallery);

                      if (pic != null) onAssetPicked(File(pic.path));
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

  Widget selectResourceText({required Function()? onTap, required String text, required Color color}) {
    return GestureDetector(
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
