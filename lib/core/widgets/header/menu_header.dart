import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
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
        optionTitle: _menuOptionsTitle[index],
        icon: _menuOptionsIcons[index],
        onPressed: () {},
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
