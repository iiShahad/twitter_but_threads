import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_but_threads/core/models/user.dart';
import 'package:twitter_but_threads/core/providers/router_provider.dart';
import 'package:twitter_but_threads/features/auth/controller/auth_controller.dart';
import 'package:twitter_but_threads/theme/pallete.dart';
import 'firebase_options.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //for stack error:
  runApp(const ProviderScope(child: MyApp()));
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  void getData(WidgetRef ref, User data) async {
    final UserModel user = await ref
        .watch(authControllerProvider.notifier)
        .getUserData(data.uid)
        .first;
    ref.read(userProvider.notifier).update((state) => user);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.read(authControllerProvider.notifier).logout();
    final routerProv = ref.read(routerProvider);
    ref.watch(authStateChangeProvider).whenData((value) {
      if (value != null) {
        getData(ref, value);
      }
    });

    return MaterialApp.router(
      title: 'Twitter but threads',
      theme: Pallete.theme,
      routerConfig: routerProv,
    );
    // return MaterialApp(
    //   title: 'Twitter but threads',
    //   theme: Pallete.theme,
    //   home: ProfileScreen(),
    // );
  }
}
