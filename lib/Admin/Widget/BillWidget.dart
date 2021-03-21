import 'package:flutter/material.dart';
class PictureProfile extends StatelessWidget {
  final String url;
  const PictureProfile({
    Key key, this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration( shape:CircleBorder(),color:Colors.white),
      height: MediaQuery.of(context).size.height*0.125,
      width: MediaQuery.of(context).size.width*0.125,
        child: Image.network('https://d2pa5gi5n2e1an.cloudfront.net/th/images/article/10890_TH/1.jpg'),
    );
  }
}

class TextBillButton extends StatelessWidget {
  final Function SeleteStatus;
  final String TextInButtons;
  const TextBillButton({
    Key key, this.TextInButtons, this.SeleteStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: MediaQuery.of(context).size.height*0.05,
        width: MediaQuery.of(context).size.width*0.275,
        color: Colors.white,
        child: FlatButton(
          onPressed: SeleteStatus,
          child: Text(TextInButtons,style: TextStyle(fontSize: 12),),
        ),
      ),
    );
  }
}


class NavigationButton extends StatelessWidget {
  final Icon BarIcon;
  final String BarText;

  const NavigationButton({
    Key key,
    this.BarIcon,
    this.BarText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(shape: CircleBorder()),
      child: FlatButton(
        onPressed: () => {},
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            BarIcon,
            Container(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              BarText,
              style: TextStyle(fontSize: 8),
            )
          ],
        ),
        minWidth: MediaQuery.of(context).size.width * 0,
      ),
    );
  }
}



class BacksButton extends StatelessWidget {
  const BacksButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: FlatButton(
        minWidth: MediaQuery.of(context).size.width * 0,
        onPressed: () => {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 15,
        ),
      ),
    );
  }
}

class MassageTitle extends StatelessWidget {
  const MassageTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        'คำสั่งซื้อ',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
