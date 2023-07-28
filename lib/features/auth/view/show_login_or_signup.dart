import 'package:flutter/material.dart';
import 'package:twitter_but_threads/features/auth/view/sign-in_screen.dart';
import 'package:twitter_but_threads/features/auth/view/sign-up_screen.dart';

class ShowLoginOrSignup extends StatefulWidget {
  const ShowLoginOrSignup({super.key});

  @override
  State<ShowLoginOrSignup> createState() => _ShowLoginOrSignupState();
}

class _ShowLoginOrSignupState extends State<ShowLoginOrSignup> {
  bool showLogin = true;

  void toggleScreen() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return SignInScreen(toggleScreen: toggleScreen);
    } else {
      return SignUpScreen(toggleScreen: toggleScreen);
    }
  }
}
