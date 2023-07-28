import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_but_threads/core/common/custom_submit_button.dart';
import 'package:twitter_but_threads/core/common/custom_test_field.dart';
import 'package:twitter_but_threads/core/utils.dart';
import 'package:twitter_but_threads/features/auth/controller/auth_controller.dart';
import 'package:twitter_but_threads/features/auth/view/widgets/screen_toggle_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key, required this.toggleScreen});
  final void Function() toggleScreen;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _username = TextEditingController();

  void _submit(WidgetRef ref) {
    if (_formKey.currentState!.validate()) {
      ref.read(authControllerProvider.notifier).signUp(
            context,
            _username.text.trim(),
            _email.text.trim(),
            _password.text.trim(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100,
        scrolledUnderElevation: 0.0,
        title: SizedBox(
          height: 55,
          child: Image.asset("assets/app-logo.png"),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Create New Account",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  CustomTextField(
                    controller: _username,
                    validator: (p0) => emailValidator(p0),
                    icon: Icons.person,
                    hintText: "Username",
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    controller: _email,
                    validator: (p0) => emailValidator(p0),
                    icon: Icons.email,
                    hintText: "E-mail",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    controller: _password,
                    validator: (p0) => passValidator(p0),
                    icon: Icons.password,
                    isPassword: true,
                    hintText: "Password",
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      return CustomSubmitButton(
                        label: const Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => _submit(ref),
                      );
                    },
                  ),
                  ScreenToggleButton(
                      onPressed: widget.toggleScreen,
                      buttonLabel: "Log In",
                      message: "Already have an account?")
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
