import 'package:flutter/material.dart';

class NewAdd extends StatefulWidget{
  @override
  _NewAddState createState() => _NewAddState();
}

class _NewAddState extends State<NewAdd>{
  TextEditingController nameController = TextEditingController();
  TextEditingController semController = TextEditingController();
  TextEditingController adrController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final name = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: null,
      controller: nameController,
      decoration: InputDecoration(
        hintText: 'Name of Student',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final sem = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: null,
      controller: semController,
      decoration: InputDecoration(
        hintText: 'Class/Sem',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final adr = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: null,
      controller: adrController,
      decoration: InputDecoration(
        hintText: 'Address',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final submit = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        child: Text('Submit'),
        style: ElevatedButton.styleFrom(
          primary: Colors.red[800],
        ),
        onPressed: () {

        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            name,
            const SizedBox(height: 35.0),
            sem,
            const SizedBox(height: 30.0),
            adr,
            const SizedBox(height: 8.0,),
            submit,
            const SizedBox(height: 5.0)
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Back'),
        backgroundColor: Colors.red[800],
      ),
    );
  }
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

class Lesson {
  String title;
  String content;

  Lesson(
      {required this.title, required this.content});
}