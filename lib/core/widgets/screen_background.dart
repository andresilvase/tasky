import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({super.key, required this.screenContent});

  final List<Widget> screenContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(6),
      height: Get.height * 0.85,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: screenContent,
      ),
    );
  }
}
