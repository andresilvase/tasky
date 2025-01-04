import 'package:google_fonts/google_fonts.dart';
import 'package:tasky/core/constants/assets.dart';
import 'package:tasky/core/constants/colors.dart';
import 'package:tasky/core/widgets/icon_svg.dart';
import 'package:flutter/material.dart';

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
    return active ? TaskyColors.blue : null;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> icons = [
      IconSvg(
        assetName: TaskyAssets.todo,
        color: iconColor(currentIndex == 0),
      ),
      IconSvg(
        assetName: TaskyAssets.add,
        color: iconColor(currentIndex == 1),
      ),
      IconSvg(
        assetName: TaskyAssets.search,
        color: iconColor(currentIndex == 2),
      ),
      IconSvg(
        assetName: TaskyAssets.done,
        color: iconColor(currentIndex == 3),
      ),
    ];

    List<String> labels = ['Todo', 'Create', 'Search', 'Done'];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: icons.map(
            (icon) {
              return GestureDetector(
                onTap: () {
                  onIndexChanged?.call(icons.indexOf(icon));
                },
                child: Column(
                  spacing: 8,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    icon,
                    Text(
                      labels[icons.indexOf(icon)],
                      style: GoogleFonts.urbanist(
                        color: iconColor(currentIndex == icons.indexOf(icon)),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
