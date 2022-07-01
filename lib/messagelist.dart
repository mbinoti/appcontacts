import 'dart:convert';

import 'package:appcontacts/compose_button.dart';
import 'package:appcontacts/message.dart';
import 'package:appcontacts/message_compose.dart';
import 'package:appcontacts/message_detail.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_slidable/flutter_slidable.dart';

class MessageList extends StatefulWidget {
  final String title;

  MessageList({required this.title});

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  Future<List<Message>>? future;
  List<Message>? messages;
  // bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
    future = Message.browse();
    messages = await future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () async {
              // var _messages = await Message.browse();
              setState(() {
                // messages = _messages;
                future = Message.browse();
              });
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Marcos'),
              accountEmail: const Text('mbinoti@gmail.com'),
              currentAccountPicture: (const CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://picsum.photos/250?image=9'))),
              otherAccountsPictures: <Widget>[
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                              title: Text('Adding new account...'));
                        });
                  },
                  child: const CircleAvatar(child: Icon(Icons.add)),
                ),
              ],
            ),
            // const DrawerHeader(
            //   decoration: BoxDecoration(color: Colors.red),
            //   child: Text('Drawer Header'),
            //),
            ListTile(
              leading: const Icon(FontAwesomeIcons.inbox),
              title: const Text('Inbox'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.penToSquare),
              title: const Text('Draft'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.boxArchive),
              title: const Text('Archive'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.paperPlane),
              title: const Text('Sent'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.trash),
              title: const Text('Trash'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(FontAwesomeIcons.trash),
              title: const Text('Trash'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text('There was an error: ${snapshot.error}');
              }
              var messages = snapshot.data;
              return ListView.separated(
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  Message message = messages[index];
                  return Dismissible(
                    key: ObjectKey(message),
                    onDismissed: (direction) {
                      setState(() {
                        messages.removeAt(index);
                      });
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(FontAwesomeIcons.trash, color: Colors.white),
                          Padding(padding: EdgeInsets.all(4)),
                          Text('Delete', style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                    child: ListTile(
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
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(color: Colors.blue),
              ); // This trailing comma makes auto-formatting nicer for build methods.
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
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
          setState(() {
            messages = messages;
          });
        },
      ),
    );
  }
}
