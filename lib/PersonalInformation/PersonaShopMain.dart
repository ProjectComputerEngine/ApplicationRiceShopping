import 'package:ApplicationRiceShopping/Login/LoginMain.dart';
import 'package:ApplicationRiceShopping/Shop/Widget/MenuNavigator.dart';
import 'package:flutter/material.dart';
import './Widget/TextWidget.dart';
import 'package:localstorage/localstorage.dart';
import './Backend/Function.dart';

class PersonalShopMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PersonalState();
  }
}

class PersonalState extends State<PersonalShopMain> {
  LocalStorage localStorage;

  // var ShopData;

  @override
  void initState() {
    localStorage = LocalStorage('userOnline');
    super.initState();
  }

  Future<dynamic> Logout() async {
    localStorage.deleteItem('Shop').then((value) => {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainLogin()),
          ),
        });
  }

  @override
  void dispose() {
    print('localStorage Dispose !');
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
            FutureBuilder(
                future: localStorage.ready,
                builder: (context, snapshost) {
                  if (snapshost.hasData) {
                    var shop = localStorage.getItem('Shop');
                    localStorage.deleteItem('Shop');
                    return Container(
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.01,
                          0,
                          MediaQuery.of(context).size.width * 0.01,
                          0),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 1,
                      color: Colors.black12,
                      child: Column(children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Row(
                            children: [
                              BackButtons(),
                              Flexible(child: Container()),
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: IconButton(
                                    onPressed: () =>Logout(),
                                    icon: Icon(Icons.exit_to_app,
                                        color: Colors.white),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height * 0.08),
                        Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(shop['Image_URL']),
                            )),
                        TextName(
                          SelfNameText: shop['Name_Shop'],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        TextUnderName(
                          FrontText: ('ชื่อเจ้าของ'),
                          EndText: shop['Name'],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        TextUnderName(
                          FrontText: ('เบอร์โทร'),
                          EndText: shop['Tel'],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        TextUnderName(
                          FrontText: ('อีเมล'),
                          EndText: shop['Email'],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        TextUnderName(
                          FrontText: ('GPS'),
                          EndText: shop['GPS'],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        PlaceText(
                          TextPLACE: shop['Address'],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                        ClickButton(
                          TextButton: ('แก้ไขโปรไฟล์'),
                        ),
                      ]),
                    );
                  } else if (snapshost.hasError) {
                    return Center(
                      child: Text('Error !!!'),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })
          ],
        ),
      ),
    );
  }
}
