import 'package:appcontacts/app_drawer.dart';
import 'package:appcontacts/messagelist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Inbox'),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
          ],
          bottom: TabBar(tabs: <Widget>[
            Tab(text: 'Important'),
            Tab(text: 'Other'),
          ]),
        ),
        drawer: AppDrawer(context),
        bottomNavigationBar: TabBar(
          tabs: <Widget>[
            Tab(text: 'Important'),
            Tab(text: 'Other'),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            MessageList(status: 'Important'),
            MessageList(status: 'Other'),
          ],
        ),
      ),
    );
  }
}
