import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taski/features/home/home_controller.dart';
import 'package:country_flags/country_flags.dart';
import 'package:taski/core/constants/assets.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppHeader extends StatefulWidget {
  const AppHeader({super.key});

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: _logoProfile(),
    );
  }

  Widget _logoProfile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _logo(),
        _menuProfile(),
      ],
    );
  }

  Widget _logo() {
    return Row(
      children: [
        Transform.scale(
          scale: 1.5,
          child: Checkbox(
            fillColor: WidgetStateProperty.all(TaskiColors.blue),
            visualDensity: VisualDensity(vertical: -4),
            checkColor: TaskiColors.white,
            onChanged: null,
            value: true,
            side: BorderSide(
              color: TaskiColors.mutedAzure,
              width: 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        Text(
          AppLocalizations.of(Get.context!)!.appName,
          style: GoogleFonts.urbanist(
            color: TaskiColors.statePurple,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget _menuProfile() {
    return MenuAnchor(
      style: MenuStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        elevation: WidgetStateProperty.all(4),
      ),
      menuChildren: [
        accountSettings(),
        ...languageSettings(),
      ],
      alignmentOffset: const Offset(0, 8),
      builder: (context, controller, child) {
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
      },
      child: nameAndPhoto(),
    );
  }

  Row nameAndPhoto() {
    return Row(
      spacing: 16,
      children: [
        Text(
          // TODO: Change to user name
          'André',
          style: GoogleFonts.urbanist(
            color: TaskiColors.statePurple,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        ClipOval(
          child: Image.asset(
            TaskiAssets.imageProfile,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  MenuItemButton accountSettings() {
    return MenuItemButton(
      onPressed: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 4,
        children: [
          const Icon(
            Icons.person_outline,
            color: TaskiColors.mutedAzure,
          ),
          Text(
            AppLocalizations.of(Get.context!)!.account,
            style: menuTextStyle(),
          ),
        ],
      ),
    );
  }

  final List<String> countries = ['US', 'BR', 'ES', 'FR', 'IT'];
  final List<String> locales = ['en', 'pt', 'es', 'fr', 'it'];

  final List<String> languages = [
    AppLocalizations.of(Get.context!)!.english,
    AppLocalizations.of(Get.context!)!.portuguese,
    AppLocalizations.of(Get.context!)!.spanish,
    AppLocalizations.of(Get.context!)!.french,
    AppLocalizations.of(Get.context!)!.italian,
  ];

  List<MenuItemButton> languageSettings() {
    return languages.map((language) {
      return MenuItemButton(
        onPressed: () {
          Get.find<HomeController>().changeLocale(locales[languages.indexOf(language)]);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 4,
          children: [
            CountryFlag.fromCountryCode(
              countries[languages.indexOf(language)],
              height: 20,
              width: 20,
              shape: Circle(),
            ),
            Text(
              language,
              style: menuTextStyle(),
            ),
          ],
        ),
      );
    }).toList();
  }

  TextStyle menuTextStyle() {
    return GoogleFonts.urbanist(
      color: TaskiColors.stateBlue,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    );
  }
}
