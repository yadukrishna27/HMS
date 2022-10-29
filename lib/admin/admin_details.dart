import 'package:flutter/material.dart';
import 'package:hms_new/admin/student_complaints.dart';

class ViewC extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final makeBody = null;

    return Scaffold(
      body: Center(child: ViewCom()),
      appBar: AppBar(
        title: const Text('Back'),
        backgroundColor: Colors.red[800],
      ),
    );
  }
}

class ViewComplaints extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final makeBody = null;

    return Scaffold(
      body: Center(child: makeBody),
      appBar: AppBar(
        title: const Text('Back'),
        backgroundColor: Colors.red[800],
      ),
    );
  }
}

/*
class Create extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final makeBody = null;

    return Scaffold(
      body: Center(child: makeBody),
      appBar: AppBar(
        title: const Text('Back'),
        backgroundColor: Colors.red[800],
      ),
    );
  }
}
 */