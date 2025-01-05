import 'package:taski/core/constants/colors.dart';
import 'package:taski/core/routes/router.dart';
import 'package:taski/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: TaskiColors.white),
        scaffoldBackgroundColor: TaskiColors.white,
        useMaterial3: true,
      ),
      onGenerateRoute: AppRouter.onGenerateroute,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.root,
    );
  }
}
