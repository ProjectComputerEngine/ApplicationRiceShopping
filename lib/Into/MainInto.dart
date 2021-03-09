import 'package:flutter/material.dart';
import '../Login/LoginMain.dart';
import '../Connection.dart';
import '../Login/Widget/TextWidget.dart';
class FristPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FristPage> {

  @override
  initState() {
    timerLinkPage(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: Center(child: Container(child:Image.asset('res/logo.png') ,))
    );
  }
}

Future timerLinkPage(BuildContext context) {
  return Future.delayed(Duration(seconds: 3), () {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainLogin()));
  });
}
