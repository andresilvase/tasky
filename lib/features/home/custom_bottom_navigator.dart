import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taski/core/constants/widgets_keys.dart';
import 'package:taski/core/constants/assets.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:taski/core/widgets/icon_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigator extends StatelessWidget {
  const CustomBottomNavigator({
    super.key,
    required this.currentIndex,
    this.backgroundColor,
    this.onIndexChanged,
  });

  final Function(int index)? onIndexChanged;
  final Color? backgroundColor;
  final int currentIndex;

  Color? iconColor(bool active) {
    final bool isDarkMode = Theme.of(Get.context!).brightness == Brightness.dark;

    return active
        ? TaskiColors.blue
        : isDarkMode
            ? TaskiColors.blue10
            : TaskiColors.mutedAzure;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> icons = [
      IconSvg(
        assetName: TaskiAssets.todo,
        color: iconColor(currentIndex == 0),
      ),
      IconSvg(
        assetName: TaskiAssets.add,
        color: iconColor(currentIndex == 1),
      ),
      IconSvg(
        assetName: TaskiAssets.search,
        color: iconColor(currentIndex == 2),
      ),
      IconSvg(
        assetName: TaskiAssets.done,
        color: iconColor(currentIndex == 3),
      ),
    ];

    List<String> labels = [
      AppLocalizations.of(context)!.todo,
      AppLocalizations.of(context)!.create,
      AppLocalizations.of(context)!.search,
      AppLocalizations.of(context)!.done,
    ];

    List<String> keys = [
      WidgetsKeys.navBarTodoIcon,
      WidgetsKeys.navBarAddIcon,
      WidgetsKeys.navBarSearchIcon,
      WidgetsKeys.navBarDoneIcon,
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: icons.map((icon) => _navBarIcon(keys, icons, icon, labels)).toList(),
        ),
      ),
    );
  }

  Widget _navBarIcon(List<String> keys, List<Widget> icons, Widget icon, List<String> labels) {
    final int index = icons.indexOf(icon);

    return InkWell(
      key: Key(keys[index]),
      onTap: () {
        onIndexChanged?.call(index);
      },
      child: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          _navLabel(labels, index),
        ],
      ),
    );
  }

  Text _navLabel(List<String> labels, int index) {
    return Text(
      labels[index],
      style: GoogleFonts.urbanist(
        color: iconColor(currentIndex == index),
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
    );
  }
}
