import 'package:flutter/material.dart';
import 'package:twitter_but_threads/theme/pallete.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.validator,
      required this.hintText,
      required this.keyboardType,
      this.isPassword,
      this.icon});

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final IconData? icon;
  final bool? isPassword;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.90,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
            border: Border.all(color: Pallete.greyColor),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Positioned(
          top: 8,
          left: 10, //0 is starting at left, use it to give left-margin
          right: 10,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            style: const TextStyle(fontSize: 18),
            obscureText: isPassword ?? false,
            decoration: InputDecoration(
              // isDense: true,
              prefixIcon: icon != null
                  ? Icon(
                      icon,
                      color: Pallete.whiteColor.withOpacity(0.5),
                    )
                  : null,
              focusColor: Pallete.whiteColor,
              hintText: hintText,
              border: InputBorder.none,
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }
}
