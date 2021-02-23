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
      color: Color.fromRGBO(32, 50, 50, 5),
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

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Container(
              child: TextField(
                // controller: controller,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  //isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05,
                      0.15,
                      MediaQuery.of(context).size.width * 0.05,
                      0.5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.height * 0,
                  0,
                  MediaQuery.of(context).size.width * 0,
                  0),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.01,
            ),
            FlatButton(
              color: Colors.white,
              minWidth: MediaQuery.of(context).size.width * 0.01,
              height: MediaQuery.of(context).size.height * 0.05,
              onPressed: () => {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.08,
                child: Text(
                  'ค้นหา',
                  style: TextStyle(color: Colors.black, fontSize: 10),
                ),
              ),
            )
          ],
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
