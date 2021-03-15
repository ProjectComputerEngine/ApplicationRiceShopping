import 'package:flutter/material.dart';
import './Widget/TextWidget.dart';
class PersonalMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PersonalState();
  }
}

class PersonalState extends State<PersonalMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        color: Colors.black12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NavigationButton(
              BarIcon: Icon(Icons.book),
              BarText: 'คำสั่งซื้อ',
            ),
            NavigationButton(
              BarIcon: Icon(Icons.format_align_justify_outlined),
              BarText: 'การแจ้งเตือน',
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
      body: Container(
        margin: MediaQuery.of(context).padding,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("res/Background.png"), fit: BoxFit.cover),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.01,
                  0,
                  MediaQuery.of(context).size.width * 0.01,
                  0),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 1,
              color: Colors.black12,
              child: Column(children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    children: [
                      BackButtons(),
                    ],
                  ),
                ),
                Container(height: MediaQuery.of(context).size.height * 0.08),
                PictureProfile(),
                TextName(
                  SelfNameText: 'ชื่ออออออออออออ',
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                TextUnderName(
                  FrontText: ('ตำแหน่ง'),
                  EndText: ('ผู้จัดการผ่ายยยยยยยยยยยย'),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextUnderName(
                  FrontText: ('เบอร์โทร'),
                  EndText: ('00000000000000000'),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                PlaceText(TextPLACE: 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF',),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                ClickButton(
                  TextButton: ('แก้ไขโปรไฟล์'),
                ),
                ClickButton(
                  TextButton: ('ประวัติการเข้าใช้'),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
