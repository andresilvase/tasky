import 'package:path_provider/path_provider.dart';
import 'package:taski/core/routes/routes.dart';
import 'package:taski/core/bindings.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:get/get.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  Future hiveInit() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    await TaskiDepependencies.init();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: hiveInit().then((value) {
        Get.offAllNamed(Routes.home);
      }),
      builder: (context, snapshot) {
        return Center(child: const CircularProgressIndicator());
      },
    );
  }
}
