import 'package:flutter/material.dart';

import '../../../../theme/pallete.dart';

class MessageInput extends StatelessWidget {
  const MessageInput(
      {super.key, required this.onTap, required this.controller});
  final void Function() onTap;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 50,
          child: TextField(
            cursorColor: Pallete.greyColor,
            controller: controller,
            decoration: InputDecoration(
              fillColor: Pallete.surface,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
        Positioned(
          right: 5,
          top: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Pallete.primary),
              child: const Icon(Icons.send_rounded),
            ),
          ),
        )
      ],
    );
  }
}
