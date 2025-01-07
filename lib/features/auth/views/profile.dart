import 'package:taski/features/auth/viewModel/auth_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taski/features/auth/widgets/input_text.dart';
import 'package:taski/core/widgets/screen_background.dart';
import 'package:taski/core/widgets/rounded_button.dart';
import 'package:taski/core/widgets/common_widgets.dart';
import 'package:taski/core/widgets/profile_image.dart';
import 'package:taski/core/utils/image_picker.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:taski/core/constants/assets.dart';
import 'package:taski/core/theme/controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with Pickers {
  final ThemeController themeController = Get.find();
  final AuthViewModel authViewModel = Get.find();

  late TextEditingController displayNameController;
  final FocusNode displayNameFocusNode = FocusNode();

  void _setState() => setState(() {});

  void changePhoto() {
    pickAnAsset(
      onAssetPicked: (file) {
        if (file != null) {
          authViewModel.updateUserPhoto(file.path);
        }
      },
      pickerAssetType: PickerAssetType.photo,
      context: context,
    );
  }

  @override
  void initState() {
    super.initState();

    displayNameController = TextEditingController(text: authViewModel.activeUser.value.displayName);
    displayNameController.addListener(_setState);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: AppLocalizations.of(Get.context!)!.account,
        darkMode: themeController.isDarkMode.value,
      ),
      body: SafeArea(
        child: Obx(
          () => ScreenBackground(
            screenContent: [
              SizedBox(height: 16),
              _profileImage(),
              SizedBox(height: 16),
              _displayName(),
              _username(),
              _changePhoto(),
              SizedBox(height: 32),
              _editDisplayName(),
              Spacer(),
              _saveButton(darkMode: themeController.isDarkMode.value),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileImage() {
    return GestureDetector(
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

  Widget _displayName() {
    return Visibility(
      visible: displayNameController.text.isNotEmpty,
      child: Text(
        displayNameController.text,
        style: GoogleFonts.urbanist(
          color: TaskiColors.statePurple,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _username() {
    return Text(
      authViewModel.activeUser.value.username,
      style: GoogleFonts.urbanist(
        color: TaskiColors.statePurple,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }

  Widget _changePhoto() {
    return TextButton.icon(
      icon: Icon(
        Icons.camera_alt_outlined,
        color: TaskiColors.statePurple,
      ),
      label: Text(
        AppLocalizations.of(Get.context!)!.changePhoto,
        style: GoogleFonts.urbanist(
          color: TaskiColors.statePurple,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      onPressed: changePhoto,
    );
  }

  Widget _editDisplayName() {
    return InputText(
      labelText: AppLocalizations.of(Get.context!)!.displayName,
      onInputClear: displayNameController.clear,
      controller: displayNameController,
      focusNode: displayNameFocusNode,
    );
  }

  Widget _saveButton({bool darkMode = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: RoundedButton(
        text: AppLocalizations.of(Get.context!)!.save,
        backgroundColor: darkMode ? TaskiColors.statePurple : TaskiColors.blue,
        textColor: TaskiColors.white,
        onPressed: () {
          authViewModel.updateUserDisplayName(displayNameController.text);
          Get.back();
        },
        width: Get.width,
        height: 48,
      ),
    );
  }
}
