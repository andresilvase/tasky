import 'package:tasky/features/auth/respository/auth_repository.dart';
import 'package:tasky/features/auth/viewModel/auth_view_model.dart';

import 'package:tasky/core/widgets/auth_or_profile.dart';
import 'package:tasky/features/auth/views/profile.dart';
import 'package:tasky/features/auth/views/auth.dart';
import 'package:tasky/core/db/abstract_db.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/mocks.mocks.dart';

import 'package:get/get.dart';

import '../../common/app_wrapper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AuthRepository authRepository;
  late AuthViewModel authViewModel;
  late Database db;

  group('AuthOrProfile', () {
    setUp(() async {
      db = MockDatabase();
      authRepository = AuthRepository(db);
      authViewModel = AuthViewModel(authRepository);

      Get.put(authViewModel);
    });

    testWidgets('should render AuthScreen when user is not logged in', (WidgetTester tester) async {
      await tester.pumpWidget(AppWrapper(child: const AuthOrProfile()));
      expect(find.byType(AuthScreen), findsOneWidget);
    });

    testWidgets('should render ProfileScreen when user is logged in', (WidgetTester tester) async {
      authViewModel.setActiveUser(authViewModel.activeUser.value.copyWith(displayName: 'Test User'));

      await tester.pumpWidget(AppWrapper(child: const AuthOrProfile()));

      expect(find.byType(Profile), findsOneWidget);
    });

    tearDown(() {
      Get.reset();
    });
  });
}
