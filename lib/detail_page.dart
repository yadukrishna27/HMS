import 'package:flutter/material.dart';

class Monday extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final makeBody = Image.asset("assets/images/monday.png");

    return Scaffold(
      body: Center(child: makeBody),
      appBar: AppBar(
        title: const Text('Back'),
        backgroundColor: Colors.red[800],
      ),
    );
  }
}

class Tuesday extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    final makeBody = Image.asset("assets/images/tuesday.png");

    return Scaffold(
      body: Center(child: makeBody),
      appBar: AppBar(
        title: const Text('Back'),
        backgroundColor: Colors.red[800],
      ),
    );
  }
}

class Wednesday extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    final makeBody = Image.asset("assets/images/wednesday.png");

    return Scaffold(
      body: Center(child: makeBody),
      appBar: AppBar(
        title: const Text('Back'),
        backgroundColor: Colors.red[800],
      ),
    );
  }
}

class Thursday extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    final makeBody = Image.asset("assets/images/thursday.png");

    return Scaffold(
      body: Center(child: makeBody),
      appBar: AppBar(
        title: const Text('Back'),
        backgroundColor: Colors.red[800],
      ),
    );
  }
}

class Friday extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    final makeBody = Image.asset("assets/images/friday.png");

    return Scaffold(
      body: Center(child: makeBody),
      appBar: AppBar(
        title: const Text('Back'),
        backgroundColor: Colors.red[800],
      ),
    );
  }
}

class Saturday extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    final makeBody = Image.asset("assets/images/saturday.png");

    return Scaffold(
      body: Center(child: makeBody),
      appBar: AppBar(
        title: const Text('Back'),
        backgroundColor: Colors.red[800],
      ),
    );
  }
}

class Sunday extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    final makeBody =Image.asset("assets/images/sunday.png");

    return Scaffold(
      body: Center(child: makeBody),
      appBar: AppBar(
        title: const Text('Back'),
        backgroundColor: Colors.red[800],
      ),
    );
  }
}

class Lesson {
  String title;
  String content;

  Lesson(
      {required this.title, required this.content});
}