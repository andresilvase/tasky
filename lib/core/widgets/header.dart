import 'package:taski/core/widgets/logo.dart';
import 'package:taski/features/home/viewModel/home_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taski/core/constants/languages.dart';
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
        Logo(),
        _menuProfile(),
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

  List<MenuItemButton> languageSettings() {
    return languages.map((language) {
      return MenuItemButton(
        onPressed: () {
          Get.find<HomeViewModel>().changeLocale(locales[languages.indexOf(language)]);
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
