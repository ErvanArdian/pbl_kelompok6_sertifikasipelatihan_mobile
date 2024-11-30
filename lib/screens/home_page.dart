import 'package:flutter/material.dart';
import 'search_page.dart';
import 'my_courses_page.dart';
import 'profile_page.dart';
import 'notifications_page.dart'; // Import the notifications page
import 'training_category_page.dart'; // Import the category pages

class HomePage extends StatelessWidget {
  final String username;
  final int totalPelatihan = 5; // Contoh data total pelatihan
  final int totalSertifikasi = 3; // Contoh data total sertifikasi

  HomePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF133E87),
        title: Text('Home', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NotificationsPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, $username!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF133E87),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Tingkatkan kemampuan untuk terus berkembang bersama JTI Polinema!',
              style: TextStyle(
                  color: Color(0xFF133E87),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Ringkasan Section
            Text(
              'Ringkasan:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF133E87),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Total Pelatihan yang Diikuti: $totalPelatihan',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF133E87),
              ),
            ),
            Text(
              'Total Sertifikasi: $totalSertifikasi',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF133E87),
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                benefitItem(Icons.school, Colors.blue, 'Pelatihan', context),
                benefitItem(Icons.rocket, Colors.pink, 'Sertifikasi', context),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Bidang Minat',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF133E87),
              ),
            ),
            SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              physics: NeverScrollableScrollPhysics(),
              children: [
                courseCard(
                    'AI and Machine Learning', 51, Icons.android, context),
                courseCard('Cyber Security', 17, Icons.shield, context),
                courseCard('Data Science', 85, Icons.bar_chart, context),
                courseCard('Cloud Computing', 42, Icons.cloud, context),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFF133E87),
        unselectedItemColor: Color(0xFFCBDCEB),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'My Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage(username: username)));
              break;
            case 1:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchPage()));
              break;
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyCoursesPage()));
              break;
            case 3:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfilePage(username: username)));
              break;
          }
        },
      ),
    );
  }

  Widget benefitItem(
      IconData icon, Color color, String label, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (label == 'Pelatihan') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      TrainingCategoryPage(categoryName: 'Pelatihan')));
        }
      },
      child: Row(
        children: [
          Icon(icon, color: color),
          SizedBox(width: 8),
          Text(label, style: TextStyle(color: Colors.grey[700])),
        ],
      ),
    );
  }

  Widget courseCard(
      String title, int courses, IconData icon, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TrainingCategoryPage(categoryName: title)),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Color(0xFFCBDCEB),
                radius: 30,
                child: Icon(icon, color: Color(0xFF133E87), size: 30),
              ),
              SizedBox(height: 8),
              Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('$courses courses',
                  style: TextStyle(color: Color(0xFF608BC1), fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
