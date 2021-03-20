import 'package:ApplicationRiceShopping/Admin/AdminMain.dart';
import 'package:ApplicationRiceShopping/Admin/BillMain.dart';
import 'package:ApplicationRiceShopping/Admin/ChatMain.dart';
import 'package:flutter/material.dart';
import 'package:ApplicationRiceShopping/PersonalInformation/PersonaAdminMain.dart';
class menu extends StatelessWidget {
  const menu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavigationButton(
            BarIcon: Icon(Icons.book),
            BarText: 'คำสั่งซื้อ',
            goto: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BillMain()));
            },
          ),
          NavigationButton(
            BarIcon: Icon(Icons.format_align_justify_outlined),
            goto: (){},
            BarText: 'การแจ้งเตือน',
          ),
          NavigationButton(
            BarIcon: Icon(Icons.home),
            BarText: 'หน้าหลัก',
            goto: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminMain()));
            },
          ),
          NavigationButton(
            BarIcon: Icon(Icons.account_circle),
            goto: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalAdminMain()));
            },
            BarText: 'ข้อมูลส่วนตัว',
          ),
          NavigationButton(
            BarIcon: Icon(Icons.chat),
            BarText: 'ข้อความ',
            goto: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatMain()));
            },
          ),
        ],
      ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  final Icon BarIcon;
  final String BarText;
  final Function goto;

  const NavigationButton({
    Key key,
    this.BarIcon,
    this.BarText, this.goto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(shape: CircleBorder()),
      child: FlatButton(
        onPressed: goto,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            BarIcon,
            Container(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              BarText,
              style: TextStyle(fontSize: 8),
            )
          ],
        ),
        minWidth: MediaQuery.of(context).size.width * 0,
      ),
    );
  }
}
