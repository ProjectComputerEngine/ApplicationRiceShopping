import 'package:ApplicationRiceShopping/Admin/StorageMain.dart';
import 'package:flutter/material.dart';

class SpaceMessage extends StatelessWidget {
  const SpaceMessage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.01,
    );
  }
}

class MessageButtons extends StatelessWidget {
  final Color TimeColor;
  final Color NewNameColor;
  final Color NewColorText;
  final String NewMessgeText;
  final Color ChangeColorsCircle;
  final String nameUesr;
  final String lastmessage;
  final String time;
  final String imageurl;
  final Function gotoMessage;

  const MessageButtons({
    Key key,
    this.NewMessgeText,
    this.ChangeColorsCircle,
    this.NewColorText,
    this.NewNameColor,
    this.TimeColor,
    this.nameUesr,
    this.lastmessage,
    this.time,
    this.imageurl, this.gotoMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: gotoMessage,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: Color.fromRGBO(42, 64, 87, 20),
      child: Container(
        height: MediaQuery.of(context).size.width * 0.15,
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.01,
                  0.01,
                  MediaQuery.of(context).size.width * 0.01,
                  0.01),
              width: MediaQuery.of(context).size.width * 0.12,
              decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage('$imageurl'),
                  ),
                  color: Colors.white,
                  shape: CircleBorder()),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '$nameUesr',
                    style: TextStyle(color: NewNameColor, fontSize: 12),
                  ),
                  Text(
                    '$lastmessage',
                    style: TextStyle(color: NewColorText, fontSize: 10),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              width: MediaQuery.of(context).size.width * 0.35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '$time',
                    style: TextStyle(color: TimeColor, fontSize: 8),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.width * 0.055,
                    width: MediaQuery.of(context).size.width * 0.055,
                    decoration: ShapeDecoration(
                        color: ChangeColorsCircle, shape: CircleBorder()),
                    child: Text(
                      NewMessgeText,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 8,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
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
      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05,0,MediaQuery.of(context).size.width*0.01,0),
      alignment: Alignment.centerLeft,
      child: Text(
        'ข้อความ',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class BackButtons extends StatelessWidget {
  const BackButtons({
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

class LessRiceButton extends StatelessWidget {
  const LessRiceButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.18,
        width: MediaQuery.of(context).size.width * 0.35,
        color: Colors.white,

        child: FlatButton(
          //minWidth: MediaQuery.of(context).size.width*0.05,
            padding: EdgeInsets.symmetric(horizontal: 8),
            onPressed: () => {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.25,
                  color: Colors.pink,
                  child: Column(
                    children: [
                      Text(
                        'ข้าวน่ารักน่ารัก',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                      Text(
                        'จำนวน 555 กระสอบ',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}

class LessProductButton extends StatelessWidget {
  const LessProductButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))),
            child: FlatButton(
              onPressed: () => {},
              child: Text('สินค้าใกล้หมด'),
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}

class Space extends StatelessWidget {
  final double SpaceSize;

  const Space({
    Key key,
    this.SpaceSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: SpaceSize);
  }
}

class BoxFirstRow extends StatelessWidget {
  final String FirstLineFirstColumn;
  final String SeconeLineFirstColoumn;
  final String FirstlineSeconeColumn;
  final String SeconeLineSeconeColoumn;
  final Color FirstColumnColor;
  final Color SeconeColumnColor;

  const BoxFirstRow({
    Key key,
    this.FirstLineFirstColumn,
    this.SeconeLineFirstColoumn,
    this.FirstlineSeconeColumn,
    this.SeconeLineSeconeColoumn,
    this.FirstColumnColor,
    this.SeconeColumnColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
                color: FirstColumnColor,
                borderRadius: BorderRadius.circular(8)),
            height: MediaQuery.of(context).size.height * 0.16,
            width: MediaQuery.of(context).size.width * 0.43,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  FirstLineFirstColumn,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Text(
                  SeconeLineFirstColoumn,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.005,
          ),
          Container(
            decoration: BoxDecoration(
                color: SeconeColumnColor,
                borderRadius: BorderRadius.circular(8)),
            height: MediaQuery.of(context).size.height * 0.16,
            width: MediaQuery.of(context).size.width * 0.43,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(FirstlineSeconeColumn,
                    style: TextStyle(color: Colors.white, fontSize: 12)),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Text(SeconeLineSeconeColoumn,
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ],
            ),
          ),
        ],
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

class TextFirstLine extends StatelessWidget {
  const TextFirstLine({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'รายวัน',
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}


class SupButton extends StatelessWidget {
  const SupButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleButton(name: 'กราฟ',goto: (){
          },),
          CircleButton(name: 'รายงาน',goto: (){},),
          CircleButton(name: 'คลังสินค้า',goto: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> StorageMain()));
          },),
          CircleButton(name: 'เเผนที่',goto: (){},),
          CircleButton(name: 'ตั้งค่า',goto: (){},),

        ],
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final Function goto;
  final String name;
  const CircleButton({
    Key key, this.goto, this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        child: Column(
          children: [
            Container(
              decoration: ShapeDecoration(
                  color: Colors.white, shape: CircleBorder()),
              width: MediaQuery.of(context).size.width * 0.14,
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              child: Text(
                name,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
        onPressed: goto,
        minWidth: MediaQuery.of(context).size.width*0.05,
        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01,0,MediaQuery.of(context).size.width*0.01,0),
      ),
    );
  }
}