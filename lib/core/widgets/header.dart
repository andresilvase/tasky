import 'package:taski/features/auth/viewModel/auth_view_model.dart';
import 'package:taski/core/widgets/profile_image.dart';
import 'package:taski/core/widgets/menu_header.dart';
import 'package:taski/core/constants/assets.dart';
import 'package:taski/core/theme/controller.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taski/core/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'dart:io';

class AppHeader extends StatefulWidget {
  const AppHeader({super.key});

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Platform.isAndroid ? 24.0 : 0,
        horizontal: 16.0,
      ),
      child: Obx(() => _profile(darkMode: Get.find<ThemeController>().isDarkMode.value)),
    );
  }

  Widget _profile({bool darkMode = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(child: Logo(logoColor: darkMode ? TaskiColors.statePurple : TaskiColors.blue)),
        _nameAndPhoto(),
      ],
    );
  }

  Widget _nameAndPhoto() {
    final AuthViewModel authViewModel = Get.find();
    final String displayName = authViewModel.activeUser.value.displayName;

    return MenuHeader(
      attachedWidget: Row(
        spacing: 16,
        children: [
          Text(
            displayName.substring(0, min(displayName.length, 12)),
            style: GoogleFonts.urbanist(
              color: TaskiColors.statePurple,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          ProfileImage(
            imagePath: authViewModel.activeUser.value.photoPath != null
                ? authViewModel.activeUser.value.photoPath!
                : TaskiAssets.imageProfile,
          ),
        ],
      ),
    );
  }
}
