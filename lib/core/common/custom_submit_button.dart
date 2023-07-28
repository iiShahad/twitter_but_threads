import 'package:flutter/material.dart';
import 'package:twitter_but_threads/theme/pallete.dart';

class CustomSubmitButton extends StatelessWidget {
  const CustomSubmitButton(
      {super.key, required this.label, required this.onPressed});
  final Widget label;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Pallete.primary,
          minimumSize: Size(MediaQuery.of(context).size.width * 0.90, 50)),
      onPressed: onPressed,
      child: label,
    );
  }
}
