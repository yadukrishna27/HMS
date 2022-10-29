import 'package:flutter/material.dart';
import 'package:hms_new/signup/otp.dart';

class ForgotPass extends StatefulWidget{
  @override
  _ForgotState createState() => _ForgotState();
}

class _ForgotState extends State<ForgotPass>{
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

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

    final submit = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          print('Mits ID: ${emailController.text}');
          Navigator.push(context,MaterialPageRoute(builder: (context) => Otp()));
        },
        padding: EdgeInsets.all(12),
        color: Colors.red[800],
        child: const Text('Submit', style: TextStyle(color: Colors.white)),
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
            const SizedBox(height: 35.0),
            submit,
            const SizedBox(height: 30.0),
           /* conpass,
            const SizedBox(height: 24.0),
            login,
            const SizedBox(height: 8.0,)
            */
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