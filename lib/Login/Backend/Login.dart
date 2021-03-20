import 'dart:async';
import 'dart:convert';
import 'package:ApplicationRiceShopping/Admin/Backend/AdminModule.dart';
import 'package:ApplicationRiceShopping/Shop/Backend/ShopModule.dart';
import 'package:ApplicationRiceShopping/Connection.dart';
import 'package:flutter/material.dart';
import '../Widget/TextWidget.dart';
import 'package:intl/intl.dart';

class Login extends Connection {
  String name;
  String device;
  String time;
  String ip;
  Admin adminData;
  Shop shopData;
  Map<String,dynamic> jsonUser;


  Future<dynamic> Login2Database(
      {String username,
      String password,
      String device,
      String ip,
      BuildContext context}) async {
    try {
      String time = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()) +
          "." +
          DateTime.now().millisecond.toString();
      var data = await super.connectLogin(
          username: username,
          password: password,
          device: device,
          time: time,
          ip: '192.168.1.1');
      if (data != null) {
        var jsonData = jsonDecode(data.toString());
        if (jsonData['ID_Admin'][0] == 'A' || jsonData['ID_Admin'][0] == 'S') {
          if (jsonData['ID_Admin'][0] == 'A') {
            _LoadAdminModule(jsonData);
          } else {
            _LoadShopModule(jsonData);
          }
        } else {
          showMyDialog(context,
              'บัขญีผู้ใช่งานหรือรหัสผ่านไม่ถูกต้อง \nกรุณาลองใหม่อีกครั้ง');
        }
      }else{
         }

    }on TimeoutException catch (_) {
      showMyDialog(context,
          'การเขื่อมต่อล้มเหลว หรืออินเตอร์เน็ตขัดข้อง\nกรุณาลองใหม่อีกครั้ง');
    }
    catch (error) {
      showMyDialog(context,
          'การเขื่อมต่อล้มเหลว หรืออินเตอร์เน็ตขัดข้อง\nกรุณาลองใหม่อีกครั้ง');
    }
  }

  void _LoadAdminModule(dynamic jsonData) {
    jsonUser = jsonData;
    adminData = Admin(
        ID: jsonData['ID_Admin'],
        Name_Device: jsonData['Name_Device'],
        DateLogin: jsonData['DateLogin'],
        Name: jsonData['Name'],
        Tel: jsonData['Tel'],
        Position: jsonData['Position'],
        Image_URL: jsonData['Image_URL']);
  }

  void _LoadShopModule(dynamic jsonData) {
    jsonUser = jsonData;
    shopData = Shop(
        ID: jsonData['ID_Admin'],
        Name_Device: jsonData['Name_Device'],
        DateLogin: jsonData['DateLogin'],
        Name_Shop: jsonData['Name_Shop'],
        Name_Owner: jsonData['Name'],
        Tel: jsonData['Tel'],
        Address: jsonData['Address'],
        Image_URL: jsonData['Image_URL'],
        Email: jsonData['Email'],
        GPS: jsonData['GPS'],
        IP: jsonData['IP']);
  }
}
