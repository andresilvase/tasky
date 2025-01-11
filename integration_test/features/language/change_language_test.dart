import 'package:tasky/core/constants/widgets_keys.dart';
import '../common/init_app.dart';
import 'common/open_language_settings_flow.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void changeLanguage() {
  testWidgets('switch to english', (tester) async {
    await initApp(tester);

    await openLanguageSettings(tester);

    const String locale = 'en';

    await tester.tap(find.byKey(const Key(locale)));
    await tester.pumpAndSettle();

    final selectedLanguageItem = find.byKey(const Key(WidgetKeys.englishLanguage));
    expect(selectedLanguageItem, findsOneWidget);

    final visible = tester.widget<Visibility>(selectedLanguageItem).visible;
    expect(visible, true);
  });

  testWidgets('switch to portuguese', (tester) async {
    await initApp(tester);

    await openLanguageSettings(tester);

    const String locale = 'pt';

    await tester.tap(find.byKey(const Key(locale)));
    await tester.pumpAndSettle();

    final selectedLanguageItem = find.byKey(const Key(WidgetKeys.portugueseLanguage));
    expect(selectedLanguageItem, findsOneWidget);

    final visible = tester.widget<Visibility>(selectedLanguageItem).visible;
    expect(visible, true);
  });

  testWidgets('switch to spanish', (tester) async {
    await initApp(tester);

    await openLanguageSettings(tester);

    const String locale = 'es';

    await tester.tap(find.byKey(const Key(locale)));
    await tester.pumpAndSettle();

    final selectedLanguageItem = find.byKey(const Key(WidgetKeys.spanishLanguage));
    expect(selectedLanguageItem, findsOneWidget);

    final visible = tester.widget<Visibility>(selectedLanguageItem).visible;
    expect(visible, true);
  });

  testWidgets('switch to french', (tester) async {
    await initApp(tester);

    await openLanguageSettings(tester);

    const String locale = 'fr';

    await tester.tap(find.byKey(const Key(locale)));
    await tester.pumpAndSettle();

    final selectedLanguageItem = find.byKey(const Key(WidgetKeys.frenchLanguage));
    expect(selectedLanguageItem, findsOneWidget);

    final visible = tester.widget<Visibility>(selectedLanguageItem).visible;
    expect(visible, true);
  });

  testWidgets('switch to italian', (tester) async {
    await initApp(tester);

    await openLanguageSettings(tester);

    const String locale = 'it';

    await tester.tap(find.byKey(const Key(locale)));
    await tester.pumpAndSettle();

    final selectedLanguageItem = find.byKey(const Key(WidgetKeys.italianLanguage));
    expect(selectedLanguageItem, findsOneWidget);

    final visible = tester.widget<Visibility>(selectedLanguageItem).visible;
    expect(visible, true);
  });

  testWidgets('switch to indian', (tester) async {
    await initApp(tester);

    await openLanguageSettings(tester);

    const String locale = 'hi';

    await tester.tap(find.byKey(const Key(locale)));
    await tester.pumpAndSettle();

    final selectedLanguageItem = find.byKey(const Key(WidgetKeys.indianLanguage));
    expect(selectedLanguageItem, findsOneWidget);

    final visible = tester.widget<Visibility>(selectedLanguageItem).visible;
    expect(visible, true);
  });

  testWidgets('switch to chinese', (tester) async {
    await initApp(tester);

    await openLanguageSettings(tester);

    const String locale = 'zh';

    await tester.tap(find.byKey(const Key(locale)));
    await tester.pumpAndSettle();

    final selectedLanguageItem = find.byKey(const Key(WidgetKeys.chineseLanguage));
    expect(selectedLanguageItem, findsOneWidget);

    final visible = tester.widget<Visibility>(selectedLanguageItem).visible;
    expect(visible, true);
  });

  testWidgets('switch to english', (tester) async {
    await initApp(tester);

    await openLanguageSettings(tester);

    const String locale = 'en';

    await tester.tap(find.byKey(const Key(locale)));
    await tester.pumpAndSettle();

    final selectedLanguageItem = find.byKey(const Key(WidgetKeys.englishLanguage));
    expect(selectedLanguageItem, findsOneWidget);

    final visible = tester.widget<Visibility>(selectedLanguageItem).visible;
    expect(visible, true);
  });
}
