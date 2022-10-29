import 'package:flutter/material.dart';

class Signup extends StatefulWidget{
  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Signup>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController conpassController = TextEditingController();
  bool isPasswordVisible = true;
  bool isPasswordVisiblee = true;

  @override
  Widget build(BuildContext context) {
      final email = TextFormField(
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        initialValue: null,
        controller: emailController,
        decoration: InputDecoration(
          hintText: 'Mits ID',
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      );

    final pass = TextFormField(
      autofocus: false,
      initialValue: null,
      //obscureText: true,
      controller: passController,
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

      final conpass = TextFormField(
        autofocus: false,
        initialValue: null,
        //obscureText: true,
        controller: conpassController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          hintText: 'Confirm Password',
          suffixIcon: IconButton(
              icon: isPasswordVisiblee
                  ?const Icon(Icons.visibility_off)
                  :const Icon(Icons.visibility),
              onPressed: ()=>
                  setState(()=> isPasswordVisiblee = !isPasswordVisiblee)),
        ),
        obscureText: isPasswordVisiblee,
      );

    final login = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          if (passController != conpassController){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Error!"),
              ),
            );
          }
          print('Mits ID: ${emailController.text}');
          print('Password: ${passController.text}');
        },
        padding: EdgeInsets.all(12),
        color: Colors.red[800],
        child: const Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            email,
            const SizedBox(height: 33.0),
            pass,
            const SizedBox(height: 30.0),
            conpass,
            const SizedBox(height: 24.0),
            login,
            const SizedBox(height: 8.0,)
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