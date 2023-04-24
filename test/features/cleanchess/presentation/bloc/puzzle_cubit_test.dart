import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/puzzle_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';
import 'package:mockito/mockito.dart';

import 'lichess_bloc_mocks.mocks.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockMGetDailyPuzzle mockGetDailyPuzzle;
  late MockMGetPuzzleById mockGetPuzzleById;
  late MockMGetPuzzleActivity mockGetPuzzleActivity;
  late MockMGetPuzzleDashboard mockGetPuzzleDashboard;

  late PuzzleCubit bloc;

  setUp(() {
    mockGetDailyPuzzle = MockMGetDailyPuzzle();
    mockGetPuzzleById = MockMGetPuzzleById();
    mockGetPuzzleActivity = MockMGetPuzzleActivity();
    mockGetPuzzleDashboard = MockMGetPuzzleDashboard();

    bloc = PuzzleCubit(
      getDailyPuzzle: mockGetDailyPuzzle,
      getPuzzleById: mockGetPuzzleById,
      getPuzzleActivity: mockGetPuzzleActivity,
      getPuzzleDashboard: mockGetPuzzleDashboard,
    );
  });

  group('LichessPuzzle', () {
    group('Get Daily LichessPuzzle', () {
      blocTest<PuzzleCubit, PuzzleState>(
        'Success',
        build: () {
          when(mockGetDailyPuzzle.call()).thenAnswer(
            (_) async => const Right(LichessPuzzle()),
          );

          return bloc;
        },
        act: (bloc) => bloc.getDailyPuzzle(),
        expect: () => [
          const PuzzleState.loading(),
          const PuzzleState.dailyPuzzle(LichessPuzzle()),
        ],
        verify: (bloc) {
          verify(mockGetDailyPuzzle.call()).called(1);
        },
      );
      blocTest<PuzzleCubit, PuzzleState>(
        'Failure',
        build: () {
          when(mockGetDailyPuzzle.call()).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.getDailyPuzzle(),
        expect: () => [
          const PuzzleState.loading(),
          const PuzzleState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockGetDailyPuzzle.call()).called(1);
        },
      );
    });

    group('Get LichessPuzzle By Id', () {
      blocTest<PuzzleCubit, PuzzleState>(
        'Success',
        build: () {
          when(mockGetPuzzleById.call(any)).thenAnswer(
            (_) async => const Right(LichessPuzzle()),
          );

          return bloc;
        },
        act: (bloc) => bloc.getPuzzleById(''),
        expect: () => [
          const PuzzleState.loading(),
          const PuzzleState.puzzleById(LichessPuzzle()),
        ],
        verify: (bloc) {
          verify(mockGetPuzzleById.call(any)).called(1);
        },
      );
      blocTest<PuzzleCubit, PuzzleState>(
        'Failure',
        build: () {
          when(mockGetPuzzleById.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.getPuzzleById(''),
        expect: () => [
          const PuzzleState.loading(),
          const PuzzleState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockGetPuzzleById.call(any)).called(1);
        },
      );
    });

    group('Get LichessPuzzle Activity', () {
      blocTest<PuzzleCubit, PuzzleState>(
        'Success',
        build: () {
          when(mockGetPuzzleActivity.call(any)).thenAnswer(
            (_) async => Right(Stream<LichessPuzzleActivity>.fromIterable([
              const LichessPuzzleActivity(id: '1'),
              const LichessPuzzleActivity(id: '2'),
              const LichessPuzzleActivity(id: '3'),
            ])),
          );

          return bloc;
        },
        act: (bloc) => bloc.getPuzzleActivity(),
        expect: () => [
          const PuzzleState.loading(),
          const PuzzleState.puzzleActivity(LichessPuzzleActivity(id: '1')),
          const PuzzleState.puzzleActivity(LichessPuzzleActivity(id: '2')),
          const PuzzleState.puzzleActivity(LichessPuzzleActivity(id: '3')),
        ],
        verify: (bloc) {
          verify(mockGetPuzzleActivity.call(any)).called(1);
        },
      );
      blocTest<PuzzleCubit, PuzzleState>(
        'Failure',
        build: () {
          when(mockGetPuzzleActivity.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.getPuzzleActivity(),
        expect: () => [
          const PuzzleState.loading(),
          const PuzzleState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockGetPuzzleActivity.call(any)).called(1);
        },
      );
    });

    group('Get LichessPuzzle Dashboard', () {
      blocTest<PuzzleCubit, PuzzleState>(
        'Success',
        build: () {
          when(mockGetPuzzleDashboard.call(any)).thenAnswer(
            (_) async => const Right(LichessPuzzleDashboard()),
          );

          return bloc;
        },
        act: (bloc) => bloc.getPuzzleDashboard(),
        expect: () => [
          const PuzzleState.loading(),
          const PuzzleState.puzzleDashboard(LichessPuzzleDashboard()),
        ],
        verify: (bloc) {
          verify(mockGetPuzzleDashboard.call(any)).called(1);
        },
      );
      blocTest<PuzzleCubit, PuzzleState>(
        'Failure',
        build: () {
          when(mockGetPuzzleDashboard.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.getPuzzleDashboard(),
        expect: () => [
          const PuzzleState.loading(),
          const PuzzleState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockGetPuzzleDashboard.call(any)).called(1);
        },
      );
    });
  });
}
