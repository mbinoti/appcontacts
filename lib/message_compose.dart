import 'package:appcontacts/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MessageCompose extends StatefulWidget {
  const MessageCompose({Key? key}) : super(key: key);

  @override
  State<MessageCompose> createState() => _MessageComposeState();
}

class _MessageComposeState extends State<MessageCompose> {
  TextEditingController toController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  final key = GlobalKey<FormState>();
  String to = '';
  String subject = '';
  String body = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Compose new message')),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                validator: (value) =>
                    !value!.contains('@') ? "'TO' field must be" : null,
                onSaved: (value) => to = value!,
                decoration: decorationLabel('TO'),
              ),
              TextFormField(
                validator: (value) =>
                    (value!.isEmpty) ? "'SUBJECT' cannot be empty" : null,
                onSaved: (value) => subject = value!,
                decoration: decorationLabel('SUBJECT'),
              ),
              TextFormField(
                onSaved: (value) => body = value!,
                decoration: decorationLabel('BODY'),
                maxLines: 5,
              ),
              ElevatedButton(
                child: const Text('SEND'),
                onPressed: () {
                  if (key.currentState!.validate()) {
                    Message message = Message(subject, body);
                    key.currentState?.save();
                    Navigator.pop(context, message);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration decorationLabel(String label) => InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(fontWeight: FontWeight.bold));
}
