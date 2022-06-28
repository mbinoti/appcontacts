import 'dart:convert';

import 'package:appcontacts/compose_button.dart';
import 'package:appcontacts/message.dart';
import 'package:appcontacts/message_compose.dart';
import 'package:appcontacts/message_detail.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class MessageList extends StatefulWidget {
  final String title;

  MessageList({required this.title});

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  Future<List<Message>>? messages;
  // bool isLoading = true;

  @override
  void initState() {
    messages = Message.browse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              var _messages = Message.browse();
              setState(() {
                messages = _messages;
              });
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: messages,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text('There was an error: ${snapshot.error}');
              }
              var messages = snapshot.data;
              return ListView.separated(
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  Message message = messages[index];
                  return ListTile(
                    title: Text(message.subject!),
                    leading: const CircleAvatar(child: Text('PZ')),
                    //trailing: CircleAvatar(),
                    isThreeLine: true,
                    subtitle: Text(
                      message.body!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return MessageDetail(
                            subject: message.subject!, body: message.body!);
                      }));
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(color: Colors.red),
              ); // This trailing comma makes auto-formatting nicer for build methods.
          }
        },
      ),
      floatingActionButton: ComposeButton(context),
    );
  }
}
