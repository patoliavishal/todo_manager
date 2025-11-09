import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_manager/models/utils.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required String title,
    required String description,
    @Default(false) bool isCompleted,
    required String ownerId,
    @Default([]) List<String> sharedWith,
    @Default({}) Map<String, dynamic> lastModifiedBy,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) required DateTime createdAt,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) required DateTime updatedAt,
    @Default([]) List<String> attachments,
    @Default('') String priority,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}

