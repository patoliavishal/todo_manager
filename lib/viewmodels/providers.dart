import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_manager/models/models.dart';
import 'package:todo_manager/repositories/repositories.dart';

// Repository Providers
final authRepositoryProvider = Provider((ref) => AuthRepository());
final userRepositoryProvider = Provider((ref) => UserRepository());
final taskRepositoryProvider = Provider((ref) => TaskRepository());

// Auth State Providers
final authStateProvider = StreamProvider<User?>((ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  return authRepo.authStateChanges;
});

final currentUserProvider = StreamProvider<AppUser?>((ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  final userRepo = ref.watch(userRepositoryProvider);

  return authRepo.authStateChanges.asyncExpand((user) {
    if (user == null) {
      return Stream<AppUser?>.value(null);
    }
    return userRepo.watchUser(user.uid);
  });
});

final userIdProvider = Provider<String?>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.value?.uid;
});

// Task Providers
final userTasksProvider = StreamProvider<List<Task>>((ref) {
  final userId = ref.watch(userIdProvider);
  if (userId == null) {
    return Stream.value([]);
  }
  final repository = ref.watch(taskRepositoryProvider);
  return repository.getUserTasks(userId);
});

final sharedTasksProvider = StreamProvider<List<Task>>((ref) {
  final userId = ref.watch(userIdProvider);
  if (userId == null) {
    return Stream.value([]);
  }
  final repository = ref.watch(taskRepositoryProvider);
  return repository.getSharedTasks(userId);
});

final watchTaskProvider = StreamProvider.family<Task?, String>((ref, taskId) {
  final repository = ref.watch(taskRepositoryProvider);
  return repository.watchTask(taskId);
});

final taskHistoryProvider = StreamProvider.family<List<SharedTaskEvent>, String>((ref, taskId) {
  final repository = ref.watch(taskRepositoryProvider);
  return repository.getTaskHistory(taskId);
});

final createTaskProvider = FutureProvider.family<void, Task>((ref, task) async {
  final repository = ref.watch(taskRepositoryProvider);
  await repository.createTask(task);
});

final updateTaskProvider = FutureProvider.family<void, Task>((ref, task) async {
  final repository = ref.watch(taskRepositoryProvider);
  await repository.updateTask(task);

  final userId = ref.watch(userIdProvider);
  if (userId != null) {
    final event = SharedTaskEvent(
      taskId: task.id,
      userId: userId,
      action: 'updated',
      timestamp: DateTime.now(),
      changes: {'title': task.title, 'description': task.description, 'isCompleted': task.isCompleted},
    );

    await repository.logTaskEvent(task.id, event);
  }
});

final deleteTaskProvider = FutureProvider.family<void, String>((ref, taskId) async {
  final repository = ref.watch(taskRepositoryProvider);
  await repository.deleteTask(taskId);
});

final shareTaskProvider = FutureProvider.family<void, (String, String)>((ref, params) async {
  final (taskId, email) = params;
  final repository = ref.watch(taskRepositoryProvider);
  final userRepo = ref.watch(userRepositoryProvider);
  await repository.shareTaskByEmail(taskId, email, userRepo);
});

final unshareTaskProvider = FutureProvider.family<void, (String, String)>((ref, params) async {
  final (taskId, userId) = params;
  final repository = ref.watch(taskRepositoryProvider);
  await repository.unshareTask(taskId, userId);
});
