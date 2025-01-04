import 'package:tasky/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: TaskyColors.white),
        scaffoldBackgroundColor: TaskyColors.white,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
