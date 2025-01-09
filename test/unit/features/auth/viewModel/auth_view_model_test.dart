import 'package:taski/features/auth/respository/auth_repository.dart';
import 'package:taski/features/auth/viewModel/auth_view_model.dart';
import 'package:taski/core/db/abstract_db.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixtures.dart';
import '../../../../mocks/mocks.mocks.dart';

void main() {
  group('Auth View Model', () {
    late AuthRepository repository;
    late AuthViewModel viewModel;
    late Database db;

    setUp(() {
      db = MockDatabase();
      repository = AuthRepository(db);
      viewModel = AuthViewModel(repository);
    });

    test('', () async {});
  });
}
