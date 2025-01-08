import 'package:taski/features/language/viewModel/language_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taski/core/widgets/screen_background.dart';
import 'package:taski/core/widgets/common_widgets.dart';
import 'package:taski/core/widgets/rounded_button.dart';
import 'package:country_flags/country_flags.dart';
import 'package:taski/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends StatelessWidget {
  Language({super.key});

  final List<String> countries = ['US', 'BR', 'ES', 'FR', 'IT'];
  final List<String> locales = ['en', 'pt', 'es', 'fr', 'it'];

  final List<String> languages = [
    AppLocalizations.of(Get.context!)!.english,
    AppLocalizations.of(Get.context!)!.portuguese,
    AppLocalizations.of(Get.context!)!.spanish,
    AppLocalizations.of(Get.context!)!.french,
    AppLocalizations.of(Get.context!)!.italian,
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(Get.context!).brightness == Brightness.dark;

    return Scaffold(
      appBar: _appBar(isDarkMode),
      body: SafeArea(
        child: ScreenBackground(
          screenContent: [
            SizedBox(
              height: Get.height * 0.5,
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final LanguageViewModel languageViewModel = Get.find();

                  return _languageItem(
                    languageViewModel: languageViewModel,
                    isDarkMode: isDarkMode,
                    index: index,
                  );
                },
              ),
            ),
            Spacer(),
            _backButton(darkMode: isDarkMode),
          ],
        ),
      ),
    );
  }

  Widget _backButton({bool darkMode = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: RoundedButton(
        backgroundColor: darkMode ? TaskiColors.statePurple : TaskiColors.blue,
        text: AppLocalizations.of(Get.context!)!.back,
        textColor: TaskiColors.white,
        onPressed: Get.back,
        width: Get.width,
        height: 48,
      ),
    );
  }

  AppBar _appBar(bool isDarkMode) {
    return commonAppBar(
      title: AppLocalizations.of(Get.context!)!.language,
      darkMode: isDarkMode,
    );
  }

  ListTile _languageItem({
    required LanguageViewModel languageViewModel,
    required bool isDarkMode,
    required int index,
  }) {
    return ListTile(
      trailing: _checkIcon(languageViewModel.locale.languageCode == locales[index]),
      onTap: () => languageViewModel.changeLocale(locales[index]),
      title: _languageName(index, isDarkMode),
      leading: _countryFlag(index),
    );
  }

  Widget _checkIcon(bool selected) {
    return Icon(
      Icons.check,
      color: selected ? TaskiColors.blue : Colors.transparent,
    );
  }

  Text _languageName(int index, bool isDarkMode) {
    return Text(
      languages[index],
      style: GoogleFonts.urbanist(
        color: isDarkMode ? TaskiColors.paleWhite : TaskiColors.statePurple,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    );
  }

  CountryFlag _countryFlag(int index) {
    return CountryFlag.fromCountryCode(
      countries[index],
      shape: Circle(),
      height: 32,
      width: 32,
    );
  }
}
