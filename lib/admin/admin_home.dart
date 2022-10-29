import 'package:flutter/material.dart';
import 'package:hms_new/admin/admin_body.dart';
import 'package:hms_new/signup/login_page.dart';

class AdminHome extends StatefulWidget{
  @override
  _AdminHState createState() => _AdminHState();
}

class _AdminHState extends State<AdminHome>{
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: true,
      elevation: 1.0,
      backgroundColor: Colors.white,
      //automaticallyImplyLeading: false,
      iconTheme: IconThemeData(color: Colors.red[800]),
      title: SizedBox(
          height: 50.0,
          width: 500,
          child: Image.asset("assets/images/mits_logo.png")),
      actions: [IconButton(
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()));
        },
        icon: Icon(Icons.logout),
      ),]
    ),
    body: AdminBody(),
  );
}