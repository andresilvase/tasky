import 'package:taski/features/language/viewModel/language_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:path_provider/path_provider.dart';
import 'package:taski/core/routes/router.dart';
import 'package:taski/core/routes/routes.dart';
import 'package:taski/core/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:get/get.dart';

Future init() async {
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);

  await TaskiDependencies.init();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Get.find<LanguageViewModel>().locale,
      theme: ThemeData.light(useMaterial3: true),
      onGenerateRoute: AppRouter.onGenerateroute,
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      initialRoute: Routes.home,
    );
  }
}
