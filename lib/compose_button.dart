import 'package:appcontacts/message.dart';
import 'package:appcontacts/message_compose.dart';
import 'package:flutter/material.dart';

class ComposeButton extends StatelessWidget {
  final List<Message>? messages;
  ComposeButton(this.messages);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () async {
        Message? message = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => MessageCompose(),
          ),
        );

        if (message != null) {
          messages!.add(message);
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(message.subject!), backgroundColor: Colors.red),
          );
        }
      },
    );
  }
}
