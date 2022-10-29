import 'package:flutter/material.dart';

class Error extends StatelessWidget{
  const Error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text("Error!"),
              ),
            );
          },
          child: null,
        )
      )
    );
  }
}