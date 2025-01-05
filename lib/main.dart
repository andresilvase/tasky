import 'package:path_provider/path_provider.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:taski/core/routes/router.dart';
import 'package:taski/core/routes/routes.dart';
import 'package:taski/core/bindings.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:get/get.dart';

void hiveInit() async {
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  hiveInit();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: TaskiBindings(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: TaskiColors.white),
        scaffoldBackgroundColor: TaskiColors.white,
        useMaterial3: true,
      ),
      onGenerateRoute: AppRouter.onGenerateroute,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
    );
  }
}
