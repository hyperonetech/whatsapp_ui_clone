import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Screen/Home.dart';
void main(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
   // statusBarColor: Colors.transparent,
    //statusBarIconBrightness: Brightness.dark,
    // systemNavigationBarColor: Colors.transparent

  ));
  runApp(


      MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
