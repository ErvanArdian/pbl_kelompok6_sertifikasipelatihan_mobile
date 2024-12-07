import 'package:flutter/material.dart';
import 'my_courses_page.dart';
import 'profile_page.dart';
import 'home_page.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifikasi',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: 8, // Number of notifications
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Card(
                color: Color(0xFFCBDCEB), // lightGrayishBlue color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Color(0xFF133E87), // deepBlue color
                    ),
                  ),
                  title: Text(
                    'Nama Admin',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF133E87), // deepBlue color
                    ),
                  ),
                  subtitle: Text(
                    index % 2 == 0
                        ? 'Telah mengupload pelatihan terbaru'
                        : 'Telah mengupload Sertifikasi terbaru',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF133E87),
        unselectedItemColor: Colors.grey,
        currentIndex: 2, // Set to "Notifications" as the selected index
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage(username: '')), // Ganti dengan HomePage Anda
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyCoursesPage()), // Ganti dengan MyCoursesPage Anda
              );
              break;
            case 2:
              // Do nothing, we are already on Notifications page
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage(username: 'User')), // Ganti dengan username yang sesuai
              );
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'My Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
