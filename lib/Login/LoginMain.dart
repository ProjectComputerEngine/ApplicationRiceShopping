import 'package:ApplicationRiceShopping/PersonalInformation/PersonaShopMain.dart';
import 'package:flutter/material.dart';
import './Widget/TextWidget.dart';
import './Style/Color.dart';
import './Backend/Login.dart';
import 'package:minimize_app/minimize_app.dart';
import 'package:localstorage/localstorage.dart';
import '../Admin/AdminMain.dart';
class MainLogin extends StatefulWidget {
  @override
  _MainLoginState createState() => _MainLoginState();
}

class _MainLoginState extends State<MainLogin> {
  LocalStorage localStorage;
  Login login;
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  FocusNode usernameNode;
  FocusNode passwordNode;
  FocusNode loginNode;

  @override
  void initState() {
    localStorage = LocalStorage('userOnline');
    usernameNode = FocusNode();
    passwordNode = FocusNode();
    loginNode = FocusNode();
    login = Login();
    super.initState();
  }

  _LoginState() async {
    // localStorage.deleteItem('Shop');
    // localStorage.deleteItem('Admin');
    if (userController.text.isNotEmpty && passController.text.isNotEmpty) {
      await login.Login2Database(
          username: userController.text,
          password: passController.text,
          device: 'FlutterTest',
          ip: '192.168.1.1',
          context: context);
      if(login.adminData!=null){
        login.adminData = null;
         await localStorage.setItem('Admin', login.jsonUser);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>AdminMain()));
      }
      else if (login.shopData != null){
        login.shopData = null;
        await localStorage.setItem('Shop', login.jsonUser);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>PersonalShopMain()));
      }
      else {

      }
    } else {
      showMyDialog(context, 'กรุณาใส่บัญชีผู้ใช้งานเเละรหัสผ่าน\nให้ครบถ้วน');
    }
  }

  @override
  void dispose() {
    // localStorage.dispose();
    usernameNode.dispose();
    passwordNode.dispose();
    loginNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:()=>MinimizeApp.minimizeApp(),
      child: Scaffold(

        backgroundColor: ColorLogin.bg,
        body: FutureBuilder(
          future: localStorage.ready,
          builder:(context,snaphost) {
            if(snaphost.hasData) {
              return Container(
                margin: MediaQuery
                    .of(context)
                    .padding,
                color: ColorLogin.bg,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(MediaQuery
                      .of(context)
                      .size
                      .width * 0.05,
                      0, MediaQuery
                          .of(context)
                          .size
                          .width * 0.05, 0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      // TextEvent(
                      //   text: '> ข้าม',
                      //   Goto: () => {},
                      // ),
                      Space(
                        EmtySpace: MediaQuery
                            .of(context)
                            .size
                            .height * 0.05,
                      ),
                      ImageLogo(),
                      Space(
                        EmtySpace: MediaQuery
                            .of(context)
                            .size
                            .height * 0.05,
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
                        EmtySpace: MediaQuery
                            .of(context)
                            .size
                            .height * 0.02,
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
                        EmtySpace: MediaQuery
                            .of(context)
                            .size
                            .height * 0.02,
                      ),
                      ButtonAccessSystem(
                        Goto: () {
                          _LoginState();
                        },
                        mynode: loginNode,
                      ),
                      Space(
                        EmtySpace: MediaQuery
                            .of(context)
                            .size
                            .height * 0.01,
                      ),
                      TextRegis(
                        GotoFogon: () => {},
                        GotoRegister: () => {},
                      ),
                      Space(
                        EmtySpace: MediaQuery
                            .of(context)
                            .size
                            .height * 0.03,
                      ),
                      TextOr(),
                      Space(
                        EmtySpace: MediaQuery
                            .of(context)
                            .size
                            .height * 0.05,
                      ),
                      ButtonAccess(
                          Goto: () => {},
                          AccessText: 'เข้าสู่ระบบด้วย Google',
                          ButColor: Color.fromRGBO(245, 9, 9, 10)),
                      Space(EmtySpace: MediaQuery
                          .of(context)
                          .size
                          .height * 0.02),
                      ButtonAccess(
                          Goto: () => {},
                          AccessText: 'เข้าสู่ระบบด้วย Facebook',
                          ButColor: Color.fromRGBO(66, 103, 178, 10)),
                      Space(EmtySpace: MediaQuery
                          .of(context)
                          .size
                          .height * 0.02),
                      ButtonAccess(
                        Goto: () => {},
                        AccessText: 'เข้าสู่ระบบด้วย Line',
                        ButColor: Color.fromRGBO(3, 195, 2, 10),
                      ),
                    ],
                  ),
                ),
              );
            }
            else{
              return CircularProgressIndicator();
            }
          }
        ),
      ),
    );
  }
}
