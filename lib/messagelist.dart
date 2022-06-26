import 'dart:convert';

import 'package:appcontacts/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessageList extends StatefulWidget {
  final String title;

  MessageList({required this.title});

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  var messages = const [];
  Future loadMessageList() async {
    String content = await rootBundle.loadString('data/message.json');
    List collection = json.decode(content);
    List<Message> _messages =
        collection.map((e) => Message.fromJson(e)).toList();
    print(content);
    setState(() {
      messages = _messages;
    });
  }

  @override
  void initState() {
    loadMessageList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          Message message = messages[index];
          return ListTile(
            title: Text(message.subject!),
            leading: CircleAvatar(child: const Text('PZ')),
            //trailing: CircleAvatar(),
            isThreeLine: true,
            subtitle: Text(
              message.body!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Colors.red,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
