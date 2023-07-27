import 'package:flutter/material.dart';
import 'package:twitter_but_threads/core/common/custom_test_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                child: Image.asset("assets/app-logo.png"),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextField(
                controller: _email,
                validator: (p0) {},
                icon: Icons.email,
                hintText: "E-mail",
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                controller: _password,
                validator: (p0) {},
                icon: Icons.password,
                hintText: "Password",
                keyboardType: TextInputType.visiblePassword,
              ),
            ]),
      )),
    );
  }
}
