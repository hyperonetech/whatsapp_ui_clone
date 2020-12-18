import 'package:flutter/material.dart';
import 'Chat.dart';
import '../models/ConversationModel.dart';

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: chatdata.length,
        itemBuilder:(BuildContext context,index)=>ChatTile(context,chatdata[index])
      ),
    );
  }
}

Widget ChatTile(BuildContext context, Chat chat) {
  return InkWell(
    onTap: ()=>Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context)=>Chatting(chat:chat))
    ),
    child: Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: ClipOval(
              child: Image.network(
                  chat.image),
            ),
            title:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      chat.name,
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Text(
                      chat.message,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
SizedBox(height: 6,),
                Text(
                  chat.date,
                  style: TextStyle(
                      color: chat.count > 0
                          ? Color(0xFF25D366)
                          : Colors.grey,fontSize: 12),
                ),SizedBox(height: 6,),
                chat.count > 0
                    ?  Container(
                  width: 20,
                  height: 20,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    color: Color(0xFF25D366),
                  ),
                  child:Center(
                    child: Text(
                      '${chat.count}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ) ,
                )
                    : Text(''),
              ],
            ),

          ),
          Container(
            width: 330,
            height: 1,
            margin: EdgeInsets.only(left: 56, top: 15),
            color: Colors.grey.withOpacity(.2),
          )
        ],
      ),
    ),
  );
}
