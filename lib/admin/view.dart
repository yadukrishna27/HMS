import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class View extends StatefulWidget {
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {

  //String url = "http://18.189.159.88:2705/api/auth/getUsers";

  Future<List<User>> getUserData() async {
    var res = await http.get(Uri.http('18.189.159.88:2705', 'api/auth/getUsers'));
    var jsonData = jsonDecode(res.body);
    List<User> users = [];

    for(var u in jsonData) {
      User user = User(u["username"], u["email"], u["userRole"]);
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
                  title: Text(snapshot.data![i].username),
                  subtitle: Text(snapshot.data![i].email),
                  trailing: Text(snapshot.data![i].userRole),
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

  final String username, email, userRole;

  User(this.username, this.email, this.userRole);

}
