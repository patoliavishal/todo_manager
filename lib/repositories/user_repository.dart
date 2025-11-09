import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_manager/models/models.dart';

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(AppUser user) async {
    await _firestore.collection('users').doc(user.id).set(user.toJson());
  }

  Future<AppUser?> getUserById(String userId) async {
    final doc = await _firestore.collection('users').doc(userId).get();
    if (doc.exists) {
      return AppUser.fromJson(doc.data()!);
    }
    return null;
  }

  Future<AppUser?> getUserByEmail(String email) async {
    final query = await _firestore.collection('users').where('email', isEqualTo: email.toLowerCase()).limit(1).get();
    if (query.docs.isNotEmpty) {
      return AppUser.fromJson(query.docs.first.data());
    }
    return null;
  }

  Future<String?> getUserIdByEmail(String email) async {
    final user = await getUserByEmail(email);
    return user?.id;
  }

  Future<void> updateUser(AppUser user) async {
    await _firestore.collection('users').doc(user.id).update(user.toJson());
  }

  Stream<AppUser?> watchUser(String userId) {
    return _firestore.collection('users').doc(userId).snapshots().map((snapshot) {
      if (snapshot.exists) {
        return AppUser.fromJson(snapshot.data()!);
      }
      return null;
    });
  }
}

