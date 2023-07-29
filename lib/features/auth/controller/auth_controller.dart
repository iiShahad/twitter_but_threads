import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/error_snackbar.dart';
import '../../../core/models/user.dart';
import '../repository/auth_repository.dart';

final userProvider = StateProvider<UserModel?>((ref) => null);

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
    (ref) => AuthController(
        authRepository: ref.read(authRepositoryProvider), ref: ref));

final getUserDataProvider = StreamProvider.family((ref, String uid) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.getUserData(uid);
});

final authStateChangeProvider = StreamProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.authStateChange;
});

class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository;
  final Ref _ref;

  AuthController({required AuthRepository authRepository, required Ref ref})
      : _authRepository = authRepository,
        _ref = ref,
        super(false);

  Stream<User?> get authStateChange => _authRepository.authStateChange;

  Stream<UserModel> getUserData(String uid) {
    return _authRepository.getUserData(uid);
  }

  void signIn(BuildContext context, String email, String password) async {
    state = true;
    final data = await _authRepository.signIn(email, password);
    data.fold((l) => showSnackBar(context, l.message),
        (r) => _ref.read(userProvider.notifier).state = r);
    state = false;
  }

  void updateUserData(String uid) {
    _authRepository.updateUserData(uid);
  }

  void signUp(
    BuildContext context,
    String name,
    String email,
    String password,
  ) async {
    state = true;
    final data = await _authRepository.signUp(name, email, password);

    data.fold((l) => showSnackBar(context, l.message),
        (r) => _ref.read(userProvider.notifier).state = r);
    state = false;
  }

  void logout() {
    _authRepository.logout();
    _ref.read(userProvider.notifier).update((state) => null);
  }
}
