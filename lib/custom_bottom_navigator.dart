import 'package:flutter/material.dart';
import 'package:tasky/core/constants/assets.dart';
import 'package:tasky/core/widgets/icon_svg.dart';

class CustomBottomNavigator extends StatelessWidget {
  const CustomBottomNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconSvg(assetName: TaskyAssets.todo),
          IconSvg(assetName: TaskyAssets.add),
          IconSvg(assetName: TaskyAssets.search),
          IconSvg(assetName: TaskyAssets.done),
        ],
      ),
    );
  }
}
