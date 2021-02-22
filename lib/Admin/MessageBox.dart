import 'package:flutter/material.dart';

class MainMessage extends StatefulWidget {
  final String inbox;

  MainMessage({this.inbox});

  @override
  _MainMessageState createState() => _MainMessageState();
}

class _MainMessageState extends State<MainMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.inbox}'),
      ),
      body: Container(
        child: Column(children: [
          Container(child: Flexible(child: ListView()),),
          Container(child: TextField(),decoration: BoxDecoration(color: Colors.red),),
        ],),
      )
    );
  }
}
