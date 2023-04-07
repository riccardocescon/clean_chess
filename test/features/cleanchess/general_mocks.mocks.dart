// Mocks generated by Mockito 5.3.2 from annotations
// in cleanchess/test/features/cleanchess/general_mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;

import 'package:cleanchess/core/errors/failure.dart' as _i9;
import 'package:dartz/dartz.dart' as _i6;
import 'package:dio/dio.dart' as _i2;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:lichess_client_dio/lichess_client_dio.dart' as _i3;
import 'package:lichess_client_dio/src/services/puzzle_service.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

import 'general_mocks.dart' as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDio_0 extends _i1.SmartFake implements _i2.Dio {
  _FakeDio_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAccountServiceDio_1 extends _i1.SmartFake
    implements _i3.AccountServiceDio {
  _FakeAccountServiceDio_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRelationsServiceDio_2 extends _i1.SmartFake
    implements _i3.RelationsServiceDio {
  _FakeRelationsServiceDio_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUsersServiceDio_3 extends _i1.SmartFake
    implements _i3.UsersServiceDio {
  _FakeUsersServiceDio_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTeamsServiceDio_4 extends _i1.SmartFake
    implements _i3.TeamsServiceDio {
  _FakeTeamsServiceDio_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTvServiceDio_5 extends _i1.SmartFake implements _i3.TvServiceDio {
  _FakeTvServiceDio_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePuzzleServiceDio_6 extends _i1.SmartFake
    implements _i4.PuzzleServiceDio {
  _FakePuzzleServiceDio_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGamesServiceDio_7 extends _i1.SmartFake
    implements _i3.GamesServiceDio {
  _FakeGamesServiceDio_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRelationsService_8 extends _i1.SmartFake
    implements _i3.RelationsService {
  _FakeRelationsService_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIOSOptions_9 extends _i1.SmartFake implements _i5.IOSOptions {
  _FakeIOSOptions_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAndroidOptions_10 extends _i1.SmartFake
    implements _i5.AndroidOptions {
  _FakeAndroidOptions_10(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLinuxOptions_11 extends _i1.SmartFake implements _i5.LinuxOptions {
  _FakeLinuxOptions_11(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWindowsOptions_12 extends _i1.SmartFake
    implements _i5.WindowsOptions {
  _FakeWindowsOptions_12(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWebOptions_13 extends _i1.SmartFake implements _i5.WebOptions {
  _FakeWebOptions_13(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMacOsOptions_14 extends _i1.SmartFake implements _i5.MacOsOptions {
  _FakeMacOsOptions_14(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_15<L, R> extends _i1.SmartFake implements _i6.Either<L, R> {
  _FakeEither_15(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MLichessClientDio].
///
/// See the documentation for Mockito's code generation for more information.
class MockMLichessClientDio extends _i1.Mock implements _i7.MLichessClientDio {
  @override
  _i2.Dio get dio => (super.noSuchMethod(
        Invocation.getter(#dio),
        returnValue: _FakeDio_0(
          this,
          Invocation.getter(#dio),
        ),
        returnValueForMissingStub: _FakeDio_0(
          this,
          Invocation.getter(#dio),
        ),
      ) as _i2.Dio);
  @override
  _i3.AccountServiceDio get account => (super.noSuchMethod(
        Invocation.getter(#account),
        returnValue: _FakeAccountServiceDio_1(
          this,
          Invocation.getter(#account),
        ),
        returnValueForMissingStub: _FakeAccountServiceDio_1(
          this,
          Invocation.getter(#account),
        ),
      ) as _i3.AccountServiceDio);
  @override
  _i3.RelationsServiceDio get relations => (super.noSuchMethod(
        Invocation.getter(#relations),
        returnValue: _FakeRelationsServiceDio_2(
          this,
          Invocation.getter(#relations),
        ),
        returnValueForMissingStub: _FakeRelationsServiceDio_2(
          this,
          Invocation.getter(#relations),
        ),
      ) as _i3.RelationsServiceDio);
  @override
  _i3.UsersServiceDio get users => (super.noSuchMethod(
        Invocation.getter(#users),
        returnValue: _FakeUsersServiceDio_3(
          this,
          Invocation.getter(#users),
        ),
        returnValueForMissingStub: _FakeUsersServiceDio_3(
          this,
          Invocation.getter(#users),
        ),
      ) as _i3.UsersServiceDio);
  @override
  _i3.TeamsServiceDio get teams => (super.noSuchMethod(
        Invocation.getter(#teams),
        returnValue: _FakeTeamsServiceDio_4(
          this,
          Invocation.getter(#teams),
        ),
        returnValueForMissingStub: _FakeTeamsServiceDio_4(
          this,
          Invocation.getter(#teams),
        ),
      ) as _i3.TeamsServiceDio);
  @override
  _i3.TvServiceDio get tv => (super.noSuchMethod(
        Invocation.getter(#tv),
        returnValue: _FakeTvServiceDio_5(
          this,
          Invocation.getter(#tv),
        ),
        returnValueForMissingStub: _FakeTvServiceDio_5(
          this,
          Invocation.getter(#tv),
        ),
      ) as _i3.TvServiceDio);
  @override
  _i4.PuzzleServiceDio get puzzles => (super.noSuchMethod(
        Invocation.getter(#puzzles),
        returnValue: _FakePuzzleServiceDio_6(
          this,
          Invocation.getter(#puzzles),
        ),
        returnValueForMissingStub: _FakePuzzleServiceDio_6(
          this,
          Invocation.getter(#puzzles),
        ),
      ) as _i4.PuzzleServiceDio);
  @override
  _i3.GamesServiceDio get games => (super.noSuchMethod(
        Invocation.getter(#games),
        returnValue: _FakeGamesServiceDio_7(
          this,
          Invocation.getter(#games),
        ),
        returnValueForMissingStub: _FakeGamesServiceDio_7(
          this,
          Invocation.getter(#games),
        ),
      ) as _i3.GamesServiceDio);
  @override
  _i3.RelationsService get social => (super.noSuchMethod(
        Invocation.getter(#social),
        returnValue: _FakeRelationsService_8(
          this,
          Invocation.getter(#social),
        ),
        returnValueForMissingStub: _FakeRelationsService_8(
          this,
          Invocation.getter(#social),
        ),
      ) as _i3.RelationsService);
  @override
  _i8.Future<void> close({bool? force = false}) => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
          {#force: force},
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}

/// A class which mocks [MFlutterSecureStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockMFlutterSecureStorage extends _i1.Mock
    implements _i7.MFlutterSecureStorage {
  @override
  _i5.IOSOptions get iOptions => (super.noSuchMethod(
        Invocation.getter(#iOptions),
        returnValue: _FakeIOSOptions_9(
          this,
          Invocation.getter(#iOptions),
        ),
        returnValueForMissingStub: _FakeIOSOptions_9(
          this,
          Invocation.getter(#iOptions),
        ),
      ) as _i5.IOSOptions);
  @override
  _i5.AndroidOptions get aOptions => (super.noSuchMethod(
        Invocation.getter(#aOptions),
        returnValue: _FakeAndroidOptions_10(
          this,
          Invocation.getter(#aOptions),
        ),
        returnValueForMissingStub: _FakeAndroidOptions_10(
          this,
          Invocation.getter(#aOptions),
        ),
      ) as _i5.AndroidOptions);
  @override
  _i5.LinuxOptions get lOptions => (super.noSuchMethod(
        Invocation.getter(#lOptions),
        returnValue: _FakeLinuxOptions_11(
          this,
          Invocation.getter(#lOptions),
        ),
        returnValueForMissingStub: _FakeLinuxOptions_11(
          this,
          Invocation.getter(#lOptions),
        ),
      ) as _i5.LinuxOptions);
  @override
  _i5.WindowsOptions get wOptions => (super.noSuchMethod(
        Invocation.getter(#wOptions),
        returnValue: _FakeWindowsOptions_12(
          this,
          Invocation.getter(#wOptions),
        ),
        returnValueForMissingStub: _FakeWindowsOptions_12(
          this,
          Invocation.getter(#wOptions),
        ),
      ) as _i5.WindowsOptions);
  @override
  _i5.WebOptions get webOptions => (super.noSuchMethod(
        Invocation.getter(#webOptions),
        returnValue: _FakeWebOptions_13(
          this,
          Invocation.getter(#webOptions),
        ),
        returnValueForMissingStub: _FakeWebOptions_13(
          this,
          Invocation.getter(#webOptions),
        ),
      ) as _i5.WebOptions);
  @override
  _i5.MacOsOptions get mOptions => (super.noSuchMethod(
        Invocation.getter(#mOptions),
        returnValue: _FakeMacOsOptions_14(
          this,
          Invocation.getter(#mOptions),
        ),
        returnValueForMissingStub: _FakeMacOsOptions_14(
          this,
          Invocation.getter(#mOptions),
        ),
      ) as _i5.MacOsOptions);
  @override
  _i8.Future<void> write({
    required String? key,
    required String? value,
    _i5.IOSOptions? iOptions,
    _i5.AndroidOptions? aOptions,
    _i5.LinuxOptions? lOptions,
    _i5.WebOptions? webOptions,
    _i5.MacOsOptions? mOptions,
    _i5.WindowsOptions? wOptions,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #write,
          [],
          {
            #key: key,
            #value: value,
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions,
          },
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<String?> read({
    required String? key,
    _i5.IOSOptions? iOptions,
    _i5.AndroidOptions? aOptions,
    _i5.LinuxOptions? lOptions,
    _i5.WebOptions? webOptions,
    _i5.MacOsOptions? mOptions,
    _i5.WindowsOptions? wOptions,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [],
          {
            #key: key,
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions,
          },
        ),
        returnValue: _i8.Future<String?>.value(),
        returnValueForMissingStub: _i8.Future<String?>.value(),
      ) as _i8.Future<String?>);
  @override
  _i8.Future<bool> containsKey({
    required String? key,
    _i5.IOSOptions? iOptions,
    _i5.AndroidOptions? aOptions,
    _i5.LinuxOptions? lOptions,
    _i5.WebOptions? webOptions,
    _i5.MacOsOptions? mOptions,
    _i5.WindowsOptions? wOptions,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #containsKey,
          [],
          {
            #key: key,
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions,
          },
        ),
        returnValue: _i8.Future<bool>.value(false),
        returnValueForMissingStub: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);
  @override
  _i8.Future<void> delete({
    required String? key,
    _i5.IOSOptions? iOptions,
    _i5.AndroidOptions? aOptions,
    _i5.LinuxOptions? lOptions,
    _i5.WebOptions? webOptions,
    _i5.MacOsOptions? mOptions,
    _i5.WindowsOptions? wOptions,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [],
          {
            #key: key,
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions,
          },
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<Map<String, String>> readAll({
    _i5.IOSOptions? iOptions,
    _i5.AndroidOptions? aOptions,
    _i5.LinuxOptions? lOptions,
    _i5.WebOptions? webOptions,
    _i5.MacOsOptions? mOptions,
    _i5.WindowsOptions? wOptions,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readAll,
          [],
          {
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions,
          },
        ),
        returnValue: _i8.Future<Map<String, String>>.value(<String, String>{}),
        returnValueForMissingStub:
            _i8.Future<Map<String, String>>.value(<String, String>{}),
      ) as _i8.Future<Map<String, String>>);
  @override
  _i8.Future<void> deleteAll({
    _i5.IOSOptions? iOptions,
    _i5.AndroidOptions? aOptions,
    _i5.LinuxOptions? lOptions,
    _i5.WebOptions? webOptions,
    _i5.MacOsOptions? mOptions,
    _i5.WindowsOptions? wOptions,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteAll,
          [],
          {
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions,
          },
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}

/// A class which mocks [MLichessTokenProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockMLichessTokenProvider extends _i1.Mock
    implements _i7.MLichessTokenProvider {
  @override
  String get accessToken => (super.noSuchMethod(
        Invocation.getter(#accessToken),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  void setClient() => super.noSuchMethod(
        Invocation.method(
          #setClient,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i8.Future<void> saveAccessToken(String? accessToken) => (super.noSuchMethod(
        Invocation.method(
          #saveAccessToken,
          [accessToken],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
  @override
  _i8.Future<_i6.Either<_i9.Failure, _i3.LichessClient>> getClient() =>
      (super.noSuchMethod(
        Invocation.method(
          #getClient,
          [],
        ),
        returnValue:
            _i8.Future<_i6.Either<_i9.Failure, _i3.LichessClient>>.value(
                _FakeEither_15<_i9.Failure, _i3.LichessClient>(
          this,
          Invocation.method(
            #getClient,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i6.Either<_i9.Failure, _i3.LichessClient>>.value(
                _FakeEither_15<_i9.Failure, _i3.LichessClient>(
          this,
          Invocation.method(
            #getClient,
            [],
          ),
        )),
      ) as _i8.Future<_i6.Either<_i9.Failure, _i3.LichessClient>>);
  @override
  _i8.Future<void> revokeToken() => (super.noSuchMethod(
        Invocation.method(
          #revokeToken,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}
