import './Widget/TextWidget.dart';
import 'package:flutter/material.dart';
import './Style/Color.dart';

class AdminMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AdminState();
  }
}

class AdminState extends State<AdminMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorAdmin.bg,
      body: HomeContant(),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NavigationButton(
              BarIcon: Icon(Icons.book),
            ),
            NavigationButton(
              BarIcon: Icon(Icons.format_align_justify_outlined),
            ),
            NavigationButton(
              BarIcon: Icon(Icons.home),
            ),
            NavigationButton(
              BarIcon: Icon(Icons.account_circle),
            ),
            NavigationButton(
              BarIcon: Icon(Icons.chat),
            ),
          ],
        ),
      ),
    );
  }
}






class HomeContant extends StatelessWidget {
  const HomeContant({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: MediaQuery.of(context).padding,
      child: Padding(
        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05,
            0, MediaQuery.of(context).size.width * 0.05, 0),
        child: ListView(
          children: [
            TextFirstLine(),
            Space(
              SpaceSize: MediaQuery.of(context).size.height * 0.01,
            ),
            BoxFirstRow(
              FirstLineFirstColumn: 'ยอดเงิน',
              SeconeLineFirstColoumn: '99,999,999,999',
              FirstlineSeconeColumn: 'ผู้สั่งซื้อ',
              SeconeLineSeconeColoumn: '888,888,888',
              FirstColumnColor: Color.fromRGBO(245, 9, 9, 10),
              SeconeColumnColor: Color.fromRGBO(3, 195, 2, 10),
            ),
            Space(
              SpaceSize: MediaQuery.of(context).size.height * 0.01,
            ),
            BoxFirstRow(
              FirstLineFirstColumn: 'ยอดเงิน',
              SeconeLineFirstColoumn: '99,999,999,999',
              FirstlineSeconeColumn: 'ผู้สั่งซื้อ',
              SeconeLineSeconeColoumn: '888,888,888',
              FirstColumnColor: Color.fromRGBO(66, 103, 178, 10),
              SeconeColumnColor: Color.fromRGBO(243, 191, 6, 10),
            ),
            Space(
              SpaceSize: MediaQuery.of(context).size.height * 0.01,
            ),
            SupButton(),
            Space(
              SpaceSize: MediaQuery.of(context).size.height * 0.01,
            ),
            LessProductButton(),
            Container(
              height: MediaQuery.of(context).size.height * 0.22,
              color: Colors.white,
              child: Row(
                children: [
                  Flexible(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        LessRiceButton(),
                        LessRiceButton(),
                        LessRiceButton(),
                        LessRiceButton(),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
