import 'package:taski/features/language/constants/language_constants.dart';
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
  const Language({super.key});

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
                itemCount: LanguageConstants.languages.length,
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
      trailing: _checkIcon(
        selected: languageViewModel.locale.languageCode == LanguageConstants.locales[index],
        key: LanguageConstants.languageItemKeys[index],
      ),
      onTap: () => languageViewModel.changeLocale(LanguageConstants.locales[index]),
      key: Key(LanguageConstants.locales[index]),
      title: _languageName(index, isDarkMode),
      leading: _countryFlag(index),
    );
  }

  Widget _checkIcon({
    required bool selected,
    required String key,
  }) {
    return Visibility(
      key: Key(key),
      visible: selected,
      child: Icon(
        Icons.check,
        color: TaskiColors.blue,
      ),
    );
  }

  Text _languageName(int index, bool isDarkMode) {
    return Text(
      LanguageConstants.languages[index],
      style: GoogleFonts.urbanist(
        color: isDarkMode ? TaskiColors.paleWhite : TaskiColors.statePurple,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    );
  }

  CountryFlag _countryFlag(int index) {
    return CountryFlag.fromCountryCode(
      LanguageConstants.countries[index],
      shape: Circle(),
      height: 32,
      width: 32,
    );
  }
}
