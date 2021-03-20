import 'package:ApplicationRiceShopping/PersonalInformation/PersonaShopMain.dart';
import 'package:flutter/material.dart';
import '../Login/LoginMain.dart';
import '../Connection.dart';
import '../Login/Widget/TextWidget.dart';
import 'package:ApplicationRiceShopping/Admin/AdminMain.dart';
import 'package:localstorage/localstorage.dart';

class FristPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FristPage> {
  LocalStorage storage;
  int num =1;
  Widget mainUser;
  @override
  initState() {
    storage = LocalStorage('userOnline');
    super.initState();
  }
  @override
  void dispose() {
    print('Dispose Main Into Complete');
    num = 1;
    storage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white12,
        body: FutureBuilder(
            future: storage.ready,
            builder: (context, snapshot) {
          if (snapshot.hasData) {
            var userShop = storage.getItem('Shop');
            var userAdmin = storage.getItem('Admin');
            if(userAdmin != null || userShop != null){

              if(userAdmin != null){
                mainUser = AdminMain();
              }
              else{
                mainUser = PersonalShopMain();
              }
            }
            else{
              mainUser = MainLogin();
            }
            snapshot.connectionState == ConnectionState.done && num == 1 ? timerLinkPage(context,mainUser):null;
            num++;
            return Center(
              child: Container(
                child: Image.asset('res/logo.png'),
              ),
            );
          } else {
            return Center(
              child: Container(
                child: Image.asset('res/logo.png'),
              ),
            );
          }
        }));
  }
}

Future timerLinkPage(BuildContext context,Widget main) {
  return Future.delayed(Duration(seconds: 3), () {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => main));
  });
}
