
import 'package:ApplicationRiceShopping/Admin/Backend/Bill.dart';
import 'package:flutter/material.dart';
import './Widget/BillWidget.dart';
import 'Widget/MenuNavigator.dart';
class BillMain extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return BillState();
  }
}
class BillState extends State<BillMain>{
  Bill bill = Bill();
  int status = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:menu(),
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
                                  SeleteStatus: (){
                                    setState(() {
                                      status = 0;
                                    });
                                  },
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.001,
                                ),
                                TextBillButton(
                                  TextInButtons: ('รอโอน'),
                                  SeleteStatus: (){
                                    setState(() {
                                      status = 1;
                                    });
                                  },
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.001,
                                ),
                                TextBillButton(
                                  TextInButtons: ('รอส่ง'),
                                  SeleteStatus: (){
                                    setState(() {
                                      status = 2;
                                    });
                                  },
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
                                  SeleteStatus: (){
                                    setState(() {
                                      status = 3;
                                    });
                                  },
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.001,
                                ),
                                TextBillButton(
                                  TextInButtons: ('ยกเลิก'),
                                  SeleteStatus: (){
                                    setState(() {
                                      status = 4;
                                    });
                                  },
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.001,
                                ),
                                TextBillButton(
                                  TextInButtons: ('คืนสินค้า'),
                                  SeleteStatus: (){
                                    setState(() {
                                      status = 5;
                                    });
                                  },
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
                child: FutureBuilder(
                  future: bill.ShowBill(context,status.toString()),
                  builder:(context,snapshost) {
                    if (snapshost.hasData) {
                      return ListView.builder(
                          padding: EdgeInsets.fromLTRB(MediaQuery
                              .of(context)
                              .size
                              .width * 0.04, 10, MediaQuery
                              .of(context)
                              .size
                              .width * 0.04, 0),
                          itemCount: snapshost.data.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.1,
                              color: Color.fromRGBO(255, 243, 79, 10),
                              child: FlatButton(
                                onPressed: () => {},
                                child: Row(
                                  children: [
                                    CircleAvatar(backgroundImage: NetworkImage(
                                        snapshost.data[index]['Image_URL']),),
                                    Container(width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.01,),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 10),
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.3,
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.fromLTRB(MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0, 0.01, MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0, 0.01),
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text('Order #${snapshost.data[index]['ID']}',
                                              style: TextStyle(
                                                  color: Colors.red),),
                                            Text(
                                              snapshost.data[index]['Name'],
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black),),
                                            Text(
                                                snapshost.data[index]['Date'],
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.black38))
                                          ]
                                      ),
                                    ),

                                    Container(
                                      alignment: Alignment.centerRight,
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.35,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .end,
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          Text('สถานะ รอโอน', style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black38),),
                                        ],
                                      ),
                                    )
                                  ],

                                ),
                              ),
                            );
                          }
                      );
                    }
                    else{
                      return Center(child: CircularProgressIndicator());
                    }
                  }
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}