import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RoomAlloc extends StatefulWidget {
  @override
  _RoomAState createState() => _RoomAState();
}

class _RoomAState extends State<RoomAlloc> {

  //String url = "http://18.189.159.88:2705/api/auth/getUsers";
//  http://18.189.159.88:2705/api/auth/allocateRooms
  Future<List<User>> getUserData() async {
    var res = await http.get(Uri.http('18.189.159.88:2705', 'api/auth/allocateRooms'));
    var jsonData = jsonDecode(res.body);
    List<User> users = [];
  //  print(res.body);

    for(var u in jsonData) {
      //print(res.body);
     // print(u["room"].runtimeType);
     User user = User(u["name"], u["room"], u["distance"]);
       //  print(user.name);
      users.add(user);
     // print(user.distance);
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
        body: /*Center(
          child: ElevatedButton(
            child: Text('Click'),
            onPressed: () {
              getUserData();
            },
          ),
        )*/
        Container(
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
                            subtitle: Text("Distance: " +snapshot.data![i].distance + "Km"),
                            trailing: Text("Room: " +snapshot.data![i].room),
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

  final String name;
  final String room;
  final String distance;

  User(this.name, this.room, this.distance);

}
