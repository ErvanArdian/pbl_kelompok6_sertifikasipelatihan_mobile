import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF133E87),
        title: Text('Notifications', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 10, // Replace with the actual number of notifications
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('Notification ${index + 1}'),
              subtitle: Text('This is the detail of notification ${index + 1}.'),
            ),
          );
        },
      ),
    );
  }
}
