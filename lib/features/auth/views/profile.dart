import 'package:tasky/features/auth/viewModel/auth_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tasky/features/auth/widgets/input_text.dart';
import 'package:tasky/core/widgets/screen_background.dart';
import 'package:tasky/core/utils/device_permission.dart';
import 'package:tasky/core/widgets/rounded_button.dart';
import 'package:tasky/core/widgets/common_widgets.dart';
import 'package:tasky/core/constants/widgets_keys.dart';
import 'package:tasky/core/widgets/profile_image.dart';
import 'package:tasky/core/utils/image_picker.dart';
import 'package:tasky/core/utils/asset_picker.dart';
import 'package:tasky/core/constants/colors.dart';
import 'package:tasky/core/constants/assets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with Pickers {
  final AuthViewModel authViewModel = Get.find();

  late TextEditingController displayNameController;
  final FocusNode displayNameFocusNode = FocusNode();

  void changePhoto() {
    pickAnAsset(
      onAssetPicked: (filePath) {
        if (filePath != null) {
          authViewModel.setUserPhoto(filePath);
        }
      },
      devicePermission: Get.find<DevicePermission>(),
      pickerAssetType: PickerAssetType.photo,
      picker: Get.find<AssetPicker>(),
      context: context,
    );
  }

  @override
  void initState() {
    super.initState();

    displayNameController = TextEditingController(text: authViewModel.activeUser.value.displayName);
    displayNameController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(Get.context!).brightness == Brightness.dark;

    return Scaffold(
      appBar: commonAppBar(
        title: AppLocalizations.of(Get.context!)!.account,
        darkMode: isDarkMode,
      ),
      body: SafeArea(
        child: Obx(
          () => ScreenBackground(
            screenContent: [
              SizedBox(height: 16),
              _buildProfileSection(isDarkMode),
              SizedBox(height: 32),
              _editDisplayName(isDarkMode),
              Spacer(),
              _saveButton(isDarkMode),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection(bool isDarkMode) {
    return Column(
      children: [
        _profileImage(),
        const SizedBox(height: 16),
        _displayName(isDarkMode),
        _username(isDarkMode),
        _changePhoto(isDarkMode),
      ],
    );
  }

  Widget _profileImage() {
    return InkWell(
      key: Key(WidgetKeys.profileImage),
      onTap: changePhoto,
      child: SizedBox(
        height: 100,
        width: 100,
        child: ProfileImage(
          imagePath: authViewModel.activeUser.value.photoPath != null
              ? authViewModel.activeUser.value.photoPath!
              : TaskiAssets.imageProfile,
        ),
      ),
    );
  }

  Widget _displayName(bool isDarkMode) {
    return Visibility(
      visible: displayNameController.text.isNotEmpty,
      child: Text(
        displayNameController.text,
        style: GoogleFonts.urbanist(
          color: isDarkMode ? TaskiColors.paleWhite : TaskiColors.statePurple,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _username(bool isDarkMode) {
    return Text(
      authViewModel.activeUser.value.username,
      style: GoogleFonts.urbanist(
        color: isDarkMode ? TaskiColors.paleWhite : TaskiColors.statePurple,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }

  Widget _changePhoto(bool isDarkMode) {
    return TextButton.icon(
      key: Key(WidgetKeys.changePhoto),
      icon: Icon(
        color: isDarkMode ? TaskiColors.paleWhite : TaskiColors.statePurple,
        Icons.camera_alt_outlined,
      ),
      label: Text(
        AppLocalizations.of(Get.context!)!.changePhoto,
        style: GoogleFonts.urbanist(
          color: isDarkMode ? TaskiColors.paleWhite : TaskiColors.statePurple,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      onPressed: changePhoto,
    );
  }

  Widget _editDisplayName(bool isDarkMode) {
    return InputText(
      labelText: AppLocalizations.of(Get.context!)!.displayName,
      onChanged: (_) {
        authViewModel.setUserDisplayName(displayNameController.text);
      },
      key: Key(WidgetKeys.changeDisplayNameInput),
      onInputClear: displayNameController.clear,
      controller: displayNameController,
      focusNode: displayNameFocusNode,
      isDarkMode: isDarkMode,
    );
  }

  Widget _saveButton(bool darkMode) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: RoundedButton(
        key: Key(WidgetKeys.saveProfileButton),
        text: AppLocalizations.of(Get.context!)!.save,
        backgroundColor: darkMode ? TaskiColors.statePurple : TaskiColors.blue,
        textColor: TaskiColors.white,
        onPressed: () {
          authViewModel.updateUserData();
          Get.back();
        },
        width: Get.width,
        height: 48,
      ),
    );
  }
}
