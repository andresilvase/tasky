import 'package:path_provider/path_provider.dart';
import 'package:tasky/core/constants/colors.dart';
import 'package:tasky/core/routes/router.dart';
import 'package:tasky/core/routes/routes.dart';
import 'package:tasky/core/bindings.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: TaskyBindings(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: TaskyColors.white),
        scaffoldBackgroundColor: TaskyColors.white,
        useMaterial3: true,
      ),
      onGenerateRoute: AppRouter.onGenerateroute,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
    );
  }
}
