import './Widget/TextWidget.dart';
import 'package:flutter/material.dart';
import './Style/Color.dart';
import './Widget/MenuNavigator.dart';
import 'package:ApplicationRiceShopping/Login/LoginMain.dart';

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
      body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("res/BackgroundShop.png"),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              margin: MediaQuery.of(context).padding,
              child: Padding(
                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05,
                    0, MediaQuery.of(context).size.width * 0.05, 0),
                child: ListView(
                  children: [

                    Container(

                      child: FlatButton(
                        onPressed: () =>{
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainLogin()))
                        },
                        child: IconButton(
                          icon: Icon(Icons.logout,color: Colors.white,),
                          alignment: Alignment.centerRight,
                        ),
                      ),

                      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01,0.01,MediaQuery.of(context).size.width*0.01,0.01),
                      alignment: Alignment.centerRight,
                    ),
                    TextFirstLine(),
                    Space(
                      SpaceSize: MediaQuery.of(context).size.height * 0.02,
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
                              // padding: EdgeInsets.symmetric(horizontal: 10),
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
            ),]),
      bottomNavigationBar: menu(),
    );
  }
}