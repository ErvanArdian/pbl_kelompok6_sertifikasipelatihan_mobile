import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notifikasi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotifikasiPage(),
    );
  }
}

class NotifikasiPage extends StatefulWidget {
  @override
  _NotifikasiPageState createState() => _NotifikasiPageState();
}

class _NotifikasiPageState extends State<NotifikasiPage> {
  String selectedTab = 'Semua';
  String selectedToggle = 'Terbaru';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi'),
        backgroundColor: Color(0xFF133E87),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ToggleButtons(
                  borderRadius: BorderRadius.circular(20),
                  selectedColor: Colors.white,
                  fillColor: Color(0xFF133E87),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('Terbaru'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('Semua'),
                    ),
                  ],
                  isSelected: [
                    selectedToggle == 'Terbaru',
                    selectedToggle == 'Semua',
                  ],
                  onPressed: (index) {
                    setState(() {
                      selectedToggle = index == 0 ? 'Terbaru' : 'Semua';
                    });
                  },
                ),
                SizedBox(width: 10),
                ToggleButtons(
                  borderRadius: BorderRadius.circular(20),
                  selectedColor: Colors.white,
                  fillColor: Color(0xFF133E87),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('Semua'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('Admin'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('Pimpinan'),
                    ),
                  ],
                  isSelected: [
                    selectedTab == 'Semua',
                    selectedTab == 'Admin',
                    selectedTab == 'Pimpinan',
                  ],
                  onPressed: (index) {
                    setState(() {
                      if (index == 0) {
                        selectedTab = 'Semua';
                      } else if (index == 1) {
                        selectedTab = 'Admin';
                      } else if (index == 2) {
                        selectedTab = 'Pimpinan';
                      }
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 7, // Replace with your data length
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.person, color: Colors.grey[700]),
                  ),
                  title: Text('Dr.Eng. Rosa Andire Asmara, ST, MT.'),
                  subtitle: Text(
                    'Merekomendasikan Anda untuk mengikuti pelatihan XXXXX',
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey[600]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

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
