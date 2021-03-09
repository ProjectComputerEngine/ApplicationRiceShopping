import 'dart:convert';

import 'package:ApplicationRiceShopping/Connection.dart';
import 'package:flutter/material.dart';
import 'InboxModule.dart';

class Chat extends Connection {
  List<Inbox> listinbox = [];

  Future<dynamic> listInbox(BuildContext context) async {
    listinbox = [];
    String data = await super.Inbox(context: context);
    var jsonData = jsonDecode(data);
    for (int i=0;i<jsonData.length;i++){
        Inbox inbox = Inbox(
          ID_Message: jsonData[i]['ID_Message'],
          Update_Lasttime: jsonData[i]['Update_Lasttime'],
          Num: jsonData[i]['Num'],
          NewAdmin: jsonData[i]['NewAdmin'],
          NewShop: jsonData[i]['NewShop'],
          Message_Lasttime: jsonData[i]['Message_Last'],
          Image_URL: jsonData[i]['Image_URL'],
          Name: jsonData[i]['Name'],
        );
      listinbox.add(inbox);
    }

    return listinbox;
  }
}
