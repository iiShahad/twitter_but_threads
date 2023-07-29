import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import '../../../core/constants/firebase.dart';
import '../../../core/models/user.dart';
import '../../../core/providers/firebase_provider.dart';
import '../../../core/types/failure.dart';
import '../../../core/types/type_defs.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(
    ref: ref,
    firebaseAuth: ref.read(authProvider),
    firebaseFirestore: ref.read(firestoreProvider)));

class AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  AuthRepository({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firebaseFirestore,
    required Ref ref,
  })  : _firebaseAuth = firebaseAuth,
        _firebaseFirestore = firebaseFirestore;

  CollectionReference get _users =>
      _firebaseFirestore.collection(FirebaseConstants.usersCollection);

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  //sign in
  FutureEither<UserModel> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      UserModel user = await getUserData(userCredential.user!.uid).first;
      return right(user);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //sign up
  FutureEither<UserModel> signUp(
    String username,
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      UserModel user = UserModel(
        username: username,
        email: email,
        profilePic: "",
        bio: "",
        uid: userCredential.user!.uid,
        followers: [],
        following: [],
      );
      await _users.doc(userCredential.user!.uid).set(user.toMap());
      return Right(user);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<UserModel> getUserData(String uid) {
    return _users.doc(uid).snapshots().map((event) {
      return UserModel.fromMap(event.data() as Map<String, dynamic>);
    });
  }

  void updateUserData(String uid) async {
    await _users.doc(uid).update({"bio": "meowwwwwwwwwwwwwwwwwwwwwwwww"});
  }

  void logout() async {
    await _firebaseAuth.signOut();
  }
}
