import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/models/ConversationModel.dart';

class Calls extends StatefulWidget {
  @override
  _CallsState createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        itemCount: calls.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {

            },
            child: ListTile(
              leading: Container(
                height: 55,
                width: 55,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: CachedNetworkImage(
                    imageUrl: calls[index].image,
                  ),
                ),
              ),
              title: Text(
                calls[index].title,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Row(
                children: [
                  Icon(
                    calls[index].incoming==true?Icons.call_received:Icons.call_made,color:  calls[index].incoming==true?Color(0xFF25D366):Colors.red,
                  ),
                  Text(
                    calls[index].date,
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                ],
              ),
              trailing: Icon(
                calls[index].video==true?Icons.video_call:Icons.call,color: Color(0xFF25D366),

              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Container(
              padding: EdgeInsets.only(left: 80,right: 20),
              child: Divider(
                height: 2,
                color: Colors.grey,
              ));
        },
      ),
    );
  }
}
