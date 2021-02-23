import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'MessageBox.dart';

class MainInbox extends StatefulWidget {
  @override
  _MainInboxState createState() => _MainInboxState();
}

class _MainInboxState extends State<MainInbox> {
  int i = 0;
  StreamController inbox;
  Stream stream;

  void count() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      var inboX = await Inbox();
      print('Inbox render');
      inbox.add(inboX);
    });
  }


  @override
  void initState() {
    inbox = StreamController(onListen: count);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
      ),
      body: Container(
        child: StreamBuilder(
          stream: inbox.stream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            List<dynamic> inbox;
            if (snapshot.hasData) {
              inbox = snapshot.data;
              return ListView.builder(
                itemBuilder: (conxt, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MainMessage(inbox: inbox[index]['Name'],IDInbox:inbox[index]['ID_Message'],IDSender: 'A000000',),
                          ));
                    },
                    title: Text('${inbox[index]['Name']}'),
                    subtitle: Text('${inbox[index]['Message_Last']}'),
                    trailing: Column(
                      children: [
                        Container(
                          child: Text('${inbox[index]['NewShop']}'),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          padding: EdgeInsets.all(5),
                        ),
                        Container(
                          child: Text('${inbox[index]['Update_Lasttime']}'),
                        )
                      ],
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    leading: Container(
                      child: CircleAvatar(
                        maxRadius: MediaQuery.of(context).size.width * 0.06,
                        minRadius: MediaQuery.of(context).size.width * 0.05,
                        backgroundImage:
                            NetworkImage('${inbox[index]['Image_URL']}'),
                      ),
                    ),
                  );
                },
                itemCount: inbox.length,
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

Future<List<dynamic>> Inbox() async {
  String url = "http://" + "192.168.1.2:8080" + "/Inbox/messageinbox.php";
  var response = await get(url);
  if (response.statusCode == 200) {
    List<dynamic> Inbox = jsonDecode(response.body);
    return Inbox;
  } else {
    return null;
  }
}
