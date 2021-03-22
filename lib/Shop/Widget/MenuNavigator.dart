import 'package:ApplicationRiceShopping/Admin/AdminMain.dart';
import 'package:ApplicationRiceShopping/Admin/BillMain.dart';
import 'package:ApplicationRiceShopping/Admin/InboxMain.dart';
import 'package:ApplicationRiceShopping/Admin/Widget/TextWidget.dart';
import 'package:flutter/material.dart';
import 'package:ApplicationRiceShopping/PersonalInformation/PersonaAdminMain.dart';
import 'package:ApplicationRiceShopping/Admin/StorageMain.dart';
import 'package:localstorage/localstorage.dart';
import '../DetailInbox.dart';
class menu extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    LocalStorage localStorage = LocalStorage('userOnline');
    return FutureBuilder(
        future: localStorage.ready,
        builder:(context,snapshost) {
          if(snapshost.hasData) {
            var userData = localStorage.getItem('Shop');
            return Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.08,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NavigationButton(
                    BarIcon: Icon(Icons.book),
                    BarText: 'คำสั่งซื้อ',
                    goto: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BillMain()));
                    },
                  ),
                  NavigationButton(
                    BarIcon: Icon(Icons.storage),
                    goto: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => StorageMain()));
                    },
                    BarText: 'คลังสินค้า',
                  ),
                  NavigationButton(
                    BarIcon: Icon(Icons.home),
                    BarText: 'หน้าหลัก',
                    goto: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AdminMain()));
                    },
                  ),
                  NavigationButton(
                    BarIcon: Icon(Icons.account_circle),
                    goto: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => PersonalAdminMain()));
                    },
                    BarText: 'ข้อมูลส่วนตัว',
                  ),
                  NavigationButton(
                    BarIcon: Icon(Icons.chat),
                    BarText: 'ข้อความ',
                    goto: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ChatBoxMain(idSender: userData['ID_Admin'],)));
                    },
                  ),
                ],
              ),
            );
          }
          else{
            return Center(child: CircularProgressIndicator());
          }
        }
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