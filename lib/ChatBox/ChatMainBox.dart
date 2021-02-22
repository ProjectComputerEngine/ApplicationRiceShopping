import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Widget/TextWidget.dart';

class ChatMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChatState();
  }
}

class ChatState extends State<ChatMain> {
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
                  children: [BackButton(), MassageTitle(), SearchBar()],
                ),
              ),
              Flexible(
                child: ListView(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05,
                      0.05,
                      MediaQuery.of(context).size.width * 0.05,
                      0.05),
                  children: [
                    SpaceMessage(),
                    MessageButtons(
                      NewNameColor: Colors.white,
                      NewMessgeText: '1',
                      ChangeColorsCircle: Colors.red,
                      NewColorText: Colors.white,
                      TimeColor: Colors.white,
                    ),
                    SpaceMessage(),
                    MessageButtons(
                      NewNameColor: Colors.white24,
                      NewMessgeText: '',
                      ChangeColorsCircle: Color.fromRGBO(32, 50, 50, 0),
                      NewColorText: Colors.white24,
                      TimeColor: Colors.white24,
                    ),

                  ],
                ),
              ),
            ],
          )),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1,
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
