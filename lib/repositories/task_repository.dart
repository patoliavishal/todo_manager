import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_manager/models/models.dart';
import 'package:todo_manager/repositories/user_repository.dart';

class TaskRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createTask(Task task) async {
    await _firestore.collection('tasks').doc(task.id).set(task.toJson());
  }

  Future<void> updateTask(Task task) async {
    await _firestore.collection('tasks').doc(task.id).update(task.toJson());
  }

  Future<void> deleteTask(String taskId) async {
    await _firestore.collection('tasks').doc(taskId).delete();
  }

  Stream<List<Task>> getUserTasks(String userId) {
    return _firestore
        .collection('tasks')
        .where('ownerId', isEqualTo: userId)
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              final data = doc.data();
              data['id'] = doc.id;
              return Task.fromJson(data);
            }).toList());
  }

  Stream<List<Task>> getSharedTasks(String userId) {
    return _firestore
        .collection('tasks')
        .where('sharedWith', arrayContains: userId)
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              final data = doc.data();
              data['id'] = doc.id;
              return Task.fromJson(data);
            }).toList());
  }

  Stream<Task?> watchTask(String taskId) {
    return _firestore.collection('tasks').doc(taskId).snapshots().map((snapshot) {
      if (snapshot.exists) {
        final data = snapshot.data()!;
        data['id'] = snapshot.id;
        return Task.fromJson(data);
      }
      return null;
    });
  }

  Future<void> shareTask(String taskId, String userId) async {
    await _firestore.collection('tasks').doc(taskId).update({
      'sharedWith': FieldValue.arrayUnion([userId]),
    });
  }

  Future<void> shareTaskByEmail(String taskId, String email, UserRepository userRepository) async {
    final userId = await userRepository.getUserIdByEmail(email);
    if (userId != null) {
      await shareTask(taskId, userId);
    } else {
      throw Exception('User with email $email not found');
    }
  }

  Future<void> unshareTask(String taskId, String userId) async {
    await _firestore.collection('tasks').doc(taskId).update({
      'sharedWith': FieldValue.arrayRemove([userId]),
    });
  }

  Stream<List<SharedTaskEvent>> getTaskHistory(String taskId) {
    return _firestore
        .collection('tasks')
        .doc(taskId)
        .collection('history')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              final data = doc.data();
              return SharedTaskEvent.fromJson(data);
            }).toList());
  }

  Future<void> logTaskEvent(String taskId, SharedTaskEvent event) async {
    await _firestore.collection('tasks').doc(taskId).collection('history').add(event.toJson());
  }
}

