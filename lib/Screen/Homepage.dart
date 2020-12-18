import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff075E54),
      ),
      body: Container(
        color: Color(0xffECE5DD),
        padding: EdgeInsets.all(12),
        child: ListView(

          children: [
            Message('right', "hello how are you,my name is khan and i am not terrorist!") ,
            Message('right',
                "hello how are you,my name is k "),
            Message('left', "hello how are you ?")
          ],
        ),
      ),
    );
  }
  Widget Message(String position,String msg)
  {
    double max= MediaQuery.of(context).size.width*0.8;
    print(max);

    int c=msg.length*14;
    print(c);
    print(msg.length);
    if(c>max)
      {
        c=max.toInt();
      }
    return  Container(
      width: MediaQuery.of(context).size.width*0.8,
      child: Row(
        mainAxisAlignment: position=='left'?MainAxisAlignment.start:MainAxisAlignment.end,
        children: [
          Container(
            width: c.toDouble(),
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(color: Color(0xffDCF8C6),
                borderRadius: BorderRadius.circular(10)),

           child: Text(msg,  style:TextStyle(
             fontSize: 14
           ),overflow: TextOverflow.clip,),
          ),
        ],
      ),
    );

  }
}
