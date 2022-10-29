import 'package:flutter/material.dart';
import 'package:hms_new/admin/admin_home.dart';
import 'package:hms_new/room_allocation/room_home.dart';
import 'package:hms_new/signup/forgot_pass.dart';
import 'package:hms_new/signup/signup.dart';
import 'package:hms_new/student_home.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class User {
  String username;
  String password;
  User(this.username, this.password);
}

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() =>  _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = true;

  //http://192.168.1.22:2705/api/auth/signin Local
 // final _formKey = GlobalKey<FormState>();
  User user = User("", "");
  String url = "http://18.189.159.88:2705/api/auth/signin";

  Future save() async {
    var res = await http.post(Uri.parse(url),
      //  res.body return this json String format: String stringJson = {}
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'username': user.username, 'password': user.password}));
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
     */
    if (status != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("No such user Exists!"),
        ),
      );
    }
    print(status);
    if (type == 'admin') {
      Navigator.pushReplacement<void,void>(context,MaterialPageRoute<void>(builder: (BuildContext context)=>AdminHome()));
    }
    if (type == 'student') {
      Navigator.pushReplacement<void,void>(context,MaterialPageRoute<void>(builder: (BuildContext context)=>StudentHome()));
    }
    if (type == 'warden') {
      Navigator.pushReplacement<void,void>(context,MaterialPageRoute<void>(builder: (BuildContext context)=>RoomHome()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: SizedBox(
            height: 70.0, width: 700, child: Image.asset("assets/images/mits_logo.png")),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: null,
      controller: TextEditingController(text: user.username),
    onChanged: (val) {
      user.username = val;
    },
    validator: (value) {
      if (value!.isEmpty) {
        return 'Password is Empty';
      }
      return null;
    },
      decoration: InputDecoration(
        hintText: 'Mits ID',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: null,
      //obscureText: true,
      controller: TextEditingController(text: user.password),
      onChanged: (val) {
        user.password = val;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email is Empty';
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        hintText: 'Password',
        suffixIcon: IconButton(
            icon: isPasswordVisible
                ?const Icon(Icons.visibility_off)
                :const Icon(Icons.visibility),
            onPressed: ()=>
                setState(()=> isPasswordVisible = !isPasswordVisible)),
      ),
      obscureText: isPasswordVisible,
    );

    final loginButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
        //  if (_formKey.currentState!.validate()) {
            save();
         // Navigator.push(context,MaterialPageRoute(builder: (context) => RoomHome()));
         // Navigator.push(context,MaterialPageRoute(builder: (context) => StudentHome()));
         // Navigator.push(context,MaterialPageRoute(builder: (context) => AdminHome()));
        //  }
          /*
          //    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>StudentHome()));
          if(nameController.text == 'admin'){
            Navigator.pushReplacement<void,void>(context,MaterialPageRoute<void>(builder: (BuildContext context)=>AdminHome()));
          }
          if(nameController.text == 'student'){
            Navigator.pushReplacement<void,void>(context,MaterialPageRoute<void>(builder: (BuildContext context)=>StudentHome()));
          }
          if(nameController.text == 'warden'){
            Navigator.pushReplacement<void,void>(context,MaterialPageRoute<void>(builder: (BuildContext context)=>RoomHome()));
          }
          //else(exit(0));
           */
          print('Mits ID: ${nameController.text}');
          print('Password: ${passwordController.text}');
        },
        padding: EdgeInsets.all(12),
        color: Colors.red[800],
        child: const Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = TextButton(
      child: const Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => ForgotPass()));
      },
    );

    final signLabel = TextButton(
        child: const Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(text: "Don't have an account? ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
              TextSpan(text: 'Signup', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      onPressed: () {
        Navigator.push(context,MaterialPageRoute(builder: (context) => Signup()));
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            const SizedBox(height: 48.0),
            email,
            const SizedBox(height: 8.0),
            password,
            const SizedBox(height: 15.0),
            forgotLabel,
            const SizedBox(height: 5.0),
            loginButton,
            signLabel,
          ],
        ),
      ),
    );
  }
}

