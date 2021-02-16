import 'package:flutter/material.dart';
class NavigationButton extends StatelessWidget {
  final Icon BarIcon;
  const NavigationButton({
    Key key, this.BarIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(shape: CircleBorder()),
      child: FlatButton(onPressed: () => {}, child: BarIcon,minWidth: MediaQuery.of(context).size.width * 0,),


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
            minWidth: MediaQuery.of(context).size.width*0.05,
            padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0,0,MediaQuery.of(context).size.width*0,0),
            onPressed: () => {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
          CircleButton(),
          CircleButton(),
          CircleButton(),
          CircleButton(),
          CircleButton(),

        ],
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key key,
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
                'กราฟ',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          ],
        ),
        onPressed: () => {},
        minWidth: MediaQuery.of(context).size.width*0.05,
        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01,0,MediaQuery.of(context).size.width*0.01,0),
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
