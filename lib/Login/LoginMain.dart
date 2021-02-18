import './Widget/TextWidget.dart';
import 'package:flutter/material.dart';
import './Style/Color.dart';

class LoginMain extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginMain> {
  FocusNode usernameNode;
  FocusNode passwordNode;
  FocusNode loginNode;

  @override
  void initState() {
    usernameNode = FocusNode();
    passwordNode = FocusNode();
    loginNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorLogin.bg,
      body: Container(
        margin: MediaQuery.of(context).padding,
        color: ColorLogin.bg,
        child: Padding(
          padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05, 0,
              MediaQuery.of(context).size.width * 0.05, 0),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              TextEvent(
                text: '> ข้าม',
                Goto: () => {},
              ),
              ImageLogo(),
              Space(
                EmtySpace: MediaQuery.of(context).size.height * 0.05,
              ),
              TextAccount(IconCheng: Icons.account_circle,nextnode: passwordNode , mynode: usernameNode,autofocus: true,hintext: 'บัญชีผู้ใช้งาน',),
              Space(
                EmtySpace: MediaQuery.of(context).size.height * 0.02,
              ),
              TextAccount(IconCheng: Icons.lock,nextnode: loginNode,mynode: passwordNode,autofocus: false,hintext: 'รหัสผ่าน',),
              Space(
                EmtySpace: MediaQuery.of(context).size.height * 0.02,
              ),
              ButtonAccessSystem(Goto: ()=>{},mynode: loginNode,),
              TextRegis(),
              Space(
                EmtySpace: MediaQuery.of(context).size.height * 0.03,
              ),
              TextOr(),
              Space(
                EmtySpace: MediaQuery.of(context).size.height * 0.05,
              ),
              ButtonAccess(
                  Goto: ()=>{},
                  AccessText: 'เข้าสู่ระบบด้วย Google',
                  ButColor: Color.fromRGBO(245, 9, 9, 10)),
              Space(EmtySpace: MediaQuery.of(context).size.height * 0.02),
              ButtonAccess(
                  Goto: ()=>{},
                  AccessText: 'เข้าสู่ระบบด้วย Facebook',
                  ButColor: Color.fromRGBO(66, 103, 178, 10)),
              Space(EmtySpace: MediaQuery.of(context).size.height * 0.02),
              ButtonAccess(
                Goto: ()=>{},
                AccessText: 'เข้าสู่ระบบด้วย Line',
                ButColor: Color.fromRGBO(3, 195, 2, 10),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

