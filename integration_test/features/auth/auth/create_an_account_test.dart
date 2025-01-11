import 'package:flutter_test/flutter_test.dart';
import '../common/create_account_common_flow.dart';
import '../../common/init_app.dart';

void createAnAccount() {
  testWidgets('create an account', (tester) async {
    await initApp(tester);

    await createAccountCommon(tester);
  });
}
