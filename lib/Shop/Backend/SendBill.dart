
import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:ApplicationRiceShopping/Connection.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart';

class SendBill extends Connection {

  Future<bool>sendOrderBill({List<dynamic> bill,dynamic shop, String total,BuildContext context}) async{
    bool complete = true;
    if(bill != null && shop != null){
      var jsonBill = jsonEncode(bill);
      String time = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()) +
          "." +
          DateTime.now().millisecond.toString();
      print(shop['ID_Admin']);
      print(jsonBill);
      print(total);
     bool complete = await SendOrder(context: context,total: total,bill: jsonBill,date:time,IDShop: shop['ID_Admin'] );
     print(complete.toString());
    }else{
      complete = false;
    }
    return complete;
  }
}