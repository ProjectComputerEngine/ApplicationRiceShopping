import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Widget/TextWidget.dart';
import 'CheckBox.dart';

class ChatMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChatState();
  }
}

class ChatState extends State<ChatMain> {
  int i = 0;
  StreamController inbox;
  Stream stream;

  void count() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      var inboX = await Inbox();
      print('Inbox render');
      inbox.add(inboX);
    });
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
                height: MediaQuery.of(context).size.height * 0.20,
                color: Color.fromRGBO(32, 50, 50, 10),
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.05,
                    0,
                    MediaQuery.of(context).size.width * 0.05,
                    0),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        child: BackButton(
                          color: Colors.white,
                        )),
                    MassageTitle(),
                    SearchBar()
                  ],
                ),
              ),
              Flexible(
                child: StreamBuilder(
                    stream: inbox.stream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      List<dynamic> inbox;
                      if (snapshot.hasData) {
                        inbox = snapshot.data;
                        return ListView.builder(
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.05,
                              0.05,
                              MediaQuery.of(context).size.width * 0.05,
                              0.05),
                          itemBuilder: (conxt, index) {
                            return Column(children: [
                              MessageButtons(
                                NewNameColor: Colors.white,
                                NewMessgeText: '${inbox[index]['NewShop']}',
                                nameUesr: '${inbox[index]['Name']}',
                                lastmessage: '${inbox[index]['Message_Last']}',
                                imageurl: '${inbox[index]['Image_URL']}',
                                time: '${inbox[index]['Update_Lasttime']}',
                                ChangeColorsCircle: Colors.red,
                                NewColorText: Colors.white,
                                TimeColor: Colors.white,
                                gotoMessage: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChatBoxMain(
                                                IDSender: 'A000000',
                                                IDInbox: inbox[index]
                                                    ['ID_Message'],
                                                inbox: inbox[index]['Name'],
                                              )));
                                },
                              ),
                              SpaceMessage(),
                            ]);
                          },
                          itemCount: inbox.length,
                        );
                      } else {
                        return Center(
                            child: SizedBox(
                          child: CircularProgressIndicator(strokeWidth: 5,),
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.1,
                        ));
                      }
                    }),
              ),
            ],
          )),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.075,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NavigationButton(
              BarIcon: Icon(Icons.book),
              BarText: 'แจ้งเตือน',
            ),
            NavigationButton(
              BarIcon: Icon(Icons.format_align_justify_outlined),
              BarText: 'คำสั่งซื้อ',
            ),
            NavigationButton(
              BarIcon: Icon(Icons.home),
              BarText: 'หน้าหลัก',
            ),
            NavigationButton(
              BarIcon: Icon(Icons.account_circle),
              BarText: 'ข้อมูลส่วนตัว',
            ),
            NavigationButton(
              BarIcon: Icon(Icons.chat),
              BarText: 'ข้อความ',
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<dynamic>> Inbox() async {
  String url = "http://" + "192.168.1.2:8080" + "/Inbox/messageinbox.php";
  var response = await get(url);
  if (response.statusCode == 200) {
    List<dynamic> Inbox = jsonDecode(response.body);
    return Inbox;
  } else {
    return null;
  }
}
