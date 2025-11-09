import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:todo_manager/models/models.dart';
import 'package:todo_manager/repositories/repositories.dart';
import 'package:todo_manager/viewmodels/providers.dart';
import 'package:uuid/uuid.dart';

class TaskViewModel extends StateNotifier<AsyncValue<void>> {
  final TaskRepository _repository;
  final UserRepository _userRepository;
  final String? _userId;

  TaskViewModel(this._repository, this._userRepository, this._userId) : super(const AsyncValue.data(null));

  Future<Task> createTask({required String title, required String description, required String ownerId, String priority = 'medium'}) async {
    state = const AsyncValue.loading();
    try {
      final task = Task(id: const Uuid().v4(), title: title, description: description, ownerId: ownerId, createdAt: DateTime.now(), updatedAt: DateTime.now(), priority: priority);

      await _repository.createTask(task);

      if (_userId != null) {
        final event = SharedTaskEvent(taskId: task.id, userId: _userId, action: 'created', timestamp: DateTime.now(), changes: {'title': task.title});
        await _repository.logTaskEvent(task.id, event);
      }

      state = const AsyncValue.data(null);
      return task;
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      rethrow;
    }
  }

  Future<void> updateTask(Task task) async {
    state = const AsyncValue.loading();
    try {
      final updatedTask = task.copyWith(updatedAt: DateTime.now());
      await _repository.updateTask(updatedTask);

      if (_userId != null) {
        final event = SharedTaskEvent(
          taskId: task.id,
          userId: _userId,
          action: 'updated',
          timestamp: DateTime.now(),
          changes: {'title': task.title, 'description': task.description, 'isCompleted': task.isCompleted},
        );
        await _repository.logTaskEvent(task.id, event);
      }

      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      rethrow;
    }
  }

  Future<void> toggleTaskCompletion(Task task) async {
    await updateTask(task.copyWith(isCompleted: !task.isCompleted));
  }

  Future<void> deleteTask(String taskId) async {
    state = const AsyncValue.loading();
    try {
      await _repository.deleteTask(taskId);
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      rethrow;
    }
  }

  Future<void> shareTask(String taskId, String email) async {
    state = const AsyncValue.loading();
    try {
      await _repository.shareTaskByEmail(taskId, email, _userRepository);
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      rethrow;
    }
  }
}

final taskViewModelProvider = StateNotifierProvider<TaskViewModel, AsyncValue<void>>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  final userRepo = ref.watch(userRepositoryProvider);
  final userId = ref.watch(userIdProvider);
  return TaskViewModel(repository, userRepo, userId);
});
