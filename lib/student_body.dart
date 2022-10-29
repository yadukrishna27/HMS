import 'package:flutter/material.dart';
import 'package:hms_new/detail_page.dart';

class StudentBody extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<StudentBody> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to HMS',
      home: ListPage(title: 'abc',),
    );
  }
}

class ListPage extends StatefulWidget {
  ListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
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
          Navigator.push(context,MaterialPageRoute(builder: (context) => Monday()));
        }
        if(index == 1){
          Navigator.push(context,MaterialPageRoute(builder: (context) => Tuesday()));
        }
        if(index == 2){
          Navigator.push(context,MaterialPageRoute(builder: (context) => Wednesday()));
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
        }
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
        title: "Monday", content: ''),
    Lesson(
        title: "Tuesday", content: ''),
    Lesson(
        title: "Wednesday", content: ''),
    Lesson(
        title: "Thursday", content: ''),
    Lesson(
        title: "Friday", content: ''),
    Lesson(
        title: "Saturday", content: ''),
    Lesson(
        title: "Sunday", content: ''),
  ];
}