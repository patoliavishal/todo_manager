import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/legacy.dart';
import 'package:todo_manager/models/models.dart';
import 'package:todo_manager/repositories/repositories.dart';
import 'package:todo_manager/viewmodels/providers.dart';

class AuthViewModel extends StateNotifier<AsyncValue<void>> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  AuthViewModel(this._authRepository, this._userRepository) : super(const AsyncValue.data(null));

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      await _authRepository.signInWithEmailAndPassword(email, password);
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      rethrow;
    }
  }

  Future<void> signUp(String email, String password, String displayName) async {
    state = const AsyncValue.loading();
    try {
      final userCredential = await _authRepository.createUserWithEmailAndPassword(email, password, displayName);
      if (userCredential.user != null) {
        final appUser = AppUser(id: userCredential.user!.uid, email: email.toLowerCase(), displayName: displayName, createdAt: DateTime.now());
        await _userRepository.createUser(appUser);
      }
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      rethrow;
    }
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    try {
      await _authRepository.signOut();
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      rethrow;
    }
  }

  Future<void> resetPassword(String email) async {
    state = const AsyncValue.loading();
    try {
      await _authRepository.sendPasswordResetEmail(email);
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      rethrow;
    }
  }
}

final authViewModelProvider = StateNotifierProvider<AuthViewModel, AsyncValue<void>>((ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  final userRepo = ref.watch(userRepositoryProvider);
  return AuthViewModel(authRepo, userRepo);
});
