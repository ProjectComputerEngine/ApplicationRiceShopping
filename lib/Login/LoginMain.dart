import 'dart:convert';
import './Widget/TextWidget.dart';
import 'package:flutter/material.dart';
import './Style/Color.dart';
import 'package:http/http.dart';
import '../Admin/AdminMain.dart';
import 'package:intl/intl.dart';
import 'package:localstorage/localstorage.dart';

Connection conn = Connection('192.168.1.2:8080');

class LoginMain extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginMain> {
  LocalStorage localStorage;

  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  FocusNode usernameNode;
  FocusNode passwordNode;
  FocusNode loginNode;

  _LoginState() async {
    if (userController.text.isNotEmpty && passController.text.isNotEmpty) {
      var data = await conn.login(userController.text, passController.text,
          "Flutter App Test", "192.168.1.1");
      if (data != null) {
        if(data['ID_Admin'][0] != 'N'){

          localStorage.setItem('UserOnline', data);
          if(data['ID_Admin'][0] == 'A'){

          }
          else if(data['ID_Admin'][0] == 'S'){

          }
          else{

          }
        }
        else{
          _showMyDialog(context, 'กรุณาใส่บัญชีผู้ใช้งานเเละรหัสผ่าน\nให้ถูกต้อง');
        }
      } else {
       // _showMyDialog(context, 'เกิดปัญหาด้านเครือข่าย\nกรุณาลองใหม่ภายหลัง');
      }
    }
    else {
      _showMyDialog(context, 'กรุณาใส่บัญชีผู้ใช้งานเเละรหัสผ่าน\nให้ครบถ้วน');
    }
  }

  @override
  void initState() {
    usernameNode = FocusNode();
    passwordNode = FocusNode();
    loginNode = FocusNode();
    localStorage = LocalStorage('User');
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
              TextEvent(
                text: '> ข้าม',
                Goto: () => {},
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

class Admin {
  final String ID;
  final String Name_Device;
  final String DateLogin;
  final String Name;
  final String Tel;
  final String Position;
  final String Image_URL;

  Admin(this.ID, this.Name_Device, this.DateLogin, this.Name, this.Tel,
      this.Position, this.Image_URL);
}

class Shop {
  final String ID;
  final String Name_Device;
  final String DateLogin;
  final String Name_Shop;
  final String Name_Owner;
  final String Tel;
  final String Address;
  final String Image_URL;
  final String Email;
  final String Message_Box;

  Shop(
      this.ID,
      this.Name_Device,
      this.DateLogin,
      this.Name_Shop,
      this.Name_Owner,
      this.Tel,
      this.Address,
      this.Image_URL,
      this.Email,
      this.Message_Box);
}

class Connection {
  final String SERVER;
  Admin adminData;
  Shop shopData;

  Connection(this.SERVER);

  Future<List<dynamic>> readMessage(String messageID) async {
    String url = "http://" + SERVER + "/Inbox/inbox.php?messageID=MS00000000";
    var response = await get(url);
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var data = jsonDecode(response.body);
        return data;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<dynamic> login(
      String username, String password, String Device, String IP) async {
    try {
      String url = "http://" +
          SERVER +
          "/login/Login2Database.php?username=" +
          username +
          "&password=" +
          password +
          "&device=" +
          Device +
          "&time=" +
          DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()) +
          "." +
          DateTime
              .now()
              .millisecond
              .toString() +
          "&ip=" +
          IP;
      var response = await get(url);
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          var data = jsonDecode(response.body);
          return data;
        } else {
          return null;
        }
      } else {
        return null;
      }
    }
    catch (error) {
      print('$error');
  }
  }

}

Future<void> _showMyDialog(BuildContext context,String dialogMessage) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(dialogMessage),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('ยืนยัน'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
