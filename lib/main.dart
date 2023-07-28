import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_but_threads/core/models/user.dart';
import 'package:twitter_but_threads/features/auth/controller/auth_controller.dart';
import 'package:twitter_but_threads/features/auth/view/show_login_or_signup.dart';
import 'package:twitter_but_threads/theme/pallete.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  void getData(WidgetRef ref, User data) async {
    final UserModel user = await ref
        .read(authControllerProvider.notifier)
        .getUserData(data.uid)
        .first;
    ref.read(userProvider.notifier).state = user;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authStateChangeProvider).whenData((value) {
      if (value != null) {
        getData(ref, value);
      }
    });

    return MaterialApp(
      title: 'Twitter but threads',
      theme: Pallete.theme,
      home: const ShowLoginOrSignup(),
    );
  }
}
