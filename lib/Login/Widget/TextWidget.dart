import 'package:flutter/material.dart';
// ------------------     Text Event        -----------------------
class TextEvent extends StatelessWidget {
  const TextEvent({
    Key key,
    @required this.text,
    @required this.Goto,
  }) : super(key: key);

  final String text;
  final Function Goto;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.02, 0,MediaQuery.of(context).size.height * 0.03),
      child: Container(
        alignment: Alignment.topRight,
        child: FlatButton(
          minWidth: 1,
          child: Text(text,style: TextStyle(color: Colors.white)),
          onPressed: Goto,
        ),
      ),
      alignment: Alignment.topRight,
    );
  }
}
// ------------------     Button event       -----------------------
class ButtonAccessSystem extends StatelessWidget {
  final Function Goto;
  final FocusNode mynode;
  const ButtonAccessSystem({
    Key key, this.Goto, this.mynode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      // height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: FlatButton(
        focusNode: mynode,
        onPressed: Goto,
        child: Container(
          alignment: Alignment.center,
          child: Text('เข้าสู่ระบบ'),
        ),
      ),
    );
  }
}
// ------------------     Button google and line and facebook Event        -----------------------
class ButtonAccess extends StatelessWidget {
  final String AccessText;
  final Color ButColor;
  final Function Goto;

  const ButtonAccess({
    Key key,
    this.AccessText,
    this.ButColor, this.Goto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ButColor, borderRadius: BorderRadius.circular(8)),
      child: FlatButton(
        onPressed: Goto,
        // height: MediaQuery.of(context).size.height * 0.08,
        child: Row(children: [
          Container(
            child: Icon(Icons.search),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Text(
            AccessText,
            style: TextStyle(color: Colors.white),
          )
        ]),
      ),
    );
  }
}
// ------------------     'OR'        -----------------------
class TextOr extends StatelessWidget {
  const TextOr({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 2,
            padding: EdgeInsets.symmetric(vertical: 5),
            width: MediaQuery.of(context).size.width * 0.2,
            color: Colors.white,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          Container(
            child: Text(
              'OR',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          Container(
            height: 2,
            padding: EdgeInsets.symmetric(vertical: 5),
            width: MediaQuery.of(context).size.width * 0.2,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
// ------------------      2 text event      -----------------------
class TextRegis extends StatelessWidget {
  final Function GotoRegister;
  final Function GotoFogon;
  const TextRegis({
    Key key, this.GotoRegister, this.GotoFogon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: FlatButton(
              onPressed: GotoRegister,
              child: Text(
                'ลงทะเบียน',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.32,
          ),
          Container(
            child: FlatButton(
              onPressed: GotoFogon,
              child: Text(
                'ลืมรหัสผ่าน',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
// ------------------    spans       -----------------------
class Space extends StatelessWidget {
  final double EmtySpace;

  const Space({
    Key key,
    this.EmtySpace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: EmtySpace,
    );
  }
}
// ------------------     text input       -----------------------
class TextAccount extends StatelessWidget {
  final IconData IconCheng;
  final TextEditingController controller;
  final FocusNode nextnode;
  final FocusNode mynode;
  final String hintext;
  final bool autofocus;
  final bool obsure;
  const TextAccount({
    Key key,
    this.IconCheng,
    this.controller, this.nextnode, this.mynode, this.hintext, this.autofocus, this.obsure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        obscureText: obsure,
        focusNode: mynode,
        autofocus: autofocus,
        onEditingComplete: ()=>{nextnode.requestFocus()},
        controller: controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          hintText: hintext,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          prefixIcon: Icon(IconCheng,),
        ),
      ),
    );
  }
}
// ------------------     Logo        -----------------------
class ImageLogo extends StatelessWidget {
  const ImageLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'res/logo.png',
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.5,
      ),
    );
  }
}

// ------------------     dialog        -----------------------
Future<void> showMyDialog(BuildContext context,String dialogMessage) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('ถุงข้าว'),
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