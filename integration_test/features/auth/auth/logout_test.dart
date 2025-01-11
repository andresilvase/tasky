import 'package:flutter_test/flutter_test.dart';
import '../common/logout_common_flow.dart';

import '../../common/init_app.dart';

void logout() {
  testWidgets('logout', (tester) async {
    await initApp(tester);

    await logoutCommon(tester);
  });
}
