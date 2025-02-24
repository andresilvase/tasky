import 'package:tasky/features/auth/viewModel/auth_view_model.dart';
import 'package:tasky/core/constants/widgets_keys.dart';
import 'package:tasky/core/widgets/profile_image.dart';
import 'package:tasky/core/widgets/menu_header.dart';
import 'package:tasky/core/constants/assets.dart';
import 'package:tasky/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasky/core/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class AppHeader extends StatefulWidget {
  const AppHeader({super.key});

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Obx(() => _profile()),
    );
  }

  Widget _profile() {
    final bool isDarkMode = Theme.of(Get.context!).brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Logo(
          textColor: isDarkMode ? TaskiColors.blue10 : TaskiColors.statePurple,
          iconColor: isDarkMode ? TaskiColors.statePurple : TaskiColors.blue,
        ),
        _nameAndPhoto(),
      ],
    );
  }

  Widget _nameAndPhoto() {
    final AuthViewModel authViewModel = Get.find();

    final bool isDarkMode = Theme.of(Get.context!).brightness == Brightness.dark;
    final String displayName = authViewModel.activeUser.value.displayName;

    return MenuHeader(
      attachedWidget: Row(
        spacing: 16,
        children: [
          _name(displayName, isDarkMode),
          _photo(authViewModel),
        ],
      ),
    );
  }

  Text _name(String displayName, bool isDarkMode) {
    return Text(
      displayName.substring(0, min(displayName.length, 12)),
      key: Key(WidgetKeys.headerDisplayName),
      style: GoogleFonts.urbanist(
        color: isDarkMode ? TaskiColors.blue10 : TaskiColors.statePurple,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    );
  }

  ProfileImage _photo(AuthViewModel authViewModel) {
    return ProfileImage(
      key: Key(WidgetKeys.headerProfilePicture),
      imagePath: authViewModel.activeUser.value.photoPath != null
          ? authViewModel.activeUser.value.photoPath!
          : TaskiAssets.imageProfile,
    );
  }
}
