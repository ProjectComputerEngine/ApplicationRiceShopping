import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './Widget/CheckBocWidget.dart';

class ChatBoxMain extends StatefulWidget {
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
                  NameText(),
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
                ))
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black38,
        height: MediaQuery.of(context).size.height * 0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PhotoButton(),
            AccessField(),
            SendButton(),
          ],
        ),
      ),
    );
  }
}