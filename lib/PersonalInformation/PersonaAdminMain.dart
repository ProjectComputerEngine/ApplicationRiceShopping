import 'package:ApplicationRiceShopping/Admin/Widget/MenuNavigator.dart';
import 'package:flutter/material.dart';
import './Widget/TextWidget.dart';
import 'package:localstorage/localstorage.dart';
// import 'package:ApplicationRiceShopping/PersonalInformation/PersonalAdminMain.dart';

class PersonalAdminMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PersonalState();
  }
}

class PersonalState extends State<PersonalAdminMain> {
  LocalStorage localStorage;
  var AdminData;

  @override
  void initState() {
    localStorage = LocalStorage('userOnline');
    readAdminData();
    super.initState();
  }

  Future<void> readAdminData() async {
    AdminData = await localStorage.getItem('Admin');
    setState(() {

    });
  }

  @override
  void dispose() {
    localStorage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: menu(),
      body: Container(
        margin: MediaQuery.of(context).padding,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('res/Background.png'), fit: BoxFit.cover),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.01,
                  0,
                  MediaQuery.of(context).size.width * 0.01,
                  0),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 1,

              child: Column(children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    children: [
                      BackButton(
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Container(height: MediaQuery.of(context).size.height * 0.08),
                Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(AdminData['Image_URL']),
                    )),
                TextName(
                  SelfNameText: AdminData['Name'],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                TextUnderName(
                  FrontText: ('ตำแหน่ง'),
                  EndText: AdminData['Position'],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextUnderName(
                  FrontText: ('เบอร์โทร'),
                  EndText: AdminData['Tel'],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                ClickButton(
                  TextButton: ('แก้ไขโปรไฟล์'),
                ),

              ]),
            )
          ],
        ),
      ),
    );
  }
}