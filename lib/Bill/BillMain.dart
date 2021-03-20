import 'package:flutter/material.dart';
import './Widget/TextWidget.dart';
class BillMain extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return BillState();
  }
}

class BillState extends State<BillMain>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:Container(
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
      body:Form(
        child: Container(
          margin: MediaQuery.of(context).padding,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.27,
                color: Color.fromRGBO(255, 234, 79, 10),
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.05,
                    0,
                    MediaQuery.of(context).size.width * 0.05,
                    0),
                child: Column(
                  children: [BacksButton(), MassageTitle(),
                    Container(height: MediaQuery.of(context).size.height*0.01,),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                TextBillButton(
                                  TextInButtons: ('คำสั่งซื้อ'),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.001,
                                ),
                                TextBillButton(
                                  TextInButtons: ('รอโอน'),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.001,
                                ),
                                TextBillButton(
                                  TextInButtons: ('รอส่ง'),
                                )

                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height*0.0001,
                          ),
                          Container(
                            child: Row(
                              children: [
                                TextBillButton(
                                  TextInButtons: ('สำเร็จ'),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.001,
                                ),
                                TextBillButton(
                                  TextInButtons: ('ยกเลิก'),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.001,
                                ),
                                TextBillButton(
                                  TextInButtons: ('คืนสินค้า'),
                                )

                              ],
                            ),
                          )

                        ],
                      ),
                    )],
                ),
              ),
              Flexible(
                child: ListView(
                  padding:EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05,0,MediaQuery.of(context).size.width*0.05,0),
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.01,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.1,
                      color: Color.fromRGBO(255, 243, 79, 10),
                      child: FlatButton(
                        onPressed: () => {},
                        child: Row(
                          children: [
                            PictureProfile(),
                            Container(width: MediaQuery.of(context).size.width*0.01,),
                            Container(
                              width: MediaQuery.of(context).size.width*0.3,
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0,0.01,MediaQuery.of(context).size.width*0,0.01),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Order #001',style: TextStyle(color: Colors.red),),
                                    Text('ชื่อxxxxxxxxxxx',style: TextStyle(fontSize: 12,color: Colors.black),),
                                    Text('เวลา 00.00 น.',style: TextStyle(fontSize: 10,color: Colors.black38))
                                  ]
                              ),
                            ),

                            Container(
                              alignment: Alignment.centerRight,
                              width: MediaQuery.of(context).size.width*0.35,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('สถานะ รอโอน',style: TextStyle(fontSize: 10,color: Colors.black38),),
                                  Text('วันที่ 12/12/2000',style: TextStyle(fontSize: 10,color: Colors.black38)),
                                  Text('เวลา 00.00 น.',style: TextStyle(fontSize: 10,color: Colors.black38))

                                ],
                              ),
                            )
                          ],

                        ),
                      ),
                    )


                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
