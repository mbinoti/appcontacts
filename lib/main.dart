import 'package:appcontacts/app.dart';
import 'package:appcontacts/messagelist.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EMailApp());
}

class EMailApp extends StatelessWidget {
  const EMailApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: App(),
      //MessageList(title: 'Flutter Demo Home Page'),
    );
  }
}

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: const Text('Contacts')),
        body: StreamBuilder<Object>(builder: (context, snapshot) {
          return const Center(
            child: Text('Contacts'),
          );
        }),
      ),
    );
  }
}
