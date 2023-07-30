import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_but_threads/core/models/message.dart';
import 'package:twitter_but_threads/features/auth/controller/auth_controller.dart';
import 'package:twitter_but_threads/features/chat/controller/chat_controller.dart';
import 'package:twitter_but_threads/features/chat/repository/chat_repository.dart';
import 'package:twitter_but_threads/features/chat/views/widgets/message_bubble.dart';
import 'package:twitter_but_threads/features/chat/views/widgets/message_input.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key, required this.reciverId});
  final String reciverId;

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final _inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // ref.watch(chatRpositoryProvider).getChatRecivers();
    final chatController = ref.watch(chatControllerProvider);
    final currentUser = ref.watch(userProvider)!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: Column(
            children: [
              StreamBuilder(
                stream: chatController.getMessages(
                    currentUser.uid, widget.reciverId),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("error");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("waiting");
                  }
                  return Expanded(
                    child: ListView(
                        children: snapshot.data!.docs.map((e) {
                      final data =
                          Message.fromMap(e.data() as Map<String, dynamic>);
                      return MessageBubble(message: data);
                    }).toList()),
                  );
                },
              ),
              MessageInput(
                onTap: () {
                  chatController.sendMessage(
                      widget.reciverId, _inputController.text.trim());
                  _inputController.text = "";
                },
                controller: _inputController,
              )
            ],
          ),
        ),
      ),
    );
  }
}
