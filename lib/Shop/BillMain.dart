import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import './Widget/NewProductWidget.dart';

import './Backend/SendBill.dart';
class BillMain extends StatefulWidget {
  @override
  _BillMainState createState() => _BillMainState();
}

class _BillMainState extends State<BillMain> {
  SendBill sendBill = SendBill();
  LocalStorage localStorageBill;
  LocalStorage localStorageShop;
  StreamController<double> sum = StreamController();
  double SUM = 0;
  double sumPrice = 0;
  List<dynamic> listBill = [];
  dynamic userdata;

  @override
  void initState() {
    localStorageBill = LocalStorage('Bill');
    localStorageShop = LocalStorage('userOnline');
    sum.stream.listen((value) {
      print(value.toString());
      SUM += value;
    }).onDone(() {
      setState(() {});
    });
    super.initState();
  }
  void clearCart(){
      localStorageBill.clear();
      //Navigator.of(context).pop();
      showMyDialogDouble(context, 'ล้างตะกร้าสำเร็จ \n กรุณาเลือกสินค้าใหม่');
      setState(() {
      });

  }
  void addOrderAll() async{
    userdata = await localStorageShop.getItem('Shop');
     bool complete = await sendBill.sendOrderBill(bill: listBill,total: SUM.toString(),shop: userdata );
     if(complete){
       localStorageBill.deleteItem('BillDetail');
       showMyDialogDouble(context, 'สั่งซื้อสำเร็จ \n รอการตรวจสอบจากทางเเอดมิน');
     }
     else{
       showMyDialogDouble(context, 'เกิดข้อผิดพลาดทางเครือข่าย \nกรุณาลองใหม่อีกครั้ง');

     }
  }

  @override
  void dispose() {
    print('localStorage Stop');
    sum.close();
    userdata == null ? null:localStorageBill.dispose();
    listBill == null ? null:localStorageShop.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
            future: localStorageBill.ready,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                listBill = localStorageBill.getItem('BillDetail');
                if(listBill != null) {
                  return Column(children: [
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            sumPrice = 0;
                            //SUM = 0;
                            sum.isClosed
                                ? null
                                : sum.add(listBill[index]['num'] *
                                listBill[index]['price']);
                            sumPrice =
                                listBill[index]['num'] *
                                    listBill[index]['price'];
                            index == listBill.length - 1 ? sum.close() : null;
                            return Table(
                              defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                              border: TableBorder.all(),
                              children: [
                                TableRow(
                                  children: [
                                    Center(
                                      child: Text(listBill[index]['Name']
                                          .toString()
                                          .replaceAll('\\n', '\n')),
                                    ),
                                    Center(
                                        child: Text(
                                            listBill[index]['num'].toString())),
                                    Center(
                                        child: Text(
                                            listBill[index]['price']
                                                .toString())),
                                    Center(child: Text(sumPrice.toString())),
                                  ],
                                ),
                              ],
                            );
                            Text(listBill[index]['Name'] +
                                listBill[index]['num'].toString() +
                                listBill[index]['price'].toString());
                          },
                          itemCount: listBill.length,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(SUM.toString()),
                    ),
                    Flexible(
                        child: OutlineButton(
                          child: Text('สั่ง'),
                          onPressed: () => addOrderAll(),
                        ),),
                    Flexible(child: OutlineButton(
                      child: Text('ล้างตะกร้า'),onPressed: ()=>clearCart(),
                    ))
                  ]);
                }
                else{
                  return Center(child: Text('ว่าง'));
                }
              } else {
                return Center(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            }),
      ),
    );
  }
}
//
// Future<void> sendOrder({List<dynamic> bill, String total,LocalStorage shop}) async{
//   var shopData = await shop.getItem('Shop');
//   if(bill != null && shopData != null){
//     var jsonBill = jsonEncode(bill);
//     print(shopData['ID_Admin']);
//     print(jsonBill);
//     print(total);
//   }else{
//     print('null');
//   }
// }
