
import 'dart:convert';

import 'package:ApplicationRiceShopping/Connection.dart';
import 'package:flutter/material.dart';

class Bill extends Connection {
  Future<void> ShowBill(BuildContext context,String status) async {
    try{
     String data  = await OrderAll(context: context,status: status);
     var jsonData = jsonDecode(data);
     return jsonData;
  }catch (error){
      return null;
    }
  }
}