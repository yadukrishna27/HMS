import 'package:flutter/material.dart';

class Otp extends StatefulWidget {
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final otp = TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      initialValue: null,
      controller: otpController,
      decoration: InputDecoration(
        hintText: 'OTP',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final login = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => OtpNP()));
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
            otp,
            const SizedBox(height: 33.0),
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

class OtpNP extends StatefulWidget {
  @override
  _OtpNPState createState() => _OtpNPState();
}

class _OtpNPState extends State<OtpNP> {
  TextEditingController otppassController = TextEditingController();
  TextEditingController otpconpassController = TextEditingController();
  bool isPasswordVisible = true;
  bool isPasswordVisiblee = true;

  @override
  Widget build(BuildContext context) {
    final pass = TextFormField(
      autofocus: false,
      initialValue: null,
      //obscureText: true,
      controller: otppassController,
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
      controller: otpconpassController,
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
          if (otppassController != otpconpassController){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Error!"),
              ),
            );
          }
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