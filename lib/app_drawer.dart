import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Drawer AppDrawer(BuildContext context) {
  return Drawer(
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
  );
}
