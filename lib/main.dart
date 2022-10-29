import 'package:flutter/material.dart';
import 'package:hms_new/signup/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HMS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red,
          primaryColor: Colors.black,
          primaryIconTheme: IconThemeData(color: Colors.black),
          primaryTextTheme: TextTheme(
              bodyText1: TextStyle(color: Colors.black, fontFamily: "Aveny")),
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black))),
      home: LoginPage(),
    );
  }
}