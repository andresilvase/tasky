import 'package:taski/features/auth/viewModel/auth_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taski/features/auth/widgets/input_text.dart';
import 'package:taski/core/widgets/screen_background.dart';
import 'package:taski/core/widgets/rounded_button.dart';
import 'package:taski/core/widgets/common_widgets.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthViewModel authViewModel = Get.find();

  late TextEditingController displayNameController;
  final FocusNode displayNameFocusNode = FocusNode();

  void _setState() => setState(() {});

  @override
  void initState() {
    super.initState();

    displayNameController = TextEditingController(text: authViewModel.activeUser.value.displayName);
    displayNameController.addListener(_setState);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(AppLocalizations.of(Get.context!)!.account),
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
              _saveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileImage() {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: TaskiColors.blue,
        image: DecorationImage(
          image: NetworkImage(authViewModel.activeUser.value.photoURL ?? ''),
          fit: BoxFit.cover,
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
    return TextButton(
      onPressed: () {},
      child: TextButton.icon(
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
        onPressed: () {},
      ),
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

  Widget _saveButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: RoundedButton(
        text: AppLocalizations.of(Get.context!)!.save,
        backgroundColor: TaskiColors.blue,
        textColor: TaskiColors.white,
        onPressed: () {
          // authViewModel.updateDisplayName(displayNameController.text);
          Get.back();
        },
        width: Get.width,
        height: 48,
      ),
    );
  }
}
