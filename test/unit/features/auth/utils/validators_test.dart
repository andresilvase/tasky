import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taski/features/auth/utils/validators.dart';

import 'get_context.dart';

void main() {
  late AuthValidators validators;
  late BuildContext context;

  testWidgets('AuthValidators', (WidgetTester tester) async {
    context = await getTestContext(tester);
    validators = AuthValidators(context);

    expect(
      validators.usernameInputValidator(null),
      equals(AppLocalizations.of(context)!.usernameRequired),
    );

    expect(
      validators.usernameInputValidator(''),
      equals(AppLocalizations.of(context)!.usernameRequired),
    );

    expect(
      validators.usernameInputValidator('user'),
      equals(AppLocalizations.of(context)!.usernameMinLength(5)),
    );

    expect(
      validators.usernameInputValidator('verylongusernamehere'),
      equals(AppLocalizations.of(context)!.usernameMaxLength(16)),
    );

    expect(
      validators.usernameInputValidator('user@name'),
      equals(AppLocalizations.of(context)!.usernameMustBeAlphanumeric),
    );

    expect(
      validators.usernameInputValidator('validuser123'),
      isNull,
    );

    expect(
      validators.usernameInputValidator('válíduser123'),
      isNull,
    );

    expect(
      validators.passwordInputValidator('validpass123'),
      isNull,
    );

    expect(
      validators.repeatPasswordInputValidator('password123', 'password123'),
      isNull,
    );

    expect(
      validators.repeatPasswordInputValidator('password123', 'password321'),
      equals(AppLocalizations.of(context)!.passwordsMustMatch),
    );

    expect(
      validators.passwordInputValidator('pas'),
      equals(AppLocalizations.of(context)!.passwordMinLength(4)),
    );
  });
}
