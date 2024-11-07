import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search')),
      body: Center(
        child: TextField(
          decoration: InputDecoration(hintText: 'Search courses...'),
        ),
      ),
    );
  }
}
