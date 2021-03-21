import 'package:flutter/material.dart';
class AcessToStatus extends StatelessWidget {
  final String TextStatusINButton;
  const AcessToStatus({
    Key key, this.TextStatusINButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0,0,MediaQuery.of(context).size.width*0,0),
        height: MediaQuery.of(context).size.height*0.05,
        width: MediaQuery.of(context).size.width*0.9,
        child: FlatButton(
          onPressed: ()=>{},
          child: Text(TextStatusINButton,style: TextStyle(fontSize: 10),),
        ),


      ),
    );
  }
}

class StatusOnBILL extends StatelessWidget {
  const StatusOnBILL({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('รอดำเนินการ',style: TextStyle(fontSize: 10,color: Colors.red),),
      alignment: Alignment.centerRight,
      width: MediaQuery.of(context).size.width*0.68,
    );
  }
}

class StatusOfBill extends StatelessWidget {
  final String TypeOfStatus;
  const StatusOfBill({
    Key key, this.TypeOfStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(TypeOfStatus,style: TextStyle(fontSize: 10),),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width*0.2,
    );
  }
}

class TitleBox extends StatelessWidget {
  final String TextTitle;
  const TitleBox({
    Key key, this.TextTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(6, 243, 186, 10),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8),
              topLeft: Radius.circular(8))),
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0,
          0,
          MediaQuery.of(context).size.width * 0,
          0),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.05,
      child: Text(TextTitle),
    );
  }
}

class DateAndTime extends StatelessWidget {
  final String DateANDTimeFont;

  const DateAndTime({
    Key key,
    this.DateANDTimeFont,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
          DateANDTimeFont,
          style: TextStyle(fontSize: 10, color: Colors.black),
        ));
  }
}

class NameText extends StatelessWidget {
  const NameText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
          'ร้านขายข้าวคุญสมหญิง',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ));
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
