import 'package:flutter/material.dart';
import 'package:hms_new/navigationbar/acc_details.dart';
import 'package:hms_new/navigationbar/report.dart';
import 'package:hms_new/navigationbar/search_bar.dart';
import 'package:hms_new/navigationbar/slot_booking.dart';
import 'package:hms_new/signup/login_page.dart';
import 'package:hms_new/student_body.dart';

class StudentHome extends StatefulWidget {
  @override
  _StudentHome createState() => _StudentHome();
}

class _StudentHome extends State<StudentHome> {
  int currentIndex = 0;
  final List<Widget> screens = [
    StudentBody(),
    Search(),
    Sports(),
    Report(),
    ProfilePage(),
  ];

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
      actions: [
        IconButton(
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()));
        },
        icon: Icon(Icons.logout),
      ),
  ]
    ),
    body: screens[currentIndex],
    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (index) => setState(() => currentIndex = index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.timer),
          label: 'Time Table',
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sports),
          label: 'Sports',
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.report),
          label: 'Report',
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box),
          label: 'Account',
          backgroundColor: Colors.red,
        ),
      ],
    ),
  );
}



/*

class Account extends StatefulWidget{
  @override
  AccountState createState() => AccountState();
}
class AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {

  }

}

*/

