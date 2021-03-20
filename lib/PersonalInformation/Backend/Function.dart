import 'package:ApplicationRiceShopping/Login/LoginMain.dart';
import 'package:flutter/material.dart';

// ------------------     dialog        -----------------------
Future<void> showMyDialogLogout(
    {BuildContext context}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('ถุงข้าว'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Center(child: Text('จะออกระ'),)
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('ยืนยัน'),
            onPressed: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => MainLogin()),
              );
            },
          ),
          TextButton(
            child: Text('ยกเลิก'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
