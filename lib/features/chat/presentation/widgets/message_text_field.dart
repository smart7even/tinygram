import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinygram/features/chat/bloc/chat_bloc.dart';

class MessageTextField extends StatefulWidget {
  const MessageTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<MessageTextField> createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  final textFieldController = TextEditingController();

  void sendMessage() {
    if (textFieldController.text.isEmpty) {
      return;
    }

    context
        .read<ChatBloc>()
        .add(ChatEvent.messageSent(text: textFieldController.text));

    textFieldController.clear();
  }

  @override
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: TextField(
            controller: textFieldController,
            decoration: const InputDecoration.collapsed(
              hintText: 'Message',
            ),
            maxLines: 5,
            minLines: 1,
          ),
        ),
        IconButton(
          onPressed: sendMessage,
          constraints: const BoxConstraints(
            maxHeight: 82,
          ),
          splashRadius: 20,
          color: Theme.of(context).primaryColorDark,
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 15,
          ),
          icon: const Icon(Icons.send),
        )
      ],
    );
  }
}
