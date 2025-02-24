import 'package:tasky/features/auth/viewModel/auth_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tasky/core/constants/widgets_keys.dart';
import 'package:tasky/features/home/controller.dart';
import 'package:tasky/core/constants/colors.dart';
import 'package:tasky/core/theme/controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasky/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuHeader extends StatelessWidget {
  MenuHeader({super.key, required this.attachedWidget});

  final authViewModel = Get.find<AuthViewModel>();

  final Widget attachedWidget;

  final themeController = Get.find<ThemeController>();
  final homeController = Get.find<HomeController>();

  void onOptionSelected(MenuController controller) {
    if (!controller.isOpen) {
      controller.open();
    } else {
      controller.close();
    }
  }

  void _setStatusBarColor() {
    Future.delayed(Duration(milliseconds: 500)).then((_) => themeController.setStatusBarColor());
  }

  void accountSettings() {
    Get.toNamed(Routes.profile)?.whenComplete(_setStatusBarColor);
  }

  void languageSettings() {
    Get.toNamed(Routes.language)?.whenComplete(_setStatusBarColor);
  }

  void logout() async {
    homeController.backToHome();
    await authViewModel.logout();
    await Get.offAllNamed(Routes.auth);
  }

  void onMenuOptionPressed(int index) {
    switch (index) {
      case 0:
        accountSettings();
        break;
      case 1:
        languageSettings();
        break;
      case 2:
        themeController.toggleTheme();
        break;
      case 3:
        logout();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(Get.context!).brightness == Brightness.dark;

    return MenuAnchor(
      style: MenuStyle(
        backgroundColor: WidgetStateProperty.all(isDarkMode ? null : TaskiColors.white),
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        elevation: WidgetStateProperty.all(4),
      ),
      alignmentOffset: const Offset(0, 8),
      menuChildren: _menuChildren(),
      builder: menuBuilder,
      child: attachedWidget,
    );
  }

  List<Widget> _menuChildren() {
    final menuOptionsTitle = _menuOptionsTitle(Get.isDarkMode);
    final menuOptionsIcons = _menuOptionsIcons(Get.isDarkMode);
    final keys = _menuOptionsKeys();

    return List.generate(
      menuOptionsTitle.length,
      (index) => menuOption(
        onPressed: () => onMenuOptionPressed(index),
        optionTitle: menuOptionsTitle[index],
        icon: menuOptionsIcons[index],
        key: keys[index],
      ),
    );
  }

  Widget menuBuilder(context, controller, child) {
    return InkWell(
      onTap: () => onOptionSelected(controller),
      child: child!,
    );
  }

  List<String> _menuOptionsTitle(bool darkMode) {
    if (authViewModel.isLoggedIn) {
      return [
        AppLocalizations.of(Get.context!)!.account,
        AppLocalizations.of(Get.context!)!.language,
        darkMode ? AppLocalizations.of(Get.context!)!.lightMode : AppLocalizations.of(Get.context!)!.darkMode,
        AppLocalizations.of(Get.context!)!.logout,
      ];
    } else {
      return [
        AppLocalizations.of(Get.context!)!.login,
        AppLocalizations.of(Get.context!)!.language,
        darkMode ? AppLocalizations.of(Get.context!)!.lightMode : AppLocalizations.of(Get.context!)!.darkMode,
      ];
    }
  }

  List<IconData> _menuOptionsIcons(bool darkMode) {
    if (authViewModel.isLoggedIn) {
      return [
        Icons.person,
        Icons.language,
        darkMode ? Icons.light_mode : Icons.dark_mode,
        Icons.logout,
      ];
    } else {
      return [
        Icons.login,
        Icons.language,
        darkMode ? Icons.light_mode : Icons.dark_mode,
      ];
    }
  }

  List<String> _menuOptionsKeys() {
    return [
      WidgetKeys.menuAccountButton,
      WidgetKeys.menuLanguageSettingsButton,
      WidgetKeys.menuThemeButton,
      WidgetKeys.menuLogoutButton,
    ];
  }

  MenuItemButton menuOption({
    required Function()? onPressed,
    required String optionTitle,
    required IconData icon,
    required String key,
  }) {
    return MenuItemButton(
      key: Key(key),
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
