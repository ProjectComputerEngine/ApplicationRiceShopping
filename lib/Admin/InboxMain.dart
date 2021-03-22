import 'dart:async';
import 'dart:convert';

import 'Widget/MenuNavigator.dart';

import 'InboxDetail.dart';
import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Widget/TextWidget.dart';

// import 'ChatBox.dart';
import './Backend/Chat.dart';

class ChatMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChatState();
  }
}

class ChatState extends State<ChatMain> {
  Chat chat = Chat();
  int i = 0;
  StreamController inbox;
  Stream stream;

  Future<void> count() async {
    var inboX = await chat.listInbox(context);
    print('Inbox render');
    inbox.add(inboX);
  }

  @override
  void initState() {
    inbox = StreamController(onListen: count);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 50, 50, 10),
      body: Container(
          margin: MediaQuery.of(context).padding,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.12,
                color: Color.fromRGBO(42, 64, 87, 10),
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.05,
                    0,
                    MediaQuery.of(context).size.width * 0.05,
                    0),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BackButton(
                                color: Colors.white,
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.refresh_sharp,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {});
                                  })
                            ])),
                    MassageTitle(),
                  ],
                ),
              ),
              Flexible(
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("res/BackgroundShop.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  StreamBuilder(
                      stream: inbox.stream,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        List<dynamic> inbox;
                        if (snapshot.hasData) {
                          inbox = snapshot.data;
                          return ListView.builder(
                            padding: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.05,
                                5,
                                MediaQuery.of(context).size.width * 0.05,
                                0.05),
                            itemBuilder: (conxt, index) {
                              return Column(children: [
                                MessageButtons(
                                  NewNameColor: Colors.white,
                                  NewMessgeText: '${inbox[index].NewShop}',
                                  nameUesr: '${inbox[index].Name}',
                                  lastmessage:
                                  '${inbox[index].Message_Lasttime}',
                                  imageurl: '${inbox[index].Image_URL}',
                                  time: '${inbox[index].Update_Lasttime}',
                                  ChangeColorsCircle: Colors.red,
                                  NewColorText: Colors.white,
                                  TimeColor: Colors.white,
                                  gotoMessage: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ChatBoxMain(
                                              idSender:
                                              inbox[index].ID_Message,
                                            )));
                                  },
                                ),
                                SpaceMessage(),
                              ]);
                            },
                            itemCount: inbox.length,
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Container(
                              child: IconButton(
                                icon: Icon(Icons.refresh_sharp),
                              ),
                            ),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      }),
                ]),
              )
            ],
          )),
      bottomNavigationBar: menu(),
    );
  }
}