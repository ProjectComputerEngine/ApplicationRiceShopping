import 'package:flutter/material.dart';
class SaveBUTTON extends StatelessWidget {
  const SaveBUTTON({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(4)),
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.width * 0.1,
        child: FlatButton(
            onPressed: ()=>{},
            child: Text(
              'บันทึก',
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}

class SpaceText extends StatelessWidget {
  const SpaceText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.01,
    );
  }
}

class SizePacketText extends StatelessWidget {
  const SizePacketText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05, 0,
          MediaQuery.of(context).size.width * 0.01, 0),
      child: Text('ขนาดบรรจุภัญฑ์'),
    );
  }
}

class NoteTextField extends StatelessWidget {
  const NoteTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.22,
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.05,
                0,
                MediaQuery.of(context).size.width * 0.01,
                0),
            child: Text('หมายเหตุ'),
          ),
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.62,
              child: TextField(
                maxLines: 4,
                textAlign: TextAlign.start,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.02,
                      0.02,
                      MediaQuery.of(context).size.width * 0.01,
                      0.02),
                  hintText: (''),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class NavigationButton extends StatelessWidget {
  final String BarText;
  final Icon BarIcon;

  const NavigationButton({
    Key key, this.BarIcon, this.BarText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: ShapeDecoration(shape: CircleBorder()),
      child: FlatButton(onPressed: () => {},

        child: Column(children: [
          Container(height: MediaQuery.of(context).size.height*0.01,),
          BarIcon,
          Container(height: MediaQuery.of(context).size.height*0.01,),
          Text(BarText,style: TextStyle(fontSize: 8),)
        ],),
        minWidth: MediaQuery.of(context).size.width * 0,),



    );
  }
}
class RecommendTextField extends StatelessWidget {
  const RecommendTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.22,
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.05,
                0,
                MediaQuery.of(context).size.width * 0.01,
                0),
            child: Text('คำแนะนำ'),
          ),
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.62,
              child: TextField(
                maxLines: 4,
                textAlign: TextAlign.start,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.02,
                      0.02,
                      MediaQuery.of(context).size.width * 0.01,
                      0.02),
                  hintText: (''),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlaceTextField extends StatelessWidget {
  const PlaceTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.26,
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.05,
                0,
                MediaQuery.of(context).size.width * 0.01,
                0),
            child: Text('สถานที่ผลิต'),
          ),
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.56,
              child: TextField(
                maxLines: 5,
                textAlign: TextAlign.start,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.02,
                      0.02,
                      MediaQuery.of(context).size.width * 0.01,
                      0.02),
                  hintText: (''),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductionDateTextField extends StatelessWidget {
  const ProductionDateTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.18,
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.05,
                0,
                MediaQuery.of(context).size.width * 0.01,
                0),
            child: Text('วันผลิต'),
          ),
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.65,
              child: TextField(
                textAlign: TextAlign.start,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.02,
                      0.02,
                      MediaQuery.of(context).size.width * 0.01,
                      0.02),
                  hintText: (''),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IncressProductTextField extends StatelessWidget {
  const IncressProductTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.18,
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.05,
                0,
                MediaQuery.of(context).size.width * 0.01,
                0),
            child: Text('จำนวน'),
          ),
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              child: TextField(
                textAlign: TextAlign.center,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  hintText: (''),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.01,
                0,
                MediaQuery.of(context).size.width * 0.01,
                0),
            child: Text('กระสอบ'),
          )
        ],
      ),
    );
  }
}

class IncressProductText extends StatelessWidget {
  const IncressProductText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05, 0,
          MediaQuery.of(context).size.width * 0.01, 0),
      child: Text('เพิ่มจำนวนสินค้าภายในโกดัง'),
    );
  }
}

class SizePacketTextField extends StatelessWidget {
  const SizePacketTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.05,
                0,
                MediaQuery.of(context).size.width * 0.01,
                0),
          ),
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.15,
              child: TextField(
                textAlign: TextAlign.center,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  hintText: (''),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.1,
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.01,
                0,
                MediaQuery.of(context).size.width * 0.01,
                0),
            child: Text('ซม.'),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.05,
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.01,
                0,
                MediaQuery.of(context).size.width * 0.01,
                0),
            child: Text('x'),
          ),
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.15,
              child: TextField(
                textAlign: TextAlign.center,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  hintText: (''),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.1,
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.01,
                0,
                MediaQuery.of(context).size.width * 0.01,
                0),
            child: Text('ซม.'),
          ),
        ],
      ),
    );
  }
}

class WeightTextField extends StatelessWidget {
  const WeightTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.18,
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.05,
                0,
                MediaQuery.of(context).size.width * 0.01,
                0),
            child: Text('น้ำหนัก'),
          ),
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              child: TextField(
                textAlign: TextAlign.center,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  hintText: (''),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.01,
                0,
                MediaQuery.of(context).size.width * 0.01,
                0),
            child: Text('กิโลกรัม'),
          )
        ],
      ),
    );
  }
}

class PriceTextField extends StatelessWidget {
  const PriceTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.15,
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.05,
                0,
                MediaQuery.of(context).size.width * 0.01,
                0),
            child: Text('ราคา'),
          ),
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: TextField(
                textAlign: TextAlign.center,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  hintText: (''),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.01,
                0,
                MediaQuery.of(context).size.width * 0.01,
                0),
            child: Text('บาท/กระสอบ'),
          )
        ],
      ),
    );
  }
}

class ProductNameTextField extends StatelessWidget {
  const ProductNameTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.05,
                0,
                MediaQuery.of(context).size.width * 0.01,
                0),
          ),
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: TextField(
                textAlign: TextAlign.center,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  hintText: ('ชื่อข้าว'),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.1,
          )
        ],
      ),
    );
  }
}

class SpaceHeight extends StatelessWidget {
  const SpaceHeight({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.005,
    );
  }
}

class TwoImageBox extends StatelessWidget {
  const TwoImageBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        alignment: Alignment.topLeft,
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),

      ),
    );
  }
}

class SpaceWidth extends StatelessWidget {
  const SpaceWidth({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.005,
    );
  }
}

class LargeImageBox extends StatelessWidget {
  const LargeImageBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: FlatButton(
          child: Icon(
            Icons.add_circle,
            color: Colors.grey,
          ),
          onPressed: () => {},
        ),
      ),
    );
  }
}

class AddProductText extends StatelessWidget {
  const AddProductText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Text(
        'เพิ่มสินค้าใหม่',
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
    return FlatButton(
        padding: EdgeInsets.zero,
        onPressed: () => {},
        minWidth: MediaQuery.of(context).size.width * 0,
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ));
  }
}
