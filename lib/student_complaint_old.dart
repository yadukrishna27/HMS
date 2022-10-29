import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {
  final String complaint;

  User(this.complaint);

}

class ViewCom extends StatefulWidget {
  @override
  _ViewCState createState() => _ViewCState();
}

class _ViewCState extends State<ViewCom> {
  TextEditingController reportController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final report = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: null,
      controller: reportController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Enter you complaints',
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.clear,
          ),
          onPressed: () {
            reportController.clear();
          },
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 400.0),
          children: <Widget>[
            report,
            const SizedBox(height: 35.0),
          ],
        ),
      ),
    );
  }
}
  /*TextEditingController nameController = TextEditingController();

  User user = User("");
  String url = "http://18.189.159.88:2705/api/auth/signin";

  Future save() async {
    var res = await http.post(Uri.parse(url),
        //  res.body return this json String format: String stringJson = {}
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'complaint': user.complaint}));
    var type = jsonDecode(res.body)['userType'];
    var status = jsonDecode(res.body)['status'];
    print((res.body.toString()));
    /*
    if (type == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error!"),
        ),
      );
    }

    if (status != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("No such user Exists!"),
        ),
      );
    }
    print(status);
    if (type == 'admin') {
      Navigator.pushReplacement<void, void>(context, MaterialPageRoute<void>(
          builder: (BuildContext context) => AdminHome()));
    }
    if (type == 'student') {
      Navigator.pushReplacement<void, void>(context, MaterialPageRoute<void>(
          builder: (BuildContext context) => StudentHome()));
    }
    if (type == 'warden') {
      Navigator.pushReplacement<void, void>(context, MaterialPageRoute<void>(
          builder: (BuildContext context) => RoomHome()));
    }
  }
     */

   */


