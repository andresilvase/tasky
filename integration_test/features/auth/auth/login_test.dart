import 'package:flutter_test/flutter_test.dart';
import '../../common/init_app.dart';
import '../common/login_common_flow.dart';

void login() {
  testWidgets('login', (tester) async {
    await initApp(tester);

    await loginCommon(tester);
  });
}
