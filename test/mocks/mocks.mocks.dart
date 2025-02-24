// Mocks generated by Mockito 5.4.5 from annotations
// in tasky/test/mocks/mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:convert' as _i13;
import 'dart:io' as _i4;
import 'dart:typed_data' as _i14;

import 'package:flutter/foundation.dart' as _i3;
import 'package:flutter/src/widgets/framework.dart' as _i2;
import 'package:flutter/src/widgets/notification_listener.dart' as _i6;
import 'package:image_picker/image_picker.dart' as _i5;
import 'package:image_picker_platform_interface/src/platform_interface/image_picker_platform.dart'
    as _i15;
import 'package:image_picker_platform_interface/src/types/types.dart' as _i16;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i12;
import 'package:permission_handler/permission_handler.dart' as _i9;
import 'package:tasky/core/db/abstract_db.dart' as _i11;
import 'package:tasky/core/utils/asset_picker.dart' as _i10;
import 'package:tasky/core/utils/device_permission.dart' as _i7;

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

class _FakeWidget_0 extends _i1.SmartFake implements _i2.Widget {
  _FakeWidget_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);

  @override
  String toString({_i3.DiagnosticLevel? minLevel = _i3.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeInheritedWidget_1 extends _i1.SmartFake
    implements _i2.InheritedWidget {
  _FakeInheritedWidget_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);

  @override
  String toString({_i3.DiagnosticLevel? minLevel = _i3.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeDiagnosticsNode_2 extends _i1.SmartFake
    implements _i3.DiagnosticsNode {
  _FakeDiagnosticsNode_2(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);

  @override
  String toString({
    _i3.TextTreeConfiguration? parentConfiguration,
    _i3.DiagnosticLevel? minLevel = _i3.DiagnosticLevel.info,
  }) => super.toString();
}

class _FakeFile_3 extends _i1.SmartFake implements _i4.File {
  _FakeFile_3(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeUri_4 extends _i1.SmartFake implements Uri {
  _FakeUri_4(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeDirectory_5 extends _i1.SmartFake implements _i4.Directory {
  _FakeDirectory_5(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeFileSystemEntity_6 extends _i1.SmartFake
    implements _i4.FileSystemEntity {
  _FakeFileSystemEntity_6(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeDateTime_7 extends _i1.SmartFake implements DateTime {
  _FakeDateTime_7(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeRandomAccessFile_8 extends _i1.SmartFake
    implements _i4.RandomAccessFile {
  _FakeRandomAccessFile_8(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeIOSink_9 extends _i1.SmartFake implements _i4.IOSink {
  _FakeIOSink_9(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeFileStat_10 extends _i1.SmartFake implements _i4.FileStat {
  _FakeFileStat_10(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeLostData_11 extends _i1.SmartFake implements _i5.LostData {
  _FakeLostData_11(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeLostDataResponse_12 extends _i1.SmartFake
    implements _i5.LostDataResponse {
  _FakeLostDataResponse_12(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [BuildContext].
///
/// See the documentation for Mockito's code generation for more information.
class MockBuildContext extends _i1.Mock implements _i2.BuildContext {
  MockBuildContext() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Widget get widget =>
      (super.noSuchMethod(
            Invocation.getter(#widget),
            returnValue: _FakeWidget_0(this, Invocation.getter(#widget)),
          )
          as _i2.Widget);

  @override
  bool get mounted =>
      (super.noSuchMethod(Invocation.getter(#mounted), returnValue: false)
          as bool);

  @override
  bool get debugDoingBuild =>
      (super.noSuchMethod(
            Invocation.getter(#debugDoingBuild),
            returnValue: false,
          )
          as bool);

  @override
  _i2.InheritedWidget dependOnInheritedElement(
    _i2.InheritedElement? ancestor, {
    Object? aspect,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #dependOnInheritedElement,
              [ancestor],
              {#aspect: aspect},
            ),
            returnValue: _FakeInheritedWidget_1(
              this,
              Invocation.method(
                #dependOnInheritedElement,
                [ancestor],
                {#aspect: aspect},
              ),
            ),
          )
          as _i2.InheritedWidget);

  @override
  void visitAncestorElements(_i2.ConditionalElementVisitor? visitor) =>
      super.noSuchMethod(
        Invocation.method(#visitAncestorElements, [visitor]),
        returnValueForMissingStub: null,
      );

  @override
  void visitChildElements(_i2.ElementVisitor? visitor) => super.noSuchMethod(
    Invocation.method(#visitChildElements, [visitor]),
    returnValueForMissingStub: null,
  );

  @override
  void dispatchNotification(_i6.Notification? notification) =>
      super.noSuchMethod(
        Invocation.method(#dispatchNotification, [notification]),
        returnValueForMissingStub: null,
      );

  @override
  _i3.DiagnosticsNode describeElement(
    String? name, {
    _i3.DiagnosticsTreeStyle? style = _i3.DiagnosticsTreeStyle.errorProperty,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#describeElement, [name], {#style: style}),
            returnValue: _FakeDiagnosticsNode_2(
              this,
              Invocation.method(#describeElement, [name], {#style: style}),
            ),
          )
          as _i3.DiagnosticsNode);

  @override
  _i3.DiagnosticsNode describeWidget(
    String? name, {
    _i3.DiagnosticsTreeStyle? style = _i3.DiagnosticsTreeStyle.errorProperty,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#describeWidget, [name], {#style: style}),
            returnValue: _FakeDiagnosticsNode_2(
              this,
              Invocation.method(#describeWidget, [name], {#style: style}),
            ),
          )
          as _i3.DiagnosticsNode);

  @override
  List<_i3.DiagnosticsNode> describeMissingAncestor({
    required Type? expectedAncestorType,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#describeMissingAncestor, [], {
              #expectedAncestorType: expectedAncestorType,
            }),
            returnValue: <_i3.DiagnosticsNode>[],
          )
          as List<_i3.DiagnosticsNode>);

  @override
  _i3.DiagnosticsNode describeOwnershipChain(String? name) =>
      (super.noSuchMethod(
            Invocation.method(#describeOwnershipChain, [name]),
            returnValue: _FakeDiagnosticsNode_2(
              this,
              Invocation.method(#describeOwnershipChain, [name]),
            ),
          )
          as _i3.DiagnosticsNode);
}

/// A class which mocks [DevicePermission].
///
/// See the documentation for Mockito's code generation for more information.
class MockDevicePermission extends _i1.Mock implements _i7.DevicePermission {
  MockDevicePermission() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i9.PermissionStatus> requestGaleryPermission() =>
      (super.noSuchMethod(
            Invocation.method(#requestGaleryPermission, []),
            returnValue: _i8.Future<_i9.PermissionStatus>.value(
              _i9.PermissionStatus.denied,
            ),
          )
          as _i8.Future<_i9.PermissionStatus>);

  @override
  _i8.Future<_i9.PermissionStatus> requestCameraPermission() =>
      (super.noSuchMethod(
            Invocation.method(#requestCameraPermission, []),
            returnValue: _i8.Future<_i9.PermissionStatus>.value(
              _i9.PermissionStatus.denied,
            ),
          )
          as _i8.Future<_i9.PermissionStatus>);
}

/// A class which mocks [AssetPicker].
///
/// See the documentation for Mockito's code generation for more information.
class MockAssetPicker extends _i1.Mock implements _i10.AssetPicker {
  MockAssetPicker() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i5.XFile?> pickImage({required _i5.ImageSource? source}) =>
      (super.noSuchMethod(
            Invocation.method(#pickImage, [], {#source: source}),
            returnValue: _i8.Future<_i5.XFile?>.value(),
          )
          as _i8.Future<_i5.XFile?>);
}

/// A class which mocks [Database].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabase extends _i1.Mock implements _i11.Database {
  MockDatabase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<int> update(
    String? table,
    Map<String, dynamic>? values,
    dynamic id,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#update, [table, values, id]),
            returnValue: _i8.Future<int>.value(0),
          )
          as _i8.Future<int>);

  @override
  _i8.Future<int> insert(String? table, Map<String, dynamic>? values) =>
      (super.noSuchMethod(
            Invocation.method(#insert, [table, values]),
            returnValue: _i8.Future<int>.value(0),
          )
          as _i8.Future<int>);

  @override
  _i8.Future<int> delete(String? table, dynamic where) =>
      (super.noSuchMethod(
            Invocation.method(#delete, [table, where]),
            returnValue: _i8.Future<int>.value(0),
          )
          as _i8.Future<int>);

  @override
  _i8.Future<Map<dynamic, dynamic>> get(String? table, dynamic where) =>
      (super.noSuchMethod(
            Invocation.method(#get, [table, where]),
            returnValue: _i8.Future<Map<dynamic, dynamic>>.value(
              <dynamic, dynamic>{},
            ),
          )
          as _i8.Future<Map<dynamic, dynamic>>);

  @override
  _i8.Future<List<Map<dynamic, dynamic>>> getAll(String? table) =>
      (super.noSuchMethod(
            Invocation.method(#getAll, [table]),
            returnValue: _i8.Future<List<Map<dynamic, dynamic>>>.value(
              <Map<dynamic, dynamic>>[],
            ),
          )
          as _i8.Future<List<Map<dynamic, dynamic>>>);

  @override
  _i8.Future<int> clear(String? table) =>
      (super.noSuchMethod(
            Invocation.method(#clear, [table]),
            returnValue: _i8.Future<int>.value(0),
          )
          as _i8.Future<int>);
}

/// A class which mocks [File].
///
/// See the documentation for Mockito's code generation for more information.
class MockFile extends _i1.Mock implements _i4.File {
  MockFile() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.File get absolute =>
      (super.noSuchMethod(
            Invocation.getter(#absolute),
            returnValue: _FakeFile_3(this, Invocation.getter(#absolute)),
          )
          as _i4.File);

  @override
  String get path =>
      (super.noSuchMethod(
            Invocation.getter(#path),
            returnValue: _i12.dummyValue<String>(
              this,
              Invocation.getter(#path),
            ),
          )
          as String);

  @override
  Uri get uri =>
      (super.noSuchMethod(
            Invocation.getter(#uri),
            returnValue: _FakeUri_4(this, Invocation.getter(#uri)),
          )
          as Uri);

  @override
  bool get isAbsolute =>
      (super.noSuchMethod(Invocation.getter(#isAbsolute), returnValue: false)
          as bool);

  @override
  _i4.Directory get parent =>
      (super.noSuchMethod(
            Invocation.getter(#parent),
            returnValue: _FakeDirectory_5(this, Invocation.getter(#parent)),
          )
          as _i4.Directory);

  @override
  _i8.Future<_i4.File> create({
    bool? recursive = false,
    bool? exclusive = false,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#create, [], {
              #recursive: recursive,
              #exclusive: exclusive,
            }),
            returnValue: _i8.Future<_i4.File>.value(
              _FakeFile_3(
                this,
                Invocation.method(#create, [], {
                  #recursive: recursive,
                  #exclusive: exclusive,
                }),
              ),
            ),
          )
          as _i8.Future<_i4.File>);

  @override
  void createSync({bool? recursive = false, bool? exclusive = false}) =>
      super.noSuchMethod(
        Invocation.method(#createSync, [], {
          #recursive: recursive,
          #exclusive: exclusive,
        }),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Future<_i4.File> rename(String? newPath) =>
      (super.noSuchMethod(
            Invocation.method(#rename, [newPath]),
            returnValue: _i8.Future<_i4.File>.value(
              _FakeFile_3(this, Invocation.method(#rename, [newPath])),
            ),
          )
          as _i8.Future<_i4.File>);

  @override
  _i4.File renameSync(String? newPath) =>
      (super.noSuchMethod(
            Invocation.method(#renameSync, [newPath]),
            returnValue: _FakeFile_3(
              this,
              Invocation.method(#renameSync, [newPath]),
            ),
          )
          as _i4.File);

  @override
  _i8.Future<_i4.FileSystemEntity> delete({bool? recursive = false}) =>
      (super.noSuchMethod(
            Invocation.method(#delete, [], {#recursive: recursive}),
            returnValue: _i8.Future<_i4.FileSystemEntity>.value(
              _FakeFileSystemEntity_6(
                this,
                Invocation.method(#delete, [], {#recursive: recursive}),
              ),
            ),
          )
          as _i8.Future<_i4.FileSystemEntity>);

  @override
  void deleteSync({bool? recursive = false}) => super.noSuchMethod(
    Invocation.method(#deleteSync, [], {#recursive: recursive}),
    returnValueForMissingStub: null,
  );

  @override
  _i8.Future<_i4.File> copy(String? newPath) =>
      (super.noSuchMethod(
            Invocation.method(#copy, [newPath]),
            returnValue: _i8.Future<_i4.File>.value(
              _FakeFile_3(this, Invocation.method(#copy, [newPath])),
            ),
          )
          as _i8.Future<_i4.File>);

  @override
  _i4.File copySync(String? newPath) =>
      (super.noSuchMethod(
            Invocation.method(#copySync, [newPath]),
            returnValue: _FakeFile_3(
              this,
              Invocation.method(#copySync, [newPath]),
            ),
          )
          as _i4.File);

  @override
  _i8.Future<int> length() =>
      (super.noSuchMethod(
            Invocation.method(#length, []),
            returnValue: _i8.Future<int>.value(0),
          )
          as _i8.Future<int>);

  @override
  int lengthSync() =>
      (super.noSuchMethod(Invocation.method(#lengthSync, []), returnValue: 0)
          as int);

  @override
  _i8.Future<DateTime> lastAccessed() =>
      (super.noSuchMethod(
            Invocation.method(#lastAccessed, []),
            returnValue: _i8.Future<DateTime>.value(
              _FakeDateTime_7(this, Invocation.method(#lastAccessed, [])),
            ),
          )
          as _i8.Future<DateTime>);

  @override
  DateTime lastAccessedSync() =>
      (super.noSuchMethod(
            Invocation.method(#lastAccessedSync, []),
            returnValue: _FakeDateTime_7(
              this,
              Invocation.method(#lastAccessedSync, []),
            ),
          )
          as DateTime);

  @override
  _i8.Future<dynamic> setLastAccessed(DateTime? time) =>
      (super.noSuchMethod(
            Invocation.method(#setLastAccessed, [time]),
            returnValue: _i8.Future<dynamic>.value(),
          )
          as _i8.Future<dynamic>);

  @override
  void setLastAccessedSync(DateTime? time) => super.noSuchMethod(
    Invocation.method(#setLastAccessedSync, [time]),
    returnValueForMissingStub: null,
  );

  @override
  _i8.Future<DateTime> lastModified() =>
      (super.noSuchMethod(
            Invocation.method(#lastModified, []),
            returnValue: _i8.Future<DateTime>.value(
              _FakeDateTime_7(this, Invocation.method(#lastModified, [])),
            ),
          )
          as _i8.Future<DateTime>);

  @override
  DateTime lastModifiedSync() =>
      (super.noSuchMethod(
            Invocation.method(#lastModifiedSync, []),
            returnValue: _FakeDateTime_7(
              this,
              Invocation.method(#lastModifiedSync, []),
            ),
          )
          as DateTime);

  @override
  _i8.Future<dynamic> setLastModified(DateTime? time) =>
      (super.noSuchMethod(
            Invocation.method(#setLastModified, [time]),
            returnValue: _i8.Future<dynamic>.value(),
          )
          as _i8.Future<dynamic>);

  @override
  void setLastModifiedSync(DateTime? time) => super.noSuchMethod(
    Invocation.method(#setLastModifiedSync, [time]),
    returnValueForMissingStub: null,
  );

  @override
  _i8.Future<_i4.RandomAccessFile> open({
    _i4.FileMode? mode = _i4.FileMode.read,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#open, [], {#mode: mode}),
            returnValue: _i8.Future<_i4.RandomAccessFile>.value(
              _FakeRandomAccessFile_8(
                this,
                Invocation.method(#open, [], {#mode: mode}),
              ),
            ),
          )
          as _i8.Future<_i4.RandomAccessFile>);

  @override
  _i4.RandomAccessFile openSync({_i4.FileMode? mode = _i4.FileMode.read}) =>
      (super.noSuchMethod(
            Invocation.method(#openSync, [], {#mode: mode}),
            returnValue: _FakeRandomAccessFile_8(
              this,
              Invocation.method(#openSync, [], {#mode: mode}),
            ),
          )
          as _i4.RandomAccessFile);

  @override
  _i8.Stream<List<int>> openRead([int? start, int? end]) =>
      (super.noSuchMethod(
            Invocation.method(#openRead, [start, end]),
            returnValue: _i8.Stream<List<int>>.empty(),
          )
          as _i8.Stream<List<int>>);

  @override
  _i4.IOSink openWrite({
    _i4.FileMode? mode = _i4.FileMode.write,
    _i13.Encoding? encoding = const _i13.Utf8Codec(),
  }) =>
      (super.noSuchMethod(
            Invocation.method(#openWrite, [], {
              #mode: mode,
              #encoding: encoding,
            }),
            returnValue: _FakeIOSink_9(
              this,
              Invocation.method(#openWrite, [], {
                #mode: mode,
                #encoding: encoding,
              }),
            ),
          )
          as _i4.IOSink);

  @override
  _i8.Future<_i14.Uint8List> readAsBytes() =>
      (super.noSuchMethod(
            Invocation.method(#readAsBytes, []),
            returnValue: _i8.Future<_i14.Uint8List>.value(_i14.Uint8List(0)),
          )
          as _i8.Future<_i14.Uint8List>);

  @override
  _i14.Uint8List readAsBytesSync() =>
      (super.noSuchMethod(
            Invocation.method(#readAsBytesSync, []),
            returnValue: _i14.Uint8List(0),
          )
          as _i14.Uint8List);

  @override
  _i8.Future<String> readAsString({
    _i13.Encoding? encoding = const _i13.Utf8Codec(),
  }) =>
      (super.noSuchMethod(
            Invocation.method(#readAsString, [], {#encoding: encoding}),
            returnValue: _i8.Future<String>.value(
              _i12.dummyValue<String>(
                this,
                Invocation.method(#readAsString, [], {#encoding: encoding}),
              ),
            ),
          )
          as _i8.Future<String>);

  @override
  String readAsStringSync({_i13.Encoding? encoding = const _i13.Utf8Codec()}) =>
      (super.noSuchMethod(
            Invocation.method(#readAsStringSync, [], {#encoding: encoding}),
            returnValue: _i12.dummyValue<String>(
              this,
              Invocation.method(#readAsStringSync, [], {#encoding: encoding}),
            ),
          )
          as String);

  @override
  _i8.Future<List<String>> readAsLines({
    _i13.Encoding? encoding = const _i13.Utf8Codec(),
  }) =>
      (super.noSuchMethod(
            Invocation.method(#readAsLines, [], {#encoding: encoding}),
            returnValue: _i8.Future<List<String>>.value(<String>[]),
          )
          as _i8.Future<List<String>>);

  @override
  List<String> readAsLinesSync({
    _i13.Encoding? encoding = const _i13.Utf8Codec(),
  }) =>
      (super.noSuchMethod(
            Invocation.method(#readAsLinesSync, [], {#encoding: encoding}),
            returnValue: <String>[],
          )
          as List<String>);

  @override
  _i8.Future<_i4.File> writeAsBytes(
    List<int>? bytes, {
    _i4.FileMode? mode = _i4.FileMode.write,
    bool? flush = false,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #writeAsBytes,
              [bytes],
              {#mode: mode, #flush: flush},
            ),
            returnValue: _i8.Future<_i4.File>.value(
              _FakeFile_3(
                this,
                Invocation.method(
                  #writeAsBytes,
                  [bytes],
                  {#mode: mode, #flush: flush},
                ),
              ),
            ),
          )
          as _i8.Future<_i4.File>);

  @override
  void writeAsBytesSync(
    List<int>? bytes, {
    _i4.FileMode? mode = _i4.FileMode.write,
    bool? flush = false,
  }) => super.noSuchMethod(
    Invocation.method(#writeAsBytesSync, [bytes], {#mode: mode, #flush: flush}),
    returnValueForMissingStub: null,
  );

  @override
  _i8.Future<_i4.File> writeAsString(
    String? contents, {
    _i4.FileMode? mode = _i4.FileMode.write,
    _i13.Encoding? encoding = const _i13.Utf8Codec(),
    bool? flush = false,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #writeAsString,
              [contents],
              {#mode: mode, #encoding: encoding, #flush: flush},
            ),
            returnValue: _i8.Future<_i4.File>.value(
              _FakeFile_3(
                this,
                Invocation.method(
                  #writeAsString,
                  [contents],
                  {#mode: mode, #encoding: encoding, #flush: flush},
                ),
              ),
            ),
          )
          as _i8.Future<_i4.File>);

  @override
  void writeAsStringSync(
    String? contents, {
    _i4.FileMode? mode = _i4.FileMode.write,
    _i13.Encoding? encoding = const _i13.Utf8Codec(),
    bool? flush = false,
  }) => super.noSuchMethod(
    Invocation.method(
      #writeAsStringSync,
      [contents],
      {#mode: mode, #encoding: encoding, #flush: flush},
    ),
    returnValueForMissingStub: null,
  );

  @override
  _i8.Future<bool> exists() =>
      (super.noSuchMethod(
            Invocation.method(#exists, []),
            returnValue: _i8.Future<bool>.value(false),
          )
          as _i8.Future<bool>);

  @override
  bool existsSync() =>
      (super.noSuchMethod(
            Invocation.method(#existsSync, []),
            returnValue: false,
          )
          as bool);

  @override
  _i8.Future<String> resolveSymbolicLinks() =>
      (super.noSuchMethod(
            Invocation.method(#resolveSymbolicLinks, []),
            returnValue: _i8.Future<String>.value(
              _i12.dummyValue<String>(
                this,
                Invocation.method(#resolveSymbolicLinks, []),
              ),
            ),
          )
          as _i8.Future<String>);

  @override
  String resolveSymbolicLinksSync() =>
      (super.noSuchMethod(
            Invocation.method(#resolveSymbolicLinksSync, []),
            returnValue: _i12.dummyValue<String>(
              this,
              Invocation.method(#resolveSymbolicLinksSync, []),
            ),
          )
          as String);

  @override
  _i8.Future<_i4.FileStat> stat() =>
      (super.noSuchMethod(
            Invocation.method(#stat, []),
            returnValue: _i8.Future<_i4.FileStat>.value(
              _FakeFileStat_10(this, Invocation.method(#stat, [])),
            ),
          )
          as _i8.Future<_i4.FileStat>);

  @override
  _i4.FileStat statSync() =>
      (super.noSuchMethod(
            Invocation.method(#statSync, []),
            returnValue: _FakeFileStat_10(
              this,
              Invocation.method(#statSync, []),
            ),
          )
          as _i4.FileStat);

  @override
  _i8.Stream<_i4.FileSystemEvent> watch({
    int? events = 15,
    bool? recursive = false,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#watch, [], {
              #events: events,
              #recursive: recursive,
            }),
            returnValue: _i8.Stream<_i4.FileSystemEvent>.empty(),
          )
          as _i8.Stream<_i4.FileSystemEvent>);
}

/// A class which mocks [ImagePickerPlatform].
///
/// See the documentation for Mockito's code generation for more information.
class MockImagePickerPlatform extends _i1.Mock
    implements _i15.ImagePickerPlatform {
  MockImagePickerPlatform() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i5.PickedFile?> pickImage({
    required _i5.ImageSource? source,
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    _i5.CameraDevice? preferredCameraDevice = _i5.CameraDevice.rear,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#pickImage, [], {
              #source: source,
              #maxWidth: maxWidth,
              #maxHeight: maxHeight,
              #imageQuality: imageQuality,
              #preferredCameraDevice: preferredCameraDevice,
            }),
            returnValue: _i8.Future<_i5.PickedFile?>.value(),
          )
          as _i8.Future<_i5.PickedFile?>);

  @override
  _i8.Future<List<_i5.PickedFile>?> pickMultiImage({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#pickMultiImage, [], {
              #maxWidth: maxWidth,
              #maxHeight: maxHeight,
              #imageQuality: imageQuality,
            }),
            returnValue: _i8.Future<List<_i5.PickedFile>?>.value(),
          )
          as _i8.Future<List<_i5.PickedFile>?>);

  @override
  _i8.Future<_i5.PickedFile?> pickVideo({
    required _i5.ImageSource? source,
    _i5.CameraDevice? preferredCameraDevice = _i5.CameraDevice.rear,
    Duration? maxDuration,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#pickVideo, [], {
              #source: source,
              #preferredCameraDevice: preferredCameraDevice,
              #maxDuration: maxDuration,
            }),
            returnValue: _i8.Future<_i5.PickedFile?>.value(),
          )
          as _i8.Future<_i5.PickedFile?>);

  @override
  _i8.Future<_i5.LostData> retrieveLostData() =>
      (super.noSuchMethod(
            Invocation.method(#retrieveLostData, []),
            returnValue: _i8.Future<_i5.LostData>.value(
              _FakeLostData_11(this, Invocation.method(#retrieveLostData, [])),
            ),
          )
          as _i8.Future<_i5.LostData>);

  @override
  _i8.Future<_i5.XFile?> getImage({
    required _i5.ImageSource? source,
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    _i5.CameraDevice? preferredCameraDevice = _i5.CameraDevice.rear,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#getImage, [], {
              #source: source,
              #maxWidth: maxWidth,
              #maxHeight: maxHeight,
              #imageQuality: imageQuality,
              #preferredCameraDevice: preferredCameraDevice,
            }),
            returnValue: _i8.Future<_i5.XFile?>.value(),
          )
          as _i8.Future<_i5.XFile?>);

  @override
  _i8.Future<List<_i5.XFile>?> getMultiImage({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#getMultiImage, [], {
              #maxWidth: maxWidth,
              #maxHeight: maxHeight,
              #imageQuality: imageQuality,
            }),
            returnValue: _i8.Future<List<_i5.XFile>?>.value(),
          )
          as _i8.Future<List<_i5.XFile>?>);

  @override
  _i8.Future<List<_i5.XFile>> getMedia({required _i16.MediaOptions? options}) =>
      (super.noSuchMethod(
            Invocation.method(#getMedia, [], {#options: options}),
            returnValue: _i8.Future<List<_i5.XFile>>.value(<_i5.XFile>[]),
          )
          as _i8.Future<List<_i5.XFile>>);

  @override
  _i8.Future<_i5.XFile?> getVideo({
    required _i5.ImageSource? source,
    _i5.CameraDevice? preferredCameraDevice = _i5.CameraDevice.rear,
    Duration? maxDuration,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#getVideo, [], {
              #source: source,
              #preferredCameraDevice: preferredCameraDevice,
              #maxDuration: maxDuration,
            }),
            returnValue: _i8.Future<_i5.XFile?>.value(),
          )
          as _i8.Future<_i5.XFile?>);

  @override
  _i8.Future<_i5.LostDataResponse> getLostData() =>
      (super.noSuchMethod(
            Invocation.method(#getLostData, []),
            returnValue: _i8.Future<_i5.LostDataResponse>.value(
              _FakeLostDataResponse_12(
                this,
                Invocation.method(#getLostData, []),
              ),
            ),
          )
          as _i8.Future<_i5.LostDataResponse>);

  @override
  _i8.Future<_i5.XFile?> getImageFromSource({
    required _i5.ImageSource? source,
    _i16.ImagePickerOptions? options = const _i16.ImagePickerOptions(),
  }) =>
      (super.noSuchMethod(
            Invocation.method(#getImageFromSource, [], {
              #source: source,
              #options: options,
            }),
            returnValue: _i8.Future<_i5.XFile?>.value(),
          )
          as _i8.Future<_i5.XFile?>);

  @override
  _i8.Future<List<_i5.XFile>> getMultiImageWithOptions({
    _i16.MultiImagePickerOptions? options =
        const _i16.MultiImagePickerOptions(),
  }) =>
      (super.noSuchMethod(
            Invocation.method(#getMultiImageWithOptions, [], {
              #options: options,
            }),
            returnValue: _i8.Future<List<_i5.XFile>>.value(<_i5.XFile>[]),
          )
          as _i8.Future<List<_i5.XFile>>);

  @override
  bool supportsImageSource(_i5.ImageSource? source) =>
      (super.noSuchMethod(
            Invocation.method(#supportsImageSource, [source]),
            returnValue: false,
          )
          as bool);
}
