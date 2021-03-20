import 'package:flutter/material.dart';
class PlaceText extends StatelessWidget {
  final String TextPLACE;
  const PlaceText({
    Key key, this.TextPLACE,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.08,
          0,
          MediaQuery.of(context).size.width * 0.05,
          0),
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          Container(
            child: Text(
              'ที่อยู่',
              style: TextStyle(color: Colors.black87,),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Expanded(
            child: Text(
              TextPLACE,
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}

class ClickButton extends StatelessWidget {
  final String TextButton;

  const ClickButton({
    Key key,
    this.TextButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: FlatButton(
          padding: EdgeInsets.zero,
          child: Text(
            TextButton,
            style: TextStyle(fontSize: 12),
          ),
          onPressed: () => {},
        ),
      ),
    );
  }
}

class TextUnderName extends StatelessWidget {
  final String FrontText;
  final String EndText;

  const TextUnderName({
    Key key,
    this.FrontText,
    this.EndText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.08, 0,
          MediaQuery.of(context).size.width * 0.05, 0),
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          Container(
            child: Text(
              FrontText,
              style: TextStyle(color: Colors.black87),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Container(
            child: Text(
              EndText,
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}

class TextName extends StatelessWidget {
  final String SelfNameText;

  const TextName({
    Key key,
    this.SelfNameText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        SelfNameText,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          shadows: [
            Shadow(
              blurRadius: 5.0,
              color: Colors.grey,
              offset: Offset(2.0, 2.0),
            ),
          ],
        ),
      ),
    );
  }
}

class PictureProfile extends StatelessWidget {
  const PictureProfile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: CircleBorder(),
      color: Colors.white,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.25,
        child: FlatButton(
          minWidth: MediaQuery.of(context).size.width * 0.5,
          onPressed: () => {},
          shape: CircleBorder(),
        ),
      ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  final String BarText;
  final Icon BarIcon;

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