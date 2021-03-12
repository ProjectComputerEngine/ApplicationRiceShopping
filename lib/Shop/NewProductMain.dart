import 'package:flutter/material.dart';
import './Widget/NewProductWidget.dart';

class NewProductMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewProductState();
  }
}

class NewProductState extends State<NewProductMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        color: Colors.white,
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
        child: Column(
          children: [
            Container(
              color: Color.fromRGBO(32, 50, 50, 10),
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                children: [BackButtons(), AddProductText()],
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
                  Container(
                    child: Text(
                      'รูป',
                      textAlign: TextAlign.left,
                      style: TextStyle(),
                    ),
                  ),
                  SpaceHeight(),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        LargeImageBox(),
                        SpaceWidth(),
                        TwoImageBox(),
                        SpaceWidth(),
                        TwoImageBox(),
                      ],
                    ),
                  ),
                  SpaceHeight(),
                  Container(
                    child: Text(
                      'รายละเอียด',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SpaceHeight(),
                  SpaceHeight(),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color.fromRGBO(32, 50, 50,10)),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        SpaceHeight(),
                        SpaceHeight(),
                        ProductNameTextField(),
                        PriceTextField(),
                        WeightTextField(),
                        SpaceText(),
                        SizePacketText(),
                        SpaceText(),
                        SizePacketTextField(),
                        SpaceText(),
                        IncressProductText(),
                        SpaceText(),
                        IncressProductTextField(),
                        ProductionDateTextField(),
                        PlaceTextField(),
                        RecommendTextField(),
                        NoteTextField(),
                        SaveBUTTON()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
