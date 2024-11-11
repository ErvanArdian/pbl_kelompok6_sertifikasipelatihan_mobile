import 'package:flutter/material.dart';

class MyCoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Courses')),
      body: Center(child: Text('List of your enrolled courses')),
    );
  }
}
