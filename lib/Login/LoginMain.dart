import 'package:flutter/material.dart';
import './Style/Color.dart' ;
class LoginMain extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorLogin.bg,
      body: LoginContant(),
    );
  }
}

class LoginContant extends StatelessWidget {
  const LoginContant({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: MediaQuery.of(context).padding,
      color: ColorLogin.bg,
      child: Padding(
        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.1, 0,
            MediaQuery.of(context).size.width * 0.1, 0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            TextEvent(
              text: '> ข้าม',
              Goto: () => {},
            )
          ],
        ),
      ),
    );
  }
}

class TextEvent extends StatelessWidget {
  const TextEvent({
    Key key,
    @required this.text,
    @required this.Goto,
  }) : super(key: key);

  final String text;
  final Function Goto;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        minWidth: 1,
        child: Text(text,style: TextStyle(color: Colors.white),),
        onPressed: Goto,
      ),
      alignment: Alignment.topRight,
    );
  }
}
