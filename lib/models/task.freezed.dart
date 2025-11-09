// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  List<String> get sharedWith => throw _privateConstructorUsedError;
  Map<String, dynamic> get lastModifiedBy => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  List<String> get attachments => throw _privateConstructorUsedError;
  String get priority => throw _privateConstructorUsedError;

  /// Serializes this Task to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    bool isCompleted,
    String ownerId,
    List<String> sharedWith,
    Map<String, dynamic> lastModifiedBy,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    DateTime createdAt,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    DateTime updatedAt,
    List<String> attachments,
    String priority,
  });
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? isCompleted = null,
    Object? ownerId = null,
    Object? sharedWith = null,
    Object? lastModifiedBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? attachments = null,
    Object? priority = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            isCompleted: null == isCompleted
                ? _value.isCompleted
                : isCompleted // ignore: cast_nullable_to_non_nullable
                      as bool,
            ownerId: null == ownerId
                ? _value.ownerId
                : ownerId // ignore: cast_nullable_to_non_nullable
                      as String,
            sharedWith: null == sharedWith
                ? _value.sharedWith
                : sharedWith // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            lastModifiedBy: null == lastModifiedBy
                ? _value.lastModifiedBy
                : lastModifiedBy // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            attachments: null == attachments
                ? _value.attachments
                : attachments // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
    _$TaskImpl value,
    $Res Function(_$TaskImpl) then,
  ) = __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    bool isCompleted,
    String ownerId,
    List<String> sharedWith,
    Map<String, dynamic> lastModifiedBy,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    DateTime createdAt,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    DateTime updatedAt,
    List<String> attachments,
    String priority,
  });
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
    : super(_value, _then);

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? isCompleted = null,
    Object? ownerId = null,
    Object? sharedWith = null,
    Object? lastModifiedBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? attachments = null,
    Object? priority = null,
  }) {
    return _then(
      _$TaskImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        isCompleted: null == isCompleted
            ? _value.isCompleted
            : isCompleted // ignore: cast_nullable_to_non_nullable
                  as bool,
        ownerId: null == ownerId
            ? _value.ownerId
            : ownerId // ignore: cast_nullable_to_non_nullable
                  as String,
        sharedWith: null == sharedWith
            ? _value._sharedWith
            : sharedWith // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        lastModifiedBy: null == lastModifiedBy
            ? _value._lastModifiedBy
            : lastModifiedBy // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        attachments: null == attachments
            ? _value._attachments
            : attachments // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl implements _Task {
  const _$TaskImpl({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.ownerId,
    final List<String> sharedWith = const [],
    final Map<String, dynamic> lastModifiedBy = const {},
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    required this.createdAt,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    required this.updatedAt,
    final List<String> attachments = const [],
    this.priority = '',
  }) : _sharedWith = sharedWith,
       _lastModifiedBy = lastModifiedBy,
       _attachments = attachments;

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  @JsonKey()
  final bool isCompleted;
  @override
  final String ownerId;
  final List<String> _sharedWith;
  @override
  @JsonKey()
  List<String> get sharedWith {
    if (_sharedWith is EqualUnmodifiableListView) return _sharedWith;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sharedWith);
  }

  final Map<String, dynamic> _lastModifiedBy;
  @override
  @JsonKey()
  Map<String, dynamic> get lastModifiedBy {
    if (_lastModifiedBy is EqualUnmodifiableMapView) return _lastModifiedBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_lastModifiedBy);
  }

  @override
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime createdAt;
  @override
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime updatedAt;
  final List<String> _attachments;
  @override
  @JsonKey()
  List<String> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  @JsonKey()
  final String priority;

  @override
  String toString() {
    return 'Task(id: $id, title: $title, description: $description, isCompleted: $isCompleted, ownerId: $ownerId, sharedWith: $sharedWith, lastModifiedBy: $lastModifiedBy, createdAt: $createdAt, updatedAt: $updatedAt, attachments: $attachments, priority: $priority)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            const DeepCollectionEquality().equals(
              other._sharedWith,
              _sharedWith,
            ) &&
            const DeepCollectionEquality().equals(
              other._lastModifiedBy,
              _lastModifiedBy,
            ) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(
              other._attachments,
              _attachments,
            ) &&
            (identical(other.priority, priority) ||
                other.priority == priority));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    isCompleted,
    ownerId,
    const DeepCollectionEquality().hash(_sharedWith),
    const DeepCollectionEquality().hash(_lastModifiedBy),
    createdAt,
    updatedAt,
    const DeepCollectionEquality().hash(_attachments),
    priority,
  );

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(this);
  }
}

abstract class _Task implements Task {
  const factory _Task({
    required final String id,
    required final String title,
    required final String description,
    final bool isCompleted,
    required final String ownerId,
    final List<String> sharedWith,
    final Map<String, dynamic> lastModifiedBy,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    required final DateTime createdAt,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
    required final DateTime updatedAt,
    final List<String> attachments,
    final String priority,
  }) = _$TaskImpl;

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  bool get isCompleted;
  @override
  String get ownerId;
  @override
  List<String> get sharedWith;
  @override
  Map<String, dynamic> get lastModifiedBy;
  @override
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime get createdAt;
  @override
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime get updatedAt;
  @override
  List<String> get attachments;
  @override
  String get priority;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
