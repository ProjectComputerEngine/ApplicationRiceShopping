import 'package:ApplicationRiceShopping/Admin/AdminMain.dart';
import 'package:ApplicationRiceShopping/Admin/ChatMain.dart';
import 'package:ApplicationRiceShopping/Shop/StorageMain.dart';
import 'package:flutter/material.dart';
import 'package:ApplicationRiceShopping/PersonalInformation/PersonaShopMain.dart';

import '../BillMain.dart';
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
            goto: (){},
          ),
          NavigationButton(
            BarIcon: Icon(Icons.shopping_cart_rounded),
            goto: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BillMain()));
            },
            BarText: 'ตะกร้า',
          ),
          NavigationButton(
            BarIcon: Icon(Icons.store),
            BarText: 'สินค้า',
            goto: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>StorageMain()));
            },
          ),
          NavigationButton(
            BarIcon: Icon(Icons.account_circle),
            goto: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalShopMain()));
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
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
        minWidth: MediaQuery.of(context).size.width * 0,
      ),
    );
  }
}
