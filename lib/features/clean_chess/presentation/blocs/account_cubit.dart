import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/account/account.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

part 'account_cubit.freezed.dart';

@freezed
abstract class AccountState with _$AccountState, EquatableMixin {
  const factory AccountState.initial() = _InitialAccountState;

  const factory AccountState.loading() = _LoadingAccountState;

  const factory AccountState.profile(User user) = _ProfileAccountState;

  const factory AccountState.myEmail(String email) = _MyEmailAccountState;

  const factory AccountState.kidModeStatus(bool status) =
      _KidModeStatusAccountState;

  const factory AccountState.kidModeStatusSet() = _KidModeStatusSetAccountState;

  const factory AccountState.myPreferences(UserPreferences preferences) =
      _MyPreferencesAccountState;

  const factory AccountState.failure(Failure error) = _ErrorAccountState;

  const AccountState._();

  @override
  List<Object?> get props {
    return maybeWhen(
      failure: (error) => [error],
      orElse: () => [],
    );
  }
}

class AccountCubit extends Cubit<AccountState> {
  AccountCubit({
    required GetMyProfile getMyProfile,
    required GetMyEmail getMyEmail,
    required GetMyKidModeStatus getKidModeStatus,
    required SetMyKidModeStatus setKidModeStatus,
    required GetMyPreferences getMyPreferences,
  }) : super(const AccountState.initial()) {
    _getMyProfile = getMyProfile;
    _getMyEmail = getMyEmail;
    _getKidModeStatus = getKidModeStatus;
    _setKidModeStatus = setKidModeStatus;
    _getMyPreferences = getMyPreferences;
  }

  late final GetMyProfile _getMyProfile;
  late final GetMyEmail _getMyEmail;
  late final GetMyKidModeStatus _getKidModeStatus;
  late final SetMyKidModeStatus _setKidModeStatus;
  late final GetMyPreferences _getMyPreferences;

  Future<void> getMyProfile() async {
    emit(const _LoadingAccountState());
    final result = await _getMyProfile();
    result.fold(
      (failure) => emit(_ErrorAccountState(failure)),
      (profile) => emit(_ProfileAccountState(profile)),
    );
  }

  Future<void> getMyEmail() async {
    emit(const _LoadingAccountState());
    final result = await _getMyEmail();
    result.fold(
      (failure) => emit(AccountState.failure(failure)),
      (email) => emit(_MyEmailAccountState(email)),
    );
  }

  Future<void> getMyKidModeStatus() async {
    emit(const _LoadingAccountState());
    final result = await _getKidModeStatus();
    result.fold(
      (failure) => emit(AccountState.failure(failure)),
      (kidModeStatus) => emit(_KidModeStatusAccountState(kidModeStatus)),
    );
  }

  Future<void> setMyKidModeStatus(bool kidModeStatus) async {
    emit(const _LoadingAccountState());
    final result = await _setKidModeStatus(kidModeStatus);
    result.fold(
      (failure) => emit(AccountState.failure(failure)),
      (_) => emit(const _KidModeStatusSetAccountState()),
    );
  }

  Future<void> getMyPreferences() async {
    emit(const _LoadingAccountState());
    final result = await _getMyPreferences();
    result.fold(
      (failure) => emit(AccountState.failure(failure)),
      (preferences) => emit(_MyPreferencesAccountState(preferences)),
    );
  }
}
