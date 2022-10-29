import 'package:flutter/material.dart';
import 'package:hms_new/admin/admin_details.dart';
import 'package:hms_new/admin/student_complaints.dart';
import 'package:hms_new/admin/view.dart';

class AdminBody extends StatefulWidget{
  @override
  _AdminBState createState() => _AdminBState();
}

class _AdminBState extends State<AdminBody> {
  late List lessons;

  @override
  void initState() {
    lessons = getLessons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Lesson lesson, int index) => ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
      title: Text(
        lesson.title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),

      trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      onTap: () {
        if(index == 0){
          Navigator.push(context,MaterialPageRoute(builder: (context) => View()));
        }
        if(index == 1){
          Navigator.push(context,MaterialPageRoute(builder: (context) => ViewCom()));
        }
        /*if(index == 2){
          Navigator.push(context,MaterialPageRoute(builder: (context) => Create()));
        }
        if(index == 3){
          Navigator.push(context,MaterialPageRoute(builder: (context) => Thursday()));
        }
        if(index == 4){
          Navigator.push(context,MaterialPageRoute(builder: (context) => Friday()));
        }
        if(index == 5){
          Navigator.push(context,MaterialPageRoute(builder: (context) => Saturday()));
        }
        if(index == 6){
          Navigator.push(context,MaterialPageRoute(builder: (context) => Sunday()));
        }*/
      },
    );

    Card makeCard(Lesson lesson, int index) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.red[800]?.withOpacity(1)),
        child: makeListTile(lesson, index),
      ),
    );

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: lessons.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(lessons[index], index);
        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: makeBody,
    );
  }
}

List getLessons() {
  return [
    Lesson(
        title: "View all User Details", content: ''),
    Lesson(
        title: "View Complaints", content: ''),
    /*Lesson(
        title: "Create User", content: ''),
    Lesson(
        title: "Thursday"),
    Lesson(
        title: "Friday"),
    Lesson(
        title: "Saturday"),
    Lesson(
        title: "Sunday"),*/
  ];
}


class Lesson {
  String title;
  String content;

  Lesson(
      {required this.title, required this.content});
}

class Auto extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    final makeBody = null;

    return Scaffold(
      body: Center(child: makeBody),
      appBar: AppBar(
        title: const Text('Back'),
        backgroundColor: Colors.red[800],
      ),
    );
  }
}