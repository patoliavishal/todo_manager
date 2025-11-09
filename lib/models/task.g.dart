// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  isCompleted: json['isCompleted'] as bool? ?? false,
  ownerId: json['ownerId'] as String,
  sharedWith:
      (json['sharedWith'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  lastModifiedBy: json['lastModifiedBy'] as Map<String, dynamic>? ?? const {},
  createdAt: dateTimeFromJson(json['createdAt']),
  updatedAt: dateTimeFromJson(json['updatedAt']),
  attachments:
      (json['attachments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  priority: json['priority'] as String? ?? '',
);

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'isCompleted': instance.isCompleted,
      'ownerId': instance.ownerId,
      'sharedWith': instance.sharedWith,
      'lastModifiedBy': instance.lastModifiedBy,
      'createdAt': dateTimeToJson(instance.createdAt),
      'updatedAt': dateTimeToJson(instance.updatedAt),
      'attachments': instance.attachments,
      'priority': instance.priority,
    };
