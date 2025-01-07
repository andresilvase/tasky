import 'package:taski/core/widgets/screen_background.dart';
import 'package:taski/features/language/viewModel/language_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    final List<String> locales = ['en', 'pt', 'es', 'fr', 'it'];
    final List<String> countries = ['US', 'BR', 'ES', 'FR', 'IT'];

    final List<String> languages = [
      AppLocalizations.of(Get.context!)!.english,
      AppLocalizations.of(Get.context!)!.portuguese,
      AppLocalizations.of(Get.context!)!.spanish,
      AppLocalizations.of(Get.context!)!.french,
      AppLocalizations.of(Get.context!)!.italian,
    ];

    return Scaffold(
      appBar: commonAppBar(AppLocalizations.of(Get.context!)!.language),
      body: SafeArea(
        child: ScreenBackground(
          screenContent: [
            SizedBox(
              height: Get.height * 0.5,
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final LanguageViewModel languageViewModel = Get.find();

                  return ListTile(
                    title: Text(
                      languages[index],
                      style: GoogleFonts.urbanist(
                        color: TaskiColors.statePurple,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    leading: CountryFlag.fromCountryCode(
                      countries[index],
                      height: 32,
                      width: 32,
                      shape: Circle(),
                    ),
                    onTap: () {
                      languageViewModel.changeLocale(locales[index]);
                    },
                    trailing: _checkIcon(
                      languageViewModel.locale.languageCode == locales[index],
                    ),
                  );
                },
              ),
            ),
            Spacer(),
            _backButton(),
          ],
        ),
      ),
    );
  }

  Widget _checkIcon(bool selected) {
    return Icon(
      Icons.check,
      color: selected ? TaskiColors.blue : Colors.transparent,
    );
  }

  Widget _backButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: RoundedButton(
        text: AppLocalizations.of(Get.context!)!.back,
        backgroundColor: TaskiColors.blue,
        textColor: TaskiColors.white,
        onPressed: Get.back,
        width: Get.width,
        height: 48,
      ),
    );
  }
}
