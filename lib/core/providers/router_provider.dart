import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter_but_threads/features/auth/controller/auth_controller.dart';
import 'package:twitter_but_threads/features/auth/view/show_login_or_signup.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: "/home",
    redirect: (context, state) {
      bool userLoggedIn = false;
      ref.watch(authStateChangeProvider).whenData((value) {
        if (value != null) {
          userLoggedIn = true;
        }
      });

      return userLoggedIn ? "/home" : "/auth";
    },
    routes: [
      GoRoute(
        path: "/auth",
        builder: (context, state) => const ShowLoginOrSignup(),
      ),
      StatefulShellRoute.indexedStack(branches: [
        StatefulShellBranch(routes: [GoRoute(path: "/home")]),
        StatefulShellBranch(routes: [GoRoute(path: "/search")]),
        StatefulShellBranch(routes: [GoRoute(path: "/new-post")]),
        StatefulShellBranch(routes: [GoRoute(path: "/activity")]),
        StatefulShellBranch(routes: [GoRoute(path: "/profile")]),
      ])
    ],
  );
});
