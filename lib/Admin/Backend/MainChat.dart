import 'dart:convert';
import 'package:flutter/material.dart';
import 'CheckBockBocWidget.dart';
import 'package:web_socket_channel/io.dart';
import 'MessageModule.dart';
import 'package:web_socket_channel/status.dart' as status;


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChatBoxMain(),
    );
  }
}

class ChatBoxMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChatBoxStat();
  }
}

class ChatBoxStat extends State<ChatBoxMain> {
  Message message;

  var resBody = {};
  IOWebSocketChannel channel;
  TextEditingController messageController;

  List<Widget> messageList = [];

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  void initState() {
    channel = IOWebSocketChannel.connect('ws://192.168.43.152:8089');
    messageController = TextEditingController();
    super.initState();
  }

  Future<void> sendmessage() async {
    try {
      if (messageController.text.isNotEmpty) {
        message = Message(
            message: messageController.text,
            imageURL: 'https://data.whicdn.com/images/341417835/original.jpg',
            time: '2021-03-09 01:41:00:000',
            ID: 'S0',
            name: 'คนที่ 1');
        resBody['message'] = message.message;
        resBody['name'] = message.name;
        resBody['imageURL'] = message.imageURL;
        resBody['imageURL'] = message.time;
        resBody['ID'] = message.ID;
        var jsonData = jsonEncode(resBody);
        // message.add(AdminText(message: messageController.text,));
        channel.sink.add(jsonData);
        // channel.sink.close(status.goingAway);
      }
    } catch (error) {
      print(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 50, 50, 10),
      body: Container(
        margin: MediaQuery.of(context).padding,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              color: Color.fromRGBO(32, 50, 50, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButtons(),
                  NameText(name: 'Test'),
                  CallButton(),
                  SettingButton(),
                ],
              ),
            ),
            Flexible(
              child: StreamBuilder(
                  stream: channel.stream,
                  builder: (context, snaphost) {

                    if (snaphost.hasData) {
                      var data = jsonDecode(snaphost.data);
                      if(snaphost.connectionState == ConnectionState.active){
                        var data = jsonDecode(snaphost.data);
                        messageList.add(AdminText(message: data['message'],));
                      }
                    } else {}
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return messageList[index];
                      },
                      itemCount: messageList.length,
                    );
                  }),
            ),
            Container(
              color: Colors.black38,
              height: MediaQuery.of(context).size.height * 0.075,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PhotoButton(),
                  AccessField(
                    messageController: messageController,
                  ),
                  SendButton(send: () => sendmessage()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
