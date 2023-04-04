import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/teams/teams.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

part 'team_cubit.freezed.dart';

@freezed
abstract class TeamState with _$TeamState, EquatableMixin {
  const factory TeamState.initial() = _InitialTeamStats;

  const factory TeamState.loading() = _LoadingTeamStats;

  const factory TeamState.teamsByUserId(List<Team> teams) =
      _TeamsByUserIdTeamStats;

  const factory TeamState.teamById(Team team) = _TeamByIdTeamStats;

  const factory TeamState.teamMembers(List<User> teamMembers) = _TeamMembers;

  const factory TeamState.joinRequests(List<JoinRequest> joinRequests) =
      _JoinRequests;

  const factory TeamState.joinRequestAccepted() = _JoinRequestAccepted;

  const factory TeamState.joinRequestRejected() = _JoinRequestRejected;

  const factory TeamState.memberKicked() = _MemberKicked;

  const factory TeamState.joinedTeam() = _JoinedTeam;

  const factory TeamState.leftTeam() = _LeftTeam;

  const factory TeamState.messagedAllMembers() = _MessagedAllMembers;

  const factory TeamState.teamSearchedByName(PageOf<Team> teams) =
      _TeamSearchedByName;

  const factory TeamState.popularTeams(PageOf<Team> teams) = _PopularTeams;

  const factory TeamState.failure(Failure error) = _ErrorTeamStats;

  const TeamState._();

  @override
  List<Object?> get props {
    return maybeWhen(
      failure: (error) => [error],
      orElse: () => [],
    );
  }
}

class TeamCubit extends Cubit<TeamState> {
  TeamCubit({
    required GetTeamsByUser getTeamsByUser,
    required GetTeamById getTeamById,
    required GetTeamMembers getTeamMembers,
    required GetTeamJoinRequests getTeamJoinRequests,
    required AcceptJoinRequest acceptJoinRequest,
    required KickMemberFromTeam kickMemberFromTeam,
    required DeclineJoinRequest declineJoinRequest,
    required JoinTeam joinTeam,
    required LeaveTeam leaveTeam,
    required MessageAllMembers messageAllMembers,
    required SearchTeamByName searchTeamByName,
    required GetPopularTeams searchPopularTeams,
  })  : _getTeamsByUser = getTeamsByUser,
        _getTeamById = getTeamById,
        _getTeamMembers = getTeamMembers,
        _getTeamJoinRequests = getTeamJoinRequests,
        _acceptJoinRequest = acceptJoinRequest,
        _kickMemberFromTeam = kickMemberFromTeam,
        _declineJoinRequest = declineJoinRequest,
        _joinTeam = joinTeam,
        _leaveTeam = leaveTeam,
        _messageAllMembers = messageAllMembers,
        _searchTeamByName = searchTeamByName,
        _searchPopularTeams = searchPopularTeams,
        super(const _InitialTeamStats());

  late final GetTeamsByUser _getTeamsByUser;
  late final GetTeamById _getTeamById;
  late final GetTeamMembers _getTeamMembers;
  late final GetTeamJoinRequests _getTeamJoinRequests;
  late final AcceptJoinRequest _acceptJoinRequest;
  late final KickMemberFromTeam _kickMemberFromTeam;
  late final DeclineJoinRequest _declineJoinRequest;
  late final JoinTeam _joinTeam;
  late final LeaveTeam _leaveTeam;
  late final MessageAllMembers _messageAllMembers;
  late final SearchTeamByName _searchTeamByName;
  late final GetPopularTeams _searchPopularTeams;

  Future<void> getTeamsByUserId(String userId) async {
    emit(const _LoadingTeamStats());
    final result = await _getTeamsByUser(userId);
    result.fold(
      (failure) => emit(_ErrorTeamStats(failure)),
      (teams) => emit(_TeamsByUserIdTeamStats(teams)),
    );
  }

  Future<void> getTeamById(String teamId) async {
    emit(const _LoadingTeamStats());
    final result = await _getTeamById(teamId);
    result.fold(
      (failure) => emit(_ErrorTeamStats(failure)),
      (team) => emit(_TeamByIdTeamStats(team)),
    );
  }

  Future<void> getTeamMembers({
    required String teamId,
    required int maxMembers,
  }) async {
    emit(const _LoadingTeamStats());
    final result = await _getTeamMembers(
      GetTeamMembersParams(
        teamId,
        maxMembers,
      ),
    );
    result.fold(
      (failure) => emit(_ErrorTeamStats(failure)),
      (teamMembers) => emit(_TeamMembers(teamMembers)),
    );
  }

  Future<void> getTeamJoinRequests({
    required String teamId,
    required int maxRequests,
  }) async {
    emit(const _LoadingTeamStats());
    final result = await _getTeamJoinRequests(teamId);
    result.fold(
      (failure) => emit(_ErrorTeamStats(failure)),
      (joinRequests) => emit(_JoinRequests(joinRequests)),
    );
  }

  Future<void> acceptJoinRequest({
    required String teamId,
    required String userId,
  }) async {
    emit(const _LoadingTeamStats());
    final result = await _acceptJoinRequest(
      AcceptJoinRequestParams(
        teamId,
        userId,
      ),
    );
    result.fold(
      (failure) => emit(_ErrorTeamStats(failure)),
      (success) => emit(const _JoinRequestAccepted()),
    );
  }

  Future<void> declineJoinRequest({
    required String teamId,
    required String userId,
  }) async {
    emit(const _LoadingTeamStats());
    final result = await _declineJoinRequest(
      DeclineJoinRequestParams(
        teamId,
        userId,
      ),
    );
    result.fold(
      (failure) => emit(_ErrorTeamStats(failure)),
      (success) => emit(const _JoinRequestRejected()),
    );
  }

  Future<void> kickMemberFromTeam({
    required String teamId,
    required String userId,
  }) async {
    emit(const _LoadingTeamStats());
    final result = await _kickMemberFromTeam(
      KickMemberFromTeamParams(
        teamId,
        userId,
      ),
    );
    result.fold(
      (failure) => emit(_ErrorTeamStats(failure)),
      (success) => emit(const _MemberKicked()),
    );
  }

  Future<void> joinTeam({
    required String teamId,
    String? message,
    String? password,
  }) async {
    emit(const _LoadingTeamStats());
    final result = await _joinTeam(
      JoinTeamParams(
        teamId,
        message: message,
        passwrord: password,
      ),
    );
    result.fold(
      (failure) => emit(_ErrorTeamStats(failure)),
      (success) => emit(const _JoinedTeam()),
    );
  }

  Future<void> leaveTeam({
    required String teamId,
  }) async {
    emit(const _LoadingTeamStats());
    final result = await _leaveTeam(teamId);
    result.fold(
      (failure) => emit(_ErrorTeamStats(failure)),
      (success) => emit(const _LeftTeam()),
    );
  }

  Future<void> messageAllMembers({
    required String teamId,
    required String message,
  }) async {
    emit(const _LoadingTeamStats());
    final result = await _messageAllMembers(
      MessageAllMembersParams(
        teamId,
        message,
      ),
    );
    result.fold(
      (failure) => emit(_ErrorTeamStats(failure)),
      (success) => emit(const _MessagedAllMembers()),
    );
  }

  Future<void> searchTeamByName({
    required String name,
    required int page,
  }) async {
    emit(const _LoadingTeamStats());
    final result = await _searchTeamByName(
      SearchTeamByNameParams(
        name,
        page,
      ),
    );
    result.fold(
      (failure) => emit(_ErrorTeamStats(failure)),
      (teams) => emit(_TeamSearchedByName(teams)),
    );
  }

  Future<void> getPopularTeams({
    required int page,
  }) async {
    emit(const _LoadingTeamStats());
    final result = await _searchPopularTeams(page);
    result.fold(
      (failure) => emit(_ErrorTeamStats(failure)),
      (teams) => emit(_PopularTeams(teams)),
    );
  }
}
