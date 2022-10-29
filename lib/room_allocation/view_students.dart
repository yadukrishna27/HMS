import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ViewStu extends StatefulWidget {
  @override
  _ViewSState createState() => _ViewSState();
}

class _ViewSState extends State<ViewStu> {

  //String url = "http://18.189.159.88:2705/api/auth/getUsers";

  Future<List<User>> getUserData() async {
    var res = await http.get(Uri.http('18.189.159.88:2705', 'api/auth/getstudents'));
    var jsonData = jsonDecode(res.body);
    List<User> users = [];

    for(var u in jsonData) {
      User user = User(u["name"], u["room"]);
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
                future: getUserData(),
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
                            title: Text("Name: " +snapshot.data![i].name),
                            subtitle: Text("Room: " +snapshot.data![i].room),
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

  final String name, room;

  User(this.name, this.room);

}
