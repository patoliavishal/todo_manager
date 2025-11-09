import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_manager/models/utils.dart';

part 'shared_task_event.freezed.dart';
part 'shared_task_event.g.dart';

@freezed
class SharedTaskEvent with _$SharedTaskEvent {
  const factory SharedTaskEvent({
    required String taskId,
    required String userId,
    required String action,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) required DateTime timestamp,
    required Map<String, dynamic> changes,
  }) = _SharedTaskEvent;

  factory SharedTaskEvent.fromJson(Map<String, dynamic> json) => _$SharedTaskEventFromJson(json);
}

