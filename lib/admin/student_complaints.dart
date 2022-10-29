import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ViewCom extends StatefulWidget {
  @override
  _ViewCState createState() => _ViewCState();
}

class _ViewCState extends State<ViewCom> {

  //String url = "http://18.189.159.88:2705/api/auth/getUsers";

  Future<List<User>> getComplaintData() async {
    var res = await http.get(Uri.http('18.189.159.88:2705', 'api/auth/openComplaints'));
    var jsonData = jsonDecode(res.body);
    List<User> users = [];

    for(var u in jsonData) {
      User user = User(u["title"], u["description"]);
      users.add(user);
    }
    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Back'),
          backgroundColor: Colors.red[800],
        ),
        body: Container(
            child: Card(
              child: FutureBuilder<List<User>>(
                future: getComplaintData(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                        child: Center(
                          child: Text('Loading..'),
                        )
                    );
                  }
                  else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            title: Text(snapshot.data![i].title),
                            subtitle: Text(snapshot.data![i].description),
                            //trailing: Text(snapshot.data![i].dateOpened),
                          );
                        }
                    );
                  }
                },
              ),
            )
        )
    );
  }
}

class User {

  final String title, description;
  //final DateTime dateOpened;

  User(this.title, this.description);

}
