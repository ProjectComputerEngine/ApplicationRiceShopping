import 'package:flutter/material.dart';
import './Login/LoginMain.dart';
import './Admin/AdminMain.dart';
import './ChatBox/ChatMainBox.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home:LoginMain(),
    );
  }
}
