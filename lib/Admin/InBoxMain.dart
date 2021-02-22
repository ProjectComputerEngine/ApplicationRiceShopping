import 'dart:async';

import 'package:flutter/material.dart';

class MainInbox extends StatefulWidget {
  @override
  _MainInboxState createState() => _MainInboxState();
}

class _MainInboxState extends State<MainInbox> {
  StreamController inbox;
  Stream stream ;

  @override
  void initState() {
    inbox = StreamController();
    stream =inbox.stream;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
      ),
      body: Container(
        child: StreamBuilder(
          stream: stream,
        ),
      ),
    );
  }
}
