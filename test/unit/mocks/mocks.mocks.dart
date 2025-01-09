// Mocks generated by Mockito 5.4.5 from annotations
// in taski/test/unit/mocks/mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:taski/core/db/abstract_db.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [Database].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabase extends _i1.Mock implements _i2.Database {
  MockDatabase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<int> update(
    String? table,
    Map<String, dynamic>? values,
    dynamic id,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#update, [table, values, id]),
            returnValue: _i3.Future<int>.value(0),
          )
          as _i3.Future<int>);

  @override
  _i3.Future<int> insert(String? table, Map<String, dynamic>? values) =>
      (super.noSuchMethod(
            Invocation.method(#insert, [table, values]),
            returnValue: _i3.Future<int>.value(0),
          )
          as _i3.Future<int>);

  @override
  _i3.Future<int> delete(String? table, dynamic where) =>
      (super.noSuchMethod(
            Invocation.method(#delete, [table, where]),
            returnValue: _i3.Future<int>.value(0),
          )
          as _i3.Future<int>);

  @override
  _i3.Future<Map<dynamic, dynamic>> get(String? table, dynamic where) =>
      (super.noSuchMethod(
            Invocation.method(#get, [table, where]),
            returnValue: _i3.Future<Map<dynamic, dynamic>>.value(
              <dynamic, dynamic>{},
            ),
          )
          as _i3.Future<Map<dynamic, dynamic>>);

  @override
  _i3.Future<List<Map<dynamic, dynamic>>> getAll(String? table) =>
      (super.noSuchMethod(
            Invocation.method(#getAll, [table]),
            returnValue: _i3.Future<List<Map<dynamic, dynamic>>>.value(
              <Map<dynamic, dynamic>>[],
            ),
          )
          as _i3.Future<List<Map<dynamic, dynamic>>>);

  @override
  _i3.Future<int> clear(String? table) =>
      (super.noSuchMethod(
            Invocation.method(#clear, [table]),
            returnValue: _i3.Future<int>.value(0),
          )
          as _i3.Future<int>);
}
