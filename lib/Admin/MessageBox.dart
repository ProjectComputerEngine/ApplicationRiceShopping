import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
class MainMessage extends StatefulWidget {
  final String inbox;
  final String IDInbox;
  final String IDSender;
  MainMessage({this.inbox, this.IDInbox, this.IDSender});

  @override
  _MainMessageState createState() => _MainMessageState();
}

class _MainMessageState extends State<MainMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.inbox}'),
        ),
        body: Container(
          child: Column(children: [
            Container(child: Flexible(child: ListView()),),
            Container(child: TextField(),decoration: BoxDecoration(color: Colors.red),),
          ],),
        )
    );
  }
}
Future SendMessage({String message, String IDInbox, String IDSender}) async {
  String url = "http://"+"192.168.1.2:8080"+"/Inbox/sendmessage.php?idinbox="+IDInbox+"&message="+message+"&id="+IDSender+"&time="+DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()) +"."+ DateTime.now().millisecond.toString();
  var response = await get(url);
  if(response.statusCode == 200){
    if(response.body.isEmpty){
      print('YES');
    }
    else{
      print('Error');
    }
  }
}