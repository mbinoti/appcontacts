import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MessageDetail extends StatelessWidget {
  final String subject;
  final String body;

  const MessageDetail({Key? key, required this.subject, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(subject)),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(body),
        ),
      ),
    );
  }
}
