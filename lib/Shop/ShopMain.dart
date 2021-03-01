
import 'package:flutter/material.dart';
import './Widget/TextWidget.dart';

class ShopMains extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ShopState();
  }
}

class ShopState extends State<ShopMains> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NavigationButton(
              BarIcon: Icon(Icons.book),
              BarText: 'แจ้งเตือน',
              GotoOther: ()=>{},

            ),
            NavigationButton(
              BarIcon: Icon(Icons.format_align_justify_outlined),
              BarText: 'คำสั่งซื้อ',
              GotoOther: ()=>{},
            ),
            NavigationButton(
              BarIcon: Icon(Icons.home),
              BarText: 'หน้าหลัก',
              GotoOther: ()=>{},
            ),
            NavigationButton(
              BarIcon: Icon(Icons.account_circle),
              BarText: 'ข้อมูลส่วนตัว',
              GotoOther: ()=>{},
            ),
            NavigationButton(
              BarIcon: Icon(Icons.chat),
              BarText: 'ข้อความ',
              GotoOther: ()=>{},
            ),
          ],
        ),
      ),
      body: Container(
        margin: MediaQuery.of(context).padding,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              color: Color.fromRGBO(32, 50, 50, 10),
              child: Row(
                children: [
                  BackIcons(
                    GotoBackPage: ()=>{},
                  ),
                  ProductText(),
                ],
              ),
            ),

            //---------------//
            Flexible(
              child: Container(
                  color: Color.fromRGBO(32, 50, 50, 10),
                  child: Column(
                    children: [
                      SpaceDisplay(),
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.04,
                            0,
                            MediaQuery.of(context).size.width * 0.04,
                            0),
                        //color: Colors.red,
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FlatButton(
                              color: Colors.white24,
                              onPressed: () => {},
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              height: MediaQuery.of(context).size.height * 0.35,
                              minWidth: MediaQuery.of(context).size.width * 0.4,
                              child: Column(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.235,
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    //color: Colors.yellow,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(8),
                                            topLeft: Radius.circular(8))),
                                    child: Container(),
                                  ),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(8),
                                            bottomLeft: Radius.circular(8))),
                                    child: Container(
                                      height:
                                      MediaQuery.of(context).size.height *
                                          0.1,
                                      padding: EdgeInsets.fromLTRB(
                                          MediaQuery.of(context).size.width *
                                              0.015,
                                          0,
                                          MediaQuery.of(context).size.width *
                                              0.015,
                                          0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(8),
                                              bottomRight: Radius.circular(8)),
                                          color:
                                          Color.fromRGBO(32, 50, 50, 100)),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          SpaceHeight(),
                                          TextRiceName(
                                            NameText: 'ข้าวอวบๆโตๆ',
                                          ),
                                          TextPrice(
                                            FrontText: 'ราคา',
                                            MediumText: '11000',
                                            EndText: 'บาท',
                                          ),
                                          TextPrice(
                                            FrontText: 'เหลือ',
                                            MediumText: '10',
                                            EndText: 'กระสอบ',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SpaceProduct(),
                          ],
                        ),
                      ),
                      SpaceDisplay(),
                      SpaceDisplay(),
                      AddButton(
                        GotoNewproduct: ()=>{},
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
