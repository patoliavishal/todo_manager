// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_task_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SharedTaskEventImpl _$$SharedTaskEventImplFromJson(
  Map<String, dynamic> json,
) => _$SharedTaskEventImpl(
  taskId: json['taskId'] as String,
  userId: json['userId'] as String,
  action: json['action'] as String,
  timestamp: dateTimeFromJson(json['timestamp']),
  changes: json['changes'] as Map<String, dynamic>,
);

Map<String, dynamic> _$$SharedTaskEventImplToJson(
  _$SharedTaskEventImpl instance,
) => <String, dynamic>{
  'taskId': instance.taskId,
  'userId': instance.userId,
  'action': instance.action,
  'timestamp': dateTimeToJson(instance.timestamp),
  'changes': instance.changes,
};
