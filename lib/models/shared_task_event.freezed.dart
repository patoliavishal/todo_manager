// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shared_task_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SharedTaskEvent _$SharedTaskEventFromJson(Map<String, dynamic> json) {
  return _SharedTaskEvent.fromJson(json);
}

/// @nodoc
mixin _$SharedTaskEvent {
  String get taskId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get action => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime get timestamp => throw _privateConstructorUsedError;
  Map<String, dynamic> get changes => throw _privateConstructorUsedError;

  /// Serializes this SharedTaskEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SharedTaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SharedTaskEventCopyWith<SharedTaskEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SharedTaskEventCopyWith<$Res> {
  factory $SharedTaskEventCopyWith(
    SharedTaskEvent value,
    $Res Function(SharedTaskEvent) then,
  ) = _$SharedTaskEventCopyWithImpl<$Res, SharedTaskEvent>;
  @useResult
  $Res call({
    String taskId,
    String userId,
    String action,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    DateTime timestamp,
    Map<String, dynamic> changes,
  });
}

/// @nodoc
class _$SharedTaskEventCopyWithImpl<$Res, $Val extends SharedTaskEvent>
    implements $SharedTaskEventCopyWith<$Res> {
  _$SharedTaskEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SharedTaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? userId = null,
    Object? action = null,
    Object? timestamp = null,
    Object? changes = null,
  }) {
    return _then(
      _value.copyWith(
            taskId: null == taskId
                ? _value.taskId
                : taskId // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            action: null == action
                ? _value.action
                : action // ignore: cast_nullable_to_non_nullable
                      as String,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            changes: null == changes
                ? _value.changes
                : changes // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SharedTaskEventImplCopyWith<$Res>
    implements $SharedTaskEventCopyWith<$Res> {
  factory _$$SharedTaskEventImplCopyWith(
    _$SharedTaskEventImpl value,
    $Res Function(_$SharedTaskEventImpl) then,
  ) = __$$SharedTaskEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String taskId,
    String userId,
    String action,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    DateTime timestamp,
    Map<String, dynamic> changes,
  });
}

/// @nodoc
class __$$SharedTaskEventImplCopyWithImpl<$Res>
    extends _$SharedTaskEventCopyWithImpl<$Res, _$SharedTaskEventImpl>
    implements _$$SharedTaskEventImplCopyWith<$Res> {
  __$$SharedTaskEventImplCopyWithImpl(
    _$SharedTaskEventImpl _value,
    $Res Function(_$SharedTaskEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SharedTaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? userId = null,
    Object? action = null,
    Object? timestamp = null,
    Object? changes = null,
  }) {
    return _then(
      _$SharedTaskEventImpl(
        taskId: null == taskId
            ? _value.taskId
            : taskId // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        action: null == action
            ? _value.action
            : action // ignore: cast_nullable_to_non_nullable
                  as String,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        changes: null == changes
            ? _value._changes
            : changes // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SharedTaskEventImpl implements _SharedTaskEvent {
  const _$SharedTaskEventImpl({
    required this.taskId,
    required this.userId,
    required this.action,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    required this.timestamp,
    required final Map<String, dynamic> changes,
  }) : _changes = changes;

  factory _$SharedTaskEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$SharedTaskEventImplFromJson(json);

  @override
  final String taskId;
  @override
  final String userId;
  @override
  final String action;
  @override
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime timestamp;
  final Map<String, dynamic> _changes;
  @override
  Map<String, dynamic> get changes {
    if (_changes is EqualUnmodifiableMapView) return _changes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_changes);
  }

  @override
  String toString() {
    return 'SharedTaskEvent(taskId: $taskId, userId: $userId, action: $action, timestamp: $timestamp, changes: $changes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SharedTaskEventImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other._changes, _changes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    taskId,
    userId,
    action,
    timestamp,
    const DeepCollectionEquality().hash(_changes),
  );

  /// Create a copy of SharedTaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SharedTaskEventImplCopyWith<_$SharedTaskEventImpl> get copyWith =>
      __$$SharedTaskEventImplCopyWithImpl<_$SharedTaskEventImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SharedTaskEventImplToJson(this);
  }
}

abstract class _SharedTaskEvent implements SharedTaskEvent {
  const factory _SharedTaskEvent({
    required final String taskId,
    required final String userId,
    required final String action,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    required final DateTime timestamp,
    required final Map<String, dynamic> changes,
  }) = _$SharedTaskEventImpl;

  factory _SharedTaskEvent.fromJson(Map<String, dynamic> json) =
      _$SharedTaskEventImpl.fromJson;

  @override
  String get taskId;
  @override
  String get userId;
  @override
  String get action;
  @override
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime get timestamp;
  @override
  Map<String, dynamic> get changes;

  /// Create a copy of SharedTaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SharedTaskEventImplCopyWith<_$SharedTaskEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
