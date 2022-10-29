import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {

  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();



  User user = User("", "");
  String url = "http://18.189.159.88:2705/api/auth/registerComplaint";


  @override
  Widget build(BuildContext context) {
    final title = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: null,
      controller: TextEditingController(text: user.title),
      onChanged: (val) {
        user.title = val;
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Complaint title',
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.clear,
          ),
          onPressed: () {
            titleController.clear();
          },
        ),
      ),
    );


    final des = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: null,
      controller: TextEditingController(text: user.description),
      onChanged: (val) {
        user.description = val;
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Complaint description',
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.clear,
          ),
          onPressed: () {
            desController.clear();
          },
        ),
      ),
    );

    final submitButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        child: Text('Submit'),
        style: ElevatedButton.styleFrom(
          primary: Colors.red[800],
        ),
        onPressed: () {
          complaint();
        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 400.0),
          children: <Widget>[
            title,
            const SizedBox(height: 35.0),
            des,
            const SizedBox(height: 40.0),
            submitButton,
            const SizedBox(height: 8.0,)
          ],
        ),
      ),
    );
  }

  Future complaint() async {
    var res = await http.post(Uri.parse(url),
        //  res.body return this json String format: String stringJson = {}
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'title': user.title, 'description': user.description}));
    // var type = jsonDecode(res.body)['userType'];
    //  var status = jsonDecode(res.body)['status'];
    print((res.body.toString()));
    /*
    if (type == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error!"),
        ),
      );
    }
    */

    if (res.body.toString() == 'saved') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Complaint registered successfully"),
        ),
      );
    }
    print(res.body.toString());
    /*
    if (type == 'admin') {
      Navigator.pushReplacement<void,void>(context,MaterialPageRoute<void>(builder: (BuildContext context)=>AdminHome()));
    }
    if (type == 'student') {
      Navigator.pushReplacement<void,void>(context,MaterialPageRoute<void>(builder: (BuildContext context)=>StudentHome()));
    }
    if (type == 'warden') {
      Navigator.pushReplacement<void,void>(context,MaterialPageRoute<void>(builder: (BuildContext context)=>RoomHome()));
    }

     */
  }

}

class User {
  String title;
  String description;

  User(this.title, this.description);

}