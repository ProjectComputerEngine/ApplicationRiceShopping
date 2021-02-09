import 'package:http/http.dart' as http;
import 'package:intl/intl.dart'; // for date format
// LocalStorage storage = LocalStorage('post');
void main(List<String> arguments) {
//2021-02-07 20:22:00.000

  var cm = ConnetionLogin();
  cm.Login('Dev1','1234',DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()) +"."+ DateTime.now().millisecond.toString(),'192.168.1.1','FlutterAppTest');
  // print(DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()) +"."+ DateTime.now().millisecond.toString());
}

class ConnetionLogin
{
 Future<String> Login(String username,String password,String time,String ip,String device) async {

   if(username != null && password != null ){
     print(username);
     print(password);

     print(DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()) +"."+ DateTime.now().millisecond.toString());

     var url = "http://25.86.3.193/Login/Login2Database.php?username="+username+"&password="+password+"&device="+device+"&time="+time+"&ip="+ip;
     print(url);
     var response = await http.get(url);
     if (response.statusCode == 200) {
       if (response.body.isEmpty) {
         print('Not Data !');
       }

       else {
         List<String> data = response.body.split('<br />');
         for (var i = 0; i < data.length; i++) {
           print(data[i]);
         }
       }
     }
     else
     {
       print('Request failed with status: ${response.statusCode}.');
     }
   }

  
  }

}


