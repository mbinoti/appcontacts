import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MessageCompose extends StatelessWidget {
  const MessageCompose({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Compose new message')),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Compose New Message'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'Love');
                  },
                  child: Text('Love'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'Hate');
                  },
                  child: Text('Hate'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
