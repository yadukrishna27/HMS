import 'package:flutter/material.dart';
import 'package:hms_new/room_allocation/room_alloc.dart';
import 'package:hms_new/room_allocation/room_details.dart';
import 'package:hms_new/room_allocation/view_students.dart';

class RoomBody extends StatefulWidget{
  @override
  _RoomBState createState() => _RoomBState();
}

class _RoomBState extends State<RoomBody> {
  late List lessons = getLessons();

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
          Navigator.push(context,MaterialPageRoute(builder: (context) => RoomAlloc()));
        }
        if(index == 1){
          Navigator.push(context,MaterialPageRoute(builder: (context) => NewAdd()));
        }
          if(index == 2){
          Navigator.push(context,MaterialPageRoute(builder: (context) => ViewStu()));
        }
        /*if(index == 3){
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
        title: "Automatic Allocation", content: ''),
    Lesson(
        title: "New", content: ''),
    Lesson(
        title: "View Residents", content: ''),
    /*Lesson(
        title: "Thursday"),
    Lesson(
        title: "Friday"),
    Lesson(
        title: "Saturday"),
    Lesson(
        title: "Sunday"),*/
  ];
}