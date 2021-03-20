import 'package:ApplicationRiceShopping/Login/Widget/TextWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
class Connection {
  static final String server = '128.199.110.176:8080';

  Future<dynamic> connect({BuildContext context}) async {
    String url = 'http://'+server+'/connection.php';
    var response = await get(url);
    if (response.statusCode == 200){
      if(response.body.isEmpty){
        return 'ok';
      }
      else{
        showMyDialog(context, 'การเชื่อมต่อล้มเหลว กรุณาลองใหม่อีกครั้ง !');
        return null;
      }
    }
    else {
      showMyDialog(context, 'การเชื่อมต่อล้มเหลว กรุณาลองใหม่อีกครั้ง !');
      return null;
    }
  }
  Future<String> connectLogin({String username, String password, String device, String time, String ip,BuildContext context}) async {
    String url = 'http://$server/login/Login2Database.php?username=$username&password=$password&device=$device&time=$time&ip=$ip';
    var response = await get(url).timeout(Duration(seconds: 3), onTimeout: (){
      // showMyDialog(context, 'การเชื่อมต่อล้มเหลว กรุณาลองใหม่อีกครั้ง !');
      return null;
    });
    if (response.statusCode == 200){
      if(response.body.isNotEmpty){
        return response.body;
      }
      else {
        // showMyDialog(context, 'การเชื่อมต่อล้มเหลว กรุณาลองใหม่อีกครั้ง !');
        return null;
      }
    }
    else {
      // showMyDialog(context, 'การเชื่อมต่อล้มเหลว กรุณาลองใหม่อีกครั้ง !');
      return null;
    }
  }

  Future<String> Inbox({BuildContext context}) async {
    String url = "http://$server/Inbox/messageinbox.php";
    var response = await get(url);
    if (response.statusCode == 200) {
      if(response.body.isNotEmpty){
        return response.body;
      }
      else {
        showMyDialog(context, 'การเชื่อมต่อล้มเหลว กรุณาลองใหม่อีกครั้ง !');
      }
    } else {
      showMyDialog(context, 'การเชื่อมต่อล้มเหลว กรุณาลองใหม่อีกครั้ง !');
    }
  }
  Future<String> ProductAll({BuildContext context}) async {
    String url = "http://$server/product/productall.php";
    var response = await get(url);
    if (response.statusCode == 200) {
      if(response.body.isNotEmpty){
        return response.body;
      }
      else {
        showMyDialog(context, 'การเชื่อมต่อล้มเหลว กรุณาลองใหม่อีกครั้ง !');
      }
    } else {
      showMyDialog(context, 'การเชื่อมต่อล้มเหลว กรุณาลองใหม่อีกครั้ง !');
    }
  }
  Future<bool> SendOrder({BuildContext context,String bill,String IDShop,String date,String total}) async{
    bool comlete = true;
    var request = await MultipartRequest('POST', Uri.parse('http://$server/shopping/index.php'));
    print(IDShop.trim()+'|');
    request.fields['bill'] =bill;
    request.fields['idShop']=IDShop.trim();
    request.fields['date'] = date;
    request.fields['total'] = total;
    request.send().then((response) async {
      response.stream.transform(utf8.decoder).listen((event) {
        print(event);
      });
    }).catchError((onError) {
      print(onError.toString());
      comlete = false;
    }).then((value){
      print('Complete');
    });
    return comlete;
  }
}

