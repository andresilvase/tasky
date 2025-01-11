import 'package:flutter_test/flutter_test.dart';
import 'try_create_invalid_account.dart';
import 'continue_annonimous_test.dart';
import 'create_an_account_test.dart';
import 'login_test.dart';
import 'logout_test.dart';

void main() {
  group('authentication tests should', () {
    continueAnnonimous();
    tryCreateAccountWithInvalidInputs();
    createAnAccount();
    logout();
    login();
  });
}
