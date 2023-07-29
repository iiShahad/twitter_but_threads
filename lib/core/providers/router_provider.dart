import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter_but_threads/features/activity/views/activity_screen.dart';
import 'package:twitter_but_threads/features/auth/controller/auth_controller.dart';
import 'package:twitter_but_threads/features/auth/view/show_login_or_signup.dart';
import 'package:twitter_but_threads/features/chat/views/chat.dart';
import 'package:twitter_but_threads/features/home/views/home_screen.dart';
import 'package:twitter_but_threads/features/Profile/views/search_screen.dart';
import 'package:twitter_but_threads/features/controller/views/controller_screen.dart';

import '../../features/Profile/widgets/screens/profile_screen.dart';

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
      if (!userLoggedIn) {
        return "/auth";
      } else {
        return null;
      }
    },
    routes: [
      GoRoute(
        path: "/auth",
        builder: (context, state) => const ShowLoginOrSignup(),
      ),
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ControllerScreen(
              shell: navigationShell,
            );
          },
          branches: [
            StatefulShellBranch(routes: [
              GoRoute(
                path: "/home",
                builder: (context, state) => const HomeScreen(),
              )
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: "/search",
                builder: (context, state) => const SearchScreen(),
              )
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: "/Profile",
                builder: (context, state) => const ProfileScreen(),
              )
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: "/activity",
                builder: (context, state) => const ActivityScreen(),
              )
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: "/chat",
                builder: (context, state) => const ChatScreen(),
              )
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: "/profile",
                builder: (context, state) => const ProfileScreen(),
              )
            ]),
          ])
    ],
  );
});
