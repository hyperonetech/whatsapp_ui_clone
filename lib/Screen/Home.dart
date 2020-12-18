import 'package:flutter/material.dart';
import 'ChatList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF128C7E),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 4,
            labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            tabs: [
              Tab(child: Icon(Icons.camera_alt)),
              Tab(
                text: 'CHATS',
              ),
              Tab(
                text: 'STATUS',
              ),
              Tab(
                text: 'CALLS',
              ),
            ],
          ),
          title: Text('Whatsapp',style: TextStyle(fontSize: 21),),
          actions: <Widget>[
            Icon(Icons.search),
            SizedBox(
              width: 15,
            ),
            Icon(Icons.more_vert),
            SizedBox(
              width: 5,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          children: [
            Icon(Icons.camera_alt,size: 100,color: Colors.black26,),
            ChatList(),
            Icon(Icons.location_history_outlined,size: 100,color: Colors.black26,),
            Icon(Icons.call,size: 100,color: Colors.black26,),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.comment),
          backgroundColor: Color(0xFF25D366),
          onPressed: (){},
        ),
      ),
    );
  }
}
