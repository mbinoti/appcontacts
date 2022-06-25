import 'package:flutter/material.dart';

void main() {
  runApp(const EMailApp());
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

class EMailApp extends StatelessWidget {
  const EMailApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  var messages = const [
    'my first message',
    'my second message',
    'you won lottery',
    'you should read this message',
    'you won lottery again',
  ];

  MyHomePage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: ListView.separated(
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          var title = messages[index];
          return ListTile(
            title: Text(title),
            leading: CircleAvatar(child: const Text('PZ')),
            //trailing: CircleAvatar(),
            isThreeLine: true,
            subtitle: const Text(
                'Another text ... traduzindo esta esta é uma linha muito longa'
                'e nao deve caber em uma unica linha.'),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Colors.red,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
