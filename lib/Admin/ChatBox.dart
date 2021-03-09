import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './Widget/CheckBoxWidget.dart';

class ChatBoxMain extends StatefulWidget {
  final String inbox;
  final String IDInbox;
  final String IDSender;
  ChatBoxMain({this.inbox, this.IDInbox, this.IDSender});

  @override
  State<StatefulWidget> createState() {
    return ChatBoxStat();
  }
}

class ChatBoxStat extends State<ChatBoxMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 50, 50, 10),
      body: Container(
        margin: MediaQuery.of(context).padding,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              color: Color.fromRGBO(32, 50, 50, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButtons(),
                  NameText(name:widget.inbox),
                  CallButton(),
                  SettingButton(),
                ],
              ),
            ),
            Flexible(
                child: ListView(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05,
                      0,
                      MediaQuery.of(context).size.width * 0.05,
                      0),
                  children: [
                    Spaceheight(),
                    UserText(),
                    Spaceheight(),
                    AdminText(),
                  ],
                )),
            Container(
              color: Colors.black38,
              height: MediaQuery.of(context).size.height * 0.075,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PhotoButton(),
                  AccessField(),
                  SendButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}