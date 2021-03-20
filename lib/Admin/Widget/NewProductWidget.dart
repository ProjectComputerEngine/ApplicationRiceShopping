import 'package:flutter/material.dart';
class SaveBUTTON extends StatelessWidget {
  final Function save;
  final FocusNode myNode;
  const SaveBUTTON({
    Key key, this.save, this.myNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(4)),
        // width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.width * 0.1,
        child: FlatButton(
          focusNode:  myNode,
            onPressed: save,
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
  final TextEditingController note;
  final FocusNode myNode;
  final FocusNode nextNode;
  final String error;
  final String value;
  const NoteTextField({
    Key key, this.note, this.myNode, this.nextNode, this.error, this.value,
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
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.62,
              child: TextFormField(
                validator: (str){
                  if (str.isEmpty){
                    return this.error;
                  }
                  return null;
                },
                focusNode: myNode,
                onEditingComplete: (){nextNode.requestFocus();},
                controller: note,
                maxLines: 4,
                textAlign: TextAlign.start,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  labelText: value,
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
  final TextEditingController recommend;
  final FocusNode myNode;
  final FocusNode nextNode;
  final String error;
  final String value;
  const RecommendTextField({
    Key key, this.recommend, this.myNode, this.nextNode, this.error, this.value,
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
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.62,
              child: TextFormField(
                validator: (str){
                  if (str.isEmpty){
                    return this.error;
                  }
                  return null;
                },
                focusNode: myNode,
                onEditingComplete: (){nextNode.requestFocus();},
                controller: recommend,
                maxLines: 4,
                textAlign: TextAlign.start,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  labelText: value,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.02,
                      0.05,
                      MediaQuery.of(context).size.width * 0.01,
                      0.05),
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
  final TextEditingController storage;
  final FocusNode myNode;
  final FocusNode nextNode;
  final String error;
  final String value;
  const PlaceTextField({
    Key key, this.storage, this.myNode, this.nextNode, this.error, this.value,
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
              child: TextFormField(
                validator: (str){
                  if (str.isEmpty){
                    return this.error;
                  }
                  return null;
                },
                focusNode: myNode,
                onEditingComplete: (){nextNode.requestFocus();},
                controller: storage,
                keyboardType: TextInputType.multiline,
                textAlign: TextAlign.start,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  labelText: value,
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
  final Function dateselect;
  final String dateshow;
  final FocusNode myNode;
  final String error;
  const ProductionDateTextField({
    Key key, this.dateselect, this.dateshow, this.myNode, this.error,
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
              width: MediaQuery.of(context).size.width * 0.50,
              child: TextFormField(
                validator: (str){
                  if (str.isEmpty){
                    return this.error;
                  }
                  return null;
                },
                enabled: false,
                textAlign: TextAlign.center,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.02,
                      0.02,
                      MediaQuery.of(context).size.width * 0.01,
                      0.02),
                  hintText: (dateshow),
                ),
              ),
            ),
          ),
          Container(child: IconButton(icon: Icon(Icons.calendar_today),onPressed:dateselect,focusNode: myNode,),)
        ],
      ),
    );
  }
}

class IncressProductTextField extends StatelessWidget {
  final TextEditingController num;
  final FocusNode myNode;
  final FocusNode nextNode;
  final String error;
  final String value;
  final bool enable;
  const IncressProductTextField({
    Key key, this.num, this.myNode, this.nextNode, this.error, this.value, this.enable,
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
              child: TextFormField(
                keyboardType: TextInputType.number,
                validator: (str){
                  if (str.isEmpty){
                    return this.error;
                  }
                  return null;
                },
                enabled: enable== null ? false:true,
                controller: num,
                focusNode: myNode,
                onEditingComplete: (){nextNode.requestFocus();},
                textAlign: TextAlign.center,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  labelText: value,
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
  final TextEditingController width;
  final TextEditingController height;
  final FocusNode my2Node;
  final FocusNode my1Node;
  final FocusNode nextNode;
  final String error;
  final String value1;
  final String value2;
  final bool enable;
  const SizePacketTextField({
    Key key, this.width, this.height, this.my2Node, this.nextNode, this.my1Node, this.error, this.value1, this.value2, this.enable,
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
              child: TextFormField(
                keyboardType: TextInputType.number,
                validator: (str){
                  if (str.isEmpty){
                    return this.error;
                  }
                  return null;
                },
                controller: width,
                focusNode: my1Node,
                onEditingComplete: (){my2Node.requestFocus();},
                textAlign: TextAlign.center,
                cursorColor: Colors.grey,
                enabled: enable== null ? false:true,
                decoration: InputDecoration(
                  labelText: value1,
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
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: height,
                textAlign: TextAlign.center,
                cursorColor: Colors.grey,
                focusNode: my2Node,
                onEditingComplete: (){nextNode.requestFocus();},
                decoration: InputDecoration(
                  labelText: value2,
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
  final TextEditingController weight;
  final FocusNode myNode;
  final FocusNode nextNode;
  final String error;
  final String value;
  final bool enable;
  const WeightTextField({
    Key key, this.weight, this.myNode, this.nextNode, this.error, this.value, this.enable,
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
              child: TextFormField(

                validator: (str){
                  if (str.isEmpty){
                    return this.error;
                  }
                  return null;
                },
                enabled: enable== null ? false:true,
                focusNode: myNode,
                keyboardType: TextInputType.number,
                onEditingComplete: (){nextNode.requestFocus();},
                controller: weight,
                textAlign: TextAlign.center,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  labelText: value,
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
  final TextEditingController price;
  final FocusNode myNode;
  final FocusNode nextNode;
  final String error;
  final String value;
  final bool enable;
  const PriceTextField({
    Key key, this.price, this.myNode, this.nextNode, this.error, this.value, this.enable,
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
              child: TextFormField(
                validator: (str){
                  if (str.isEmpty){
                    return this.error;
                  }
                  return null;
                },
                enabled: enable== null ? false:true,
                controller: price,
                focusNode: myNode,
                keyboardType: TextInputType.number,
                onEditingComplete: (){nextNode.requestFocus();},
                textAlign: TextAlign.center,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  labelText: value,
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
 final TextEditingController name;
 final FocusNode myNode;
 final String error;
 final FocusNode nextNode;
 final String value;
 final bool enable;
  const ProductNameTextField({
    Key key, this.name, this.myNode, this.nextNode, this.error, this.value, this.enable,
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
              child: TextFormField(
                validator: (str){
                  if (str.isEmpty){
                    return this.error;
                  }
                  return null;
                },
                enabled: enable== null ? false:true,
                focusNode: myNode,
                onEditingComplete: (){nextNode.requestFocus();},
                controller: name,
                textAlign: TextAlign.center,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  labelText: value,
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
  final Widget contact;
  const TwoImageBox({
    Key key, this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.15,
        child: contact,
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
  final Function file_picker;
  final Widget content;
  const LargeImageBox({
    Key key, this.file_picker, this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: FlatButton(
          child: content,
          onPressed: file_picker,
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