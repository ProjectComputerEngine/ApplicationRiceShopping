import 'package:flutter/material.dart';

// import 'ChatMainBox.dart';
class AdminText extends StatelessWidget {
  final String  message;
  const AdminText({
    Key key, this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            // width: MediaQuery.of(context).size.width * 0.5,
            // height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white24),
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
              maxLines: 10,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.01,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.1,
            decoration: ShapeDecoration(
                shape: CircleBorder(), color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class UserText extends StatelessWidget {
  final String message;
  const UserText({
    Key key, this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.1,
                    decoration: ShapeDecoration(
                        shape: CircleBorder(), color: Colors.white),
                  ),
                ],
              )),
          SpaceWidth(),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            // width: MediaQuery.of(context).size.width * 0.3,
            // height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white24),
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
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
      width: MediaQuery.of(context).size.width * 0.01,
    );
  }
}

class Spaceheight extends StatelessWidget {
  const Spaceheight({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.01,
    );
  }
}

class SettingButton extends StatelessWidget {
  const SettingButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
          padding: EdgeInsets.zero,
          minWidth: MediaQuery.of(context).size.width * 0,
          onPressed: () => {},
          child: Icon(
            Icons.settings,
            color: Colors.white,
            size: 20,
          )),
    );
  }
}

class CallButton extends StatelessWidget {
  const CallButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
          minWidth: MediaQuery.of(context).size.width * 0,
          padding: EdgeInsets.zero,
          onPressed: () => {},
          child: Icon(
            Icons.call,
            color: Colors.white,
            size: 20,
          )),
    );
  }
}

class NameText extends StatelessWidget {
  final String name;
  const NameText({
    Key key, this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '$name',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width * 0.5,
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
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        minWidth: MediaQuery.of(context).size.width * 0,
        onPressed: () => {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => ChatMain() ))
        },
        child: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}

class SendButton extends StatelessWidget {
  final Function send;
  const SendButton({
    Key key, this.send,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed:send,
      minWidth: MediaQuery.of(context).size.width * 0.0,
      child: Icon(
        Icons.send,
        color: Colors.white,
      ),
    );
  }
}

class AccessField extends StatelessWidget {
  final TextEditingController messageController;
  const AccessField({
    Key key, this.messageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: TextField(
        controller: messageController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.01,
              0,
              MediaQuery.of(context).size.width * 0.01,
              0),
        ),
      ),
    );
  }
}

class PhotoButton extends StatelessWidget {
  const PhotoButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          FlatButton(
              onPressed: () => {},
              minWidth: MediaQuery.of(context).size.width * 0.0,
              child: Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
                size: 20,
              )),
          FlatButton(
              onPressed: () => {},
              minWidth: MediaQuery.of(context).size.width * 0.0,
              child: Icon(
                Icons.photo,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}