// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SocialEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getFollowingUsers,
    required TResult Function(String username) followUser,
    required TResult Function(String username) unfollowUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getFollowingUsers,
    TResult? Function(String username)? followUser,
    TResult? Function(String username)? unfollowUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getFollowingUsers,
    TResult Function(String username)? followUser,
    TResult Function(String username)? unfollowUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetFollowingUsersEvent value) getFollowingUsers,
    required TResult Function(FollowUserEvent value) followUser,
    required TResult Function(UnfollowUserEvent value) unfollowUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetFollowingUsersEvent value)? getFollowingUsers,
    TResult? Function(FollowUserEvent value)? followUser,
    TResult? Function(UnfollowUserEvent value)? unfollowUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetFollowingUsersEvent value)? getFollowingUsers,
    TResult Function(FollowUserEvent value)? followUser,
    TResult Function(UnfollowUserEvent value)? unfollowUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialEventCopyWith<$Res> {
  factory $SocialEventCopyWith(
          SocialEvent value, $Res Function(SocialEvent) then) =
      _$SocialEventCopyWithImpl<$Res, SocialEvent>;
}

/// @nodoc
class _$SocialEventCopyWithImpl<$Res, $Val extends SocialEvent>
    implements $SocialEventCopyWith<$Res> {
  _$SocialEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetFollowingUsersEventCopyWith<$Res> {
  factory _$$GetFollowingUsersEventCopyWith(_$GetFollowingUsersEvent value,
          $Res Function(_$GetFollowingUsersEvent) then) =
      __$$GetFollowingUsersEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetFollowingUsersEventCopyWithImpl<$Res>
    extends _$SocialEventCopyWithImpl<$Res, _$GetFollowingUsersEvent>
    implements _$$GetFollowingUsersEventCopyWith<$Res> {
  __$$GetFollowingUsersEventCopyWithImpl(_$GetFollowingUsersEvent _value,
      $Res Function(_$GetFollowingUsersEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetFollowingUsersEvent implements GetFollowingUsersEvent {
  const _$GetFollowingUsersEvent();

  @override
  String toString() {
    return 'SocialEvent.getFollowingUsers()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetFollowingUsersEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getFollowingUsers,
    required TResult Function(String username) followUser,
    required TResult Function(String username) unfollowUser,
  }) {
    return getFollowingUsers();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getFollowingUsers,
    TResult? Function(String username)? followUser,
    TResult? Function(String username)? unfollowUser,
  }) {
    return getFollowingUsers?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getFollowingUsers,
    TResult Function(String username)? followUser,
    TResult Function(String username)? unfollowUser,
    required TResult orElse(),
  }) {
    if (getFollowingUsers != null) {
      return getFollowingUsers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetFollowingUsersEvent value) getFollowingUsers,
    required TResult Function(FollowUserEvent value) followUser,
    required TResult Function(UnfollowUserEvent value) unfollowUser,
  }) {
    return getFollowingUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetFollowingUsersEvent value)? getFollowingUsers,
    TResult? Function(FollowUserEvent value)? followUser,
    TResult? Function(UnfollowUserEvent value)? unfollowUser,
  }) {
    return getFollowingUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetFollowingUsersEvent value)? getFollowingUsers,
    TResult Function(FollowUserEvent value)? followUser,
    TResult Function(UnfollowUserEvent value)? unfollowUser,
    required TResult orElse(),
  }) {
    if (getFollowingUsers != null) {
      return getFollowingUsers(this);
    }
    return orElse();
  }
}

abstract class GetFollowingUsersEvent implements SocialEvent {
  const factory GetFollowingUsersEvent() = _$GetFollowingUsersEvent;
}

/// @nodoc
abstract class _$$FollowUserEventCopyWith<$Res> {
  factory _$$FollowUserEventCopyWith(
          _$FollowUserEvent value, $Res Function(_$FollowUserEvent) then) =
      __$$FollowUserEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String username});
}

/// @nodoc
class __$$FollowUserEventCopyWithImpl<$Res>
    extends _$SocialEventCopyWithImpl<$Res, _$FollowUserEvent>
    implements _$$FollowUserEventCopyWith<$Res> {
  __$$FollowUserEventCopyWithImpl(
      _$FollowUserEvent _value, $Res Function(_$FollowUserEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
  }) {
    return _then(_$FollowUserEvent(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FollowUserEvent implements FollowUserEvent {
  const _$FollowUserEvent({required this.username});

  @override
  final String username;

  @override
  String toString() {
    return 'SocialEvent.followUser(username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowUserEvent &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowUserEventCopyWith<_$FollowUserEvent> get copyWith =>
      __$$FollowUserEventCopyWithImpl<_$FollowUserEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getFollowingUsers,
    required TResult Function(String username) followUser,
    required TResult Function(String username) unfollowUser,
  }) {
    return followUser(username);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getFollowingUsers,
    TResult? Function(String username)? followUser,
    TResult? Function(String username)? unfollowUser,
  }) {
    return followUser?.call(username);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getFollowingUsers,
    TResult Function(String username)? followUser,
    TResult Function(String username)? unfollowUser,
    required TResult orElse(),
  }) {
    if (followUser != null) {
      return followUser(username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetFollowingUsersEvent value) getFollowingUsers,
    required TResult Function(FollowUserEvent value) followUser,
    required TResult Function(UnfollowUserEvent value) unfollowUser,
  }) {
    return followUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetFollowingUsersEvent value)? getFollowingUsers,
    TResult? Function(FollowUserEvent value)? followUser,
    TResult? Function(UnfollowUserEvent value)? unfollowUser,
  }) {
    return followUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetFollowingUsersEvent value)? getFollowingUsers,
    TResult Function(FollowUserEvent value)? followUser,
    TResult Function(UnfollowUserEvent value)? unfollowUser,
    required TResult orElse(),
  }) {
    if (followUser != null) {
      return followUser(this);
    }
    return orElse();
  }
}

abstract class FollowUserEvent implements SocialEvent {
  const factory FollowUserEvent({required final String username}) =
      _$FollowUserEvent;

  String get username;
  @JsonKey(ignore: true)
  _$$FollowUserEventCopyWith<_$FollowUserEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnfollowUserEventCopyWith<$Res> {
  factory _$$UnfollowUserEventCopyWith(
          _$UnfollowUserEvent value, $Res Function(_$UnfollowUserEvent) then) =
      __$$UnfollowUserEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String username});
}

/// @nodoc
class __$$UnfollowUserEventCopyWithImpl<$Res>
    extends _$SocialEventCopyWithImpl<$Res, _$UnfollowUserEvent>
    implements _$$UnfollowUserEventCopyWith<$Res> {
  __$$UnfollowUserEventCopyWithImpl(
      _$UnfollowUserEvent _value, $Res Function(_$UnfollowUserEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
  }) {
    return _then(_$UnfollowUserEvent(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnfollowUserEvent implements UnfollowUserEvent {
  const _$UnfollowUserEvent({required this.username});

  @override
  final String username;

  @override
  String toString() {
    return 'SocialEvent.unfollowUser(username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnfollowUserEvent &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnfollowUserEventCopyWith<_$UnfollowUserEvent> get copyWith =>
      __$$UnfollowUserEventCopyWithImpl<_$UnfollowUserEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getFollowingUsers,
    required TResult Function(String username) followUser,
    required TResult Function(String username) unfollowUser,
  }) {
    return unfollowUser(username);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getFollowingUsers,
    TResult? Function(String username)? followUser,
    TResult? Function(String username)? unfollowUser,
  }) {
    return unfollowUser?.call(username);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getFollowingUsers,
    TResult Function(String username)? followUser,
    TResult Function(String username)? unfollowUser,
    required TResult orElse(),
  }) {
    if (unfollowUser != null) {
      return unfollowUser(username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetFollowingUsersEvent value) getFollowingUsers,
    required TResult Function(FollowUserEvent value) followUser,
    required TResult Function(UnfollowUserEvent value) unfollowUser,
  }) {
    return unfollowUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetFollowingUsersEvent value)? getFollowingUsers,
    TResult? Function(FollowUserEvent value)? followUser,
    TResult? Function(UnfollowUserEvent value)? unfollowUser,
  }) {
    return unfollowUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetFollowingUsersEvent value)? getFollowingUsers,
    TResult Function(FollowUserEvent value)? followUser,
    TResult Function(UnfollowUserEvent value)? unfollowUser,
    required TResult orElse(),
  }) {
    if (unfollowUser != null) {
      return unfollowUser(this);
    }
    return orElse();
  }
}

abstract class UnfollowUserEvent implements SocialEvent {
  const factory UnfollowUserEvent({required final String username}) =
      _$UnfollowUserEvent;

  String get username;
  @JsonKey(ignore: true)
  _$$UnfollowUserEventCopyWith<_$UnfollowUserEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
