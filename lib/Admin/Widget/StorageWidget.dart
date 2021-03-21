
import 'package:flutter/material.dart';
class AddButton extends StatelessWidget {
  final Function GotoNewproduct;
  const AddButton({
    Key key, this.GotoNewproduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: CircleBorder(),
      color: Colors.red,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.2,
        height: double.maxFinite,
        child: FlatButton(
          padding: EdgeInsets.zero,
          minWidth: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.height * 0.08,
          onPressed: GotoNewproduct,
          shape: CircleBorder(),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class SpaceDisplay extends StatelessWidget {
  const SpaceDisplay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.01,
    );
  }
}

class NavigationButton extends StatelessWidget {
  final Icon BarIcon;
  final String BarText;
  final Function GotoOther;

  const NavigationButton({
    Key key,
    this.BarIcon,
    this.BarText, this.GotoOther,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: CircleBorder(),
      ),
      child: FlatButton(
        onPressed: GotoOther,
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

class SpaceProduct extends StatelessWidget {
  const SpaceProduct({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.02,
    );
  }
}

class TextPrice extends StatelessWidget {
  final String FrontText;
  final String MediumText;
  final String EndText;

  const TextPrice({
    Key key,
    this.FrontText,
    this.MediumText,
    this.EndText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.4,
        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.02,
            0, MediaQuery.of(context).size.width * 0.02, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              FrontText,
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
            Text(MediumText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 10)),
            Text(EndText,
                textAlign: TextAlign.end,
                style: TextStyle(color: Colors.white, fontSize: 10)),
          ],
        ));
  }
}

class TextRiceName extends StatelessWidget {
  final String NameText;

  const TextRiceName({
    Key key,
    this.NameText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.02,
            0, MediaQuery.of(context).size.width * 0.02, 0),
        width: MediaQuery.of(context).size.width * 0.4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              // 'ssssssssssss  \n dddddddddddd',
               NameText.replaceAll("\\n", '\n'),
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ],
        ));
  }
}

class SpaceHeight extends StatelessWidget {

  const SpaceHeight({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.015,
    );
  }
}

class ProductText extends StatelessWidget {
  const ProductText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'คลังสินค้า',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width * 0.5,
    );
  }
}

class BackIcons extends StatelessWidget {
  final Function GotoBackPage;
  const BackIcons({
    Key key, this.GotoBackPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        minWidth: MediaQuery.of(context).size.width * 0,
        onPressed: GotoBackPage,
        child: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}


class ProductItem extends StatelessWidget {
  final String name;
  final String price;
  final String num;
  final String imageUrl;
  final Function goToDetail;
  const ProductItem({
    Key key,
    this.name,
    this.price,
    this.num,
    this.imageUrl, this.goToDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: FlatButton(
        color: Colors.white24,
        onPressed:goToDetail,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        height: MediaQuery.of(context).size.height * 0.35,
        minWidth: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.235,
              width: MediaQuery.of(context).size.width * 0.45,
              //color: Colors.yellow,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(imageUrl)),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8), topLeft: Radius.circular(8))),
              child: Container(),
            ),
            ProductCard(
              name: name,
              price: price,
              num: num,
              imageUrl: imageUrl,
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String num;
  final String imageUrl;

  const ProductCard({
    Key key,
    this.name,
    this.price,
    this.num,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(8), bottomLeft: Radius.circular(8))),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.12,
        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.015,
            0, MediaQuery.of(context).size.width * 0.015, 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8)),
            color: Color.fromRGBO(32, 50, 50, 100)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SpaceHeight(),
            TextRiceName(
              NameText: name,
            ),
            TextPrice(
              FrontText: 'ราคา',
              MediumText: price,
              EndText: 'บาท',
            ),
            TextPrice(
              FrontText: 'เหลือ',
              MediumText: num,
              EndText: 'กระสอบ',
            ),
          ],
        ),
      ),
    );
  }
}
