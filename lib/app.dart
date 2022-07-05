import 'package:appcontacts/app_drawer.dart';
import 'package:appcontacts/calendar_screen.dart';
import 'package:appcontacts/contacts_screen.dart';
import 'package:appcontacts/inbox_screen.dart';
import 'package:appcontacts/messagelist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        InboxScreen(),
        ContactsScreen(),
        CalendarScreen(),
      ].elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(label: 'Inbox', icon: Icon(Icons.mail)),
          BottomNavigationBarItem(label: 'Contacts', icon: Icon(Icons.people)),
          BottomNavigationBarItem(
              label: 'Calendars', icon: Icon(Icons.calendar_today)),
        ],
        onTap: _onBarItemTap,
        currentIndex: _selectedIndex,
      ),
    );
  }

  void _onBarItemTap(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
