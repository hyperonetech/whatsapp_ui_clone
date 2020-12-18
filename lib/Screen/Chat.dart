import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/ConversationModel.dart';

class Chatting extends StatefulWidget {
  final Chat chat;

  const Chatting({Key key, this.chat}) : super(key: key);

  @override
  _ChattingState createState() => _ChattingState(chat);
}

class _ChattingState extends State<Chatting> {
  final Chat conversation;

  _ChattingState(this.conversation);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECE5DD),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(63.0),
        child: AppBar(
          backgroundColor: Color(0xFF128C7E),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          titleSpacing: 0,
          centerTitle: true,

          title: ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(conversation.image),
            ),
            title: Text(
              conversation.name,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          actions: <Widget>[
            Icon(
              Icons.videocam,
              size: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.call,
              size: 28,
            ),
            SizedBox(
              width: 20,
            ),
            Icon(Icons.more_vert),
            SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Message('send', "hello how are you,my name is khan and i am not terrorist!"),
                Message('send', "hello how are you,my name is k "),
                Message('receive', "hello how are you ?")
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.tag_faces,
                        color: Colors.grey,
                        size: 26,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 199,
                        height: 30,
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Type a message',
                              contentPadding: EdgeInsets.only(bottom: 13),
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 18)),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.attach_file,
                        color: Colors.grey,
                        size: 26,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.camera_alt,
                        color: Colors.grey,
                        size: 26,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Color(0xFF128C7E), shape: BoxShape.circle),
                  child: Icon(
                    Icons.keyboard_voice,
                    color: Colors.white,
                    size: 32,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget Message(String position, String msg) {
    double max = MediaQuery.of(context).size.width * 0.7;
    print(max);

    int c = msg.length * 8;
    print(c);
    print(msg.length);
    if (c > max) {
      c = max.toInt();
    }
    return Container(

      child: Row(
        mainAxisAlignment: position == 'receive'
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              position == 'receive'
                  ? Positioned(
                      left: 12,
                      top: 5,
                      child: ClipPath(
                        clipper: Triangle(),
                        child: Container(
                          height: 15,
                          width: 20,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 0,
                    ),
              Container(

                padding: EdgeInsets.all(7),
                margin: EdgeInsets.symmetric(horizontal: 21, vertical: 5),
                decoration: BoxDecoration(
                  color: position=="receive"?Colors.white:Color(0xFFDCF8C6),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(

                      child: Text(msg,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      width: c.toDouble(),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        conversation.date,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              position == 'send'
                  ? Positioned(
                      right: 12,
                      top: 5,
                      child: ClipPath(
                        clipper: Triangle(),
                        child: Container(
                          height: 15,
                          width: 20,
                          color:  Color(0xFFDCF8C6),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 0,
                    )
            ],
          ),
        ],
      ),
    );
  }
}

class Triangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(Triangle oldClipper) => false;
}
