import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp_ui_clone/Screen/Calls.dart';
import 'package:whatsapp_ui_clone/Screen/Status.dart';
import 'ChatList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TabController tabController;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  int tabindex=1;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF128C7E),
          bottom: TabBar(
            onTap: (index){
              print(index);
              setState(() {
                tabindex=index;
              });
            },
            indicatorColor: Colors.white,
            indicatorWeight: 4,
            controller: tabController,
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
            Status(),
            Calls(),
          ],
        ),
        floatingActionButton: Container(
          padding: EdgeInsets.only(bottom: 15),
          child: tabindex==0?SizedBox(width: 0,):FloatingActionButton(
            child: Icon(tabindex==1?Icons.comment:tabindex==2?Icons.camera_alt:Icons.call),
            backgroundColor: Color(0xFF25D366),
            onPressed: (){},
          ),
        ),
      ),
    );
  }
}
