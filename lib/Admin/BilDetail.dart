import 'package:flutter/material.dart';
import './Widget/BillDetailWidget.dart';

class BillDetailMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BillDetailState();
  }
}

class BillDetailState extends State<BillDetailMain> {
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
      body: Form(
          child: Container(
            margin: MediaQuery.of(context).padding,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("res/BackgroundShop.png"),
                        fit: BoxFit.cover),
                  ),
                ),
                ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.05,
                          0,
                          MediaQuery.of(context).size.width * 0.05,
                          0),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.01,
                                0,
                                MediaQuery.of(context).size.width * 0.01,
                                0),
                            child: Column(
                              children: [
                                BacksButton(),
                                MassageTitle(),
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.001,
                          ),
                          Card(
                            color: Color.fromRGBO(6, 243, 186, 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.12,
                              child: Row(
                                children: [
                                  Card(
                                    shape: CircleBorder(),
                                    child: Container(
                                      height: MediaQuery.of(context).size.height * 0.16,
                                      width: MediaQuery.of(context).size.width * 0.16,
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.48,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        NameText(),
                                        DateAndTime(
                                          DateANDTimeFont:
                                          'วันพฤหัสบดี ที่ 18 มีนาคม 2564',
                                        ),
                                        DateAndTime(
                                          DateANDTimeFont: 'เวลา 23.20 น.',
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'Order #001',
                                      style: TextStyle(color: Colors.red, fontSize: 14),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.001,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.01,
                                0,
                                MediaQuery.of(context).size.width * 0.01,
                                0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'รายละเอียด',
                              style: TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.005,
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(
                                  MediaQuery.of(context).size.width * 0.01,
                                  0,
                                  MediaQuery.of(context).size.width * 0.01,
                                  0),
                              child: Column(
                                children: [
                                  TitleBox(TextTitle: 'สินค้า',),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(8),
                                            bottomRight: Radius.circular(8))),
                                    alignment: Alignment.center,
                                    height: MediaQuery.of(context).size.height * 0.15,
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                child: Text(
                                                  'ข้าวหอมมะลิแต่งกลิ่นรสใบเตย',
                                                  style: TextStyle(fontSize: 10),
                                                ),
                                                width:
                                                MediaQuery.of(context).size.width *
                                                    0.38,
                                                alignment: Alignment.center,
                                              ),
                                              Container(
                                                child: Text(
                                                  'ถุงละ 139 บาท',
                                                  style: TextStyle(fontSize: 10),
                                                ),
                                                width:
                                                MediaQuery.of(context).size.width *
                                                    0.18,
                                                alignment: Alignment.centerLeft,
                                              ),
                                              Container(
                                                child: Text(
                                                  'จำนวน 100 ถุง ',
                                                  style: TextStyle(fontSize: 10),
                                                ),
                                                width:
                                                MediaQuery.of(context).size.width *
                                                    0.17,
                                                alignment: Alignment.center,
                                              ),
                                              Container(
                                                child: Text(
                                                  '1390 บาท',
                                                  style: TextStyle(fontSize: 10),
                                                ),
                                                width:
                                                MediaQuery.of(context).size.width *
                                                    0.15,
                                                alignment: Alignment.centerRight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                child: Text(
                                                  'รวม',
                                                  style: TextStyle(fontSize: 10),
                                                ),
                                                width:
                                                MediaQuery.of(context).size.width *
                                                    0.7,
                                                alignment: Alignment.centerRight,
                                              ),
                                              Container(
                                                child: Text(
                                                  '1390 บาท',
                                                  style: TextStyle(fontSize: 10),
                                                ),
                                                alignment: Alignment.centerRight,
                                                width:
                                                MediaQuery.of(context).size.width *
                                                    0.18,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                          Container(height: MediaQuery.of(context).size.height*0.01,),
                          Container(
                            padding: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.01,
                                0,
                                MediaQuery.of(context).size.width * 0.01,
                                0),
                            child: Column(
                              children: [
                                TitleBox(TextTitle: 'สถานะ',),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8))),
                                  alignment: Alignment.center,
                                  height: MediaQuery.of(context).size.height * 0.08,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          StatusOfBill(TypeOfStatus: 'สถานะรอโอน',),
                                          StatusOnBILL(),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          StatusOfBill(TypeOfStatus: 'สถานะรอส่ง',),
                                          StatusOnBILL(),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          StatusOfBill(TypeOfStatus: 'สถานะสำเร็จ',),
                                          StatusOnBILL(),
                                        ],
                                      )

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(height: MediaQuery.of(context).size.height*0.01,),
                          AcessToStatus(TextStatusINButton: 'เข้าสู่สถานะรอโอน',),
                          AcessToStatus(TextStatusINButton: 'เข้าสู่สถานะรอส่ง',),
                          AcessToStatus(TextStatusINButton: 'เข้าสู่สถานะสำเร็จ',),
                          AcessToStatus(TextStatusINButton: 'เข้าสู่สถานะยกเลิก',),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
