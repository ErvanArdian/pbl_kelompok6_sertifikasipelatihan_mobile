import 'package:flutter/material.dart';
import 'edit_profile_page.dart';
import 'home_page.dart'; // Pastikan untuk mengimpor halaman Home
import 'login_page.dart';
import 'search_page.dart'; // Pastikan untuk mengimpor halaman Search
import 'my_courses_page.dart'; // Pastikan untuk mengimpor halaman My Courses
import 'certificates_page.dart'; // Import halaman sertifikat

class ProfilePage extends StatelessWidget {
  final String username;

  ProfilePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color.fromARGB(255, 241, 241, 241),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, size: 50, color: Colors.grey[700]),
          ),
          SizedBox(height: 10),
          Text(
            username,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF133E87),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildProfileOption(Icons.article, "Sertifikat", context),
                _buildProfileOption(Icons.edit, "Edit Profile", context),
                _buildProfileOption(Icons.logout, "Logout", context),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              'v8.0.14',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF133E87),
        unselectedItemColor: Colors.grey,
        currentIndex: 3,
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
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage(username: '',)), // Ganti dengan HomePage Anda
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyCoursesPage()), // Ganti dengan MyCoursesPage Anda
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()), // Ganti dengan SearchPage Anda
              );
              break;
            case 3:
              // Do nothing, we are already on Profile page
              break;
          }
        },
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String label, BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Icon(icon, color: Color(0xFF608BC1)),
        title: Text(label),
        trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFFCBDCEB)),
        onTap: () {
          if (label == "Edit Profile") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditProfilePage()),
            );
          } else if (label == "Logout") {
            // Tambahkan logika logout di sini
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          } else if (label == "Sertifikat") {
            // Navigasi ke halaman sertifikat
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CertificatesPage()),
            );
          }
        },
      ),
    );
  }
}