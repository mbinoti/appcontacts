import 'package:appcontacts/message_compose.dart';
import 'package:flutter/material.dart';

class ComposeButton extends StatelessWidget {
  const ComposeButton(BuildContext context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        String intention = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => MessageCompose(),
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(intention), backgroundColor: Colors.red),
        );
      },
    );
  }
}
