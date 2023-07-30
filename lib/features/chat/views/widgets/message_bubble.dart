import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_but_threads/core/models/message.dart';
import 'package:twitter_but_threads/features/auth/controller/auth_controller.dart';
import 'package:twitter_but_threads/theme/pallete.dart';

class MessageBubble extends ConsumerWidget {
  const MessageBubble({super.key, required this.message});
  final Message message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(userProvider)!;
    return Align(
      alignment: message.senderId == currentUser.uid
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: UnconstrainedBox(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: message.senderId == currentUser.uid
                ? Pallete.primary
                : Pallete.greyColor,
          ),
          child: Text(message.message),
        ),
      ),
    );
  }
}
