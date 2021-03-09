import 'package:flutter/material.dart';
import './Widget/TextWidget.dart';
import './Style/Color.dart';
import './Backend/Login.dart';
import 'package:ApplicationRiceShopping/Admin/ChatMain.dart';
import 'package:ApplicationRiceShopping/Shop/ShopMain.dart';
import 'package:ApplicationRiceShopping/Admin/StorageMain.dart';
class MainLogin extends StatefulWidget {
  @override
  _MainLoginState createState() => _MainLoginState();
}

class _MainLoginState extends State<MainLogin> {
  // LocalStorage localStorage;
  Login login;
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  FocusNode usernameNode;
  FocusNode passwordNode;
  FocusNode loginNode;

  _LoginState() async {
    if (userController.text.isNotEmpty && passController.text.isNotEmpty) {
      await login.Login2Database(
          username: userController.text,
          password: passController.text,
          device: 'FlutterTest',
          ip: '192.168.1.1',
          context: context);
      if(login.adminData!=null){
          Navigator.push(context, MaterialPageRoute(builder: (context) =>StorageMain()));
      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: (context) =>MainShop()));
      }
    } else {
      showMyDialog(context, 'กรุณาใส่บัญชีผู้ใช้งานเเละรหัสผ่าน\nให้ครบถ้วน');
    }
  }

  @override
  void initState() {
    usernameNode = FocusNode();
    passwordNode = FocusNode();
    loginNode = FocusNode();
    login = Login();
    // localStorage = LocalStorage('User');
    super.initState();
  }

  @override
  void dispose() {
    usernameNode.dispose();
    passwordNode.dispose();
    loginNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorLogin.bg,
      body: Container(
        margin: MediaQuery.of(context).padding,
        color: ColorLogin.bg,
        child: Padding(
          padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05,
              0, MediaQuery.of(context).size.width * 0.05, 0),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // TextEvent(
              //   text: '> ข้าม',
              //   Goto: () => {},
              // ),
              Space(
                EmtySpace: MediaQuery.of(context).size.height * 0.05,
              ),
              ImageLogo(),
              Space(
                EmtySpace: MediaQuery.of(context).size.height * 0.05,
              ),
              TextAccount(
                IconCheng: Icons.account_circle,
                nextnode: passwordNode,
                mynode: usernameNode,
                obsure: false,
                autofocus: true,
                hintext: 'บัญชีผู้ใช้งาน',
                controller: userController,
              ),
              Space(
                EmtySpace: MediaQuery.of(context).size.height * 0.02,
              ),
              TextAccount(
                IconCheng: Icons.lock,
                nextnode: loginNode,
                mynode: passwordNode,
                obsure: true,
                autofocus: false,
                hintext: 'รหัสผ่าน',
                controller: passController,
              ),
              Space(
                EmtySpace: MediaQuery.of(context).size.height * 0.02,
              ),
              ButtonAccessSystem(
                Goto: () {
                  _LoginState();
                },
                mynode: loginNode,
              ),
              Space(
                EmtySpace: MediaQuery.of(context).size.height * 0.01,
              ),
              TextRegis(
                GotoFogon: () => {},
                GotoRegister: () => {},
              ),
              Space(
                EmtySpace: MediaQuery.of(context).size.height * 0.03,
              ),
              TextOr(),
              Space(
                EmtySpace: MediaQuery.of(context).size.height * 0.05,
              ),
              ButtonAccess(
                  Goto: () => {},
                  AccessText: 'เข้าสู่ระบบด้วย Google',
                  ButColor: Color.fromRGBO(245, 9, 9, 10)),
              Space(EmtySpace: MediaQuery.of(context).size.height * 0.02),
              ButtonAccess(
                  Goto: () => {},
                  AccessText: 'เข้าสู่ระบบด้วย Facebook',
                  ButColor: Color.fromRGBO(66, 103, 178, 10)),
              Space(EmtySpace: MediaQuery.of(context).size.height * 0.02),
              ButtonAccess(
                Goto: () => {},
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
