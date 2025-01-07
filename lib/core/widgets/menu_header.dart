import 'package:taski/features/auth/viewModel/auth_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taski/features/home/controller.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taski/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuHeader extends StatelessWidget {
  MenuHeader({super.key, required this.attachedWidget});

  final List<String> _menuOptionsTitle = [
    AppLocalizations.of(Get.context!)!.account,
    AppLocalizations.of(Get.context!)!.language,
    AppLocalizations.of(Get.context!)!.logout,
  ];

  final List<IconData> _menuOptionsIcons = [
    Icons.person,
    Icons.language,
    Icons.logout,
  ];

  final Widget attachedWidget;

  Widget menuBuilder(context, controller, child) {
    return GestureDetector(
      onTap: () {
        if (!controller.isOpen) {
          controller.open();
        } else {
          controller.close();
        }
      },
      child: child!,
    );
  }

  void logout() {
    Get.find<AuthViewModel>().logout();
    Get.find<HomeController>().backToHome();
  }

  void languageSettings() {
    Get.toNamed(Routes.language);
  }

  void onMenuOptionPressed(int index) {
    switch (index) {
      case 0:
        // TODO: Implement account
        break;
      case 1:
        languageSettings();
        break;
      case 2:
        logout();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      style: MenuStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        elevation: WidgetStateProperty.all(4),
      ),
      menuChildren: _menuChildren(),
      alignmentOffset: const Offset(0, 8),
      builder: menuBuilder,
      child: attachedWidget,
    );
  }

  List<Widget> _menuChildren() {
    return List.generate(
      _menuOptionsTitle.length,
      (index) => menuOption(
        onPressed: () => onMenuOptionPressed(index),
        optionTitle: _menuOptionsTitle[index],
        icon: _menuOptionsIcons[index],
      ),
    );
  }

  MenuItemButton menuOption({
    required Function()? onPressed,
    required String optionTitle,
    required IconData icon,
  }) {
    return MenuItemButton(
      onPressed: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 4,
        children: [
          Icon(
            icon,
            color: TaskiColors.mutedAzure,
          ),
          Text(
            optionTitle,
            style: menuTextStyle(),
          ),
        ],
      ),
    );
  }

  TextStyle menuTextStyle() {
    return GoogleFonts.urbanist(
      color: TaskiColors.stateBlue,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    );
  }
}
