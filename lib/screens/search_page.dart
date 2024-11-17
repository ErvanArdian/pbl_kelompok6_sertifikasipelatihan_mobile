import 'package:flutter/material.dart';
import 'home_page.dart'; // Pastikan untuk mengimpor halaman Home
import 'my_courses_page.dart'; // Pastikan untuk mengimpor halaman My Courses
import 'profile_page.dart'; // Pastikan untuk mengimpor halaman Profile

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  // Daftar kursus yang tersedia
  final List<Map<String, dynamic>> _courses = [
    {
      'title': 'Keamanan Siber dan Jaringan',
      'level': 'Menengah',
      'duration': '5 jam',
      'rating': 4.7,
      'enrolled': '8K Terdaftar',
      'imagePath': 'assets/cyber.jpg',
    },
    {
      'title': 'Data Science Tingkat Lanjut',
      'level': 'Lanjutan',
      'duration': '6 jam',
      'rating': 4.8,
      'enrolled': '8K Terdaftar',
      'imagePath': 'assets/data_science.jpg',
    },
    {
      'title': 'Pengembangan Game dengan Unity',
      'level': 'Lanjutan',
      'duration': '5 jam',
      'rating': 4.7,
      'enrolled': '5K Terdaftar',
      'imagePath': 'assets/game.jpg',
    },
    {
      'title': 'Kecerdasan Buatan dalam Teknologi Modern',
      'level': 'Lanjutan',
      'duration': '7 jam',
      'rating': 4.9,
      'enrolled': '12K Terdaftar',
      'imagePath': 'assets/ai2.jpg',
    },
    {
      'title': 'Analisis Data dan Visualisasi',
      'level': 'Lanjutan',
      'duration': '4.5 jam',
      'rating': 4.6,
      'enrolled': '10K Terdaftar',
      'imagePath': 'assets/data_analyst.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF133E87),
        title: Text('Search', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchText = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                hintText: 'What do you want to learn today?',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Pelatihan Populer',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: _courses
                    .where((course) => course['title'].toLowerCase().contains(_searchText))
                    .map((course) => _buildCourseCard(
                          course['title'],
                          course['level'],
                          course['duration'],
                          course['rating'],
                          course['enrolled'],
                          course['imagePath'],
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF133E87),
        unselectedItemColor: Colors.grey,
        currentIndex: 1, // Set to "Search" as the selected index
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage(username: '',)), // Ganti dengan HomePage Anda
              );
              break;
            case 1:
              // Do nothing, we are already on Search page
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyCoursesPage()), // Ganti dengan MyCoursesPage Anda
              );
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage(username: 'User  ')), // Ganti dengan username yang sesuai
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
      ),
    );
  }

  Widget _buildCourseCard(
    String title,
    String level,
    String duration,
    double rating,
    String enrolled,
    String imagePath,
  ) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(10.0),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            imagePath,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.signal_cellular_alt, size: 16, color: Colors.grey),
                SizedBox(width: 5),
                Text(level, style: TextStyle(color: Colors.grey)),
                SizedBox(width: 10),
                Icon(Icons.access_time, size: 16, color: Colors.grey),
                SizedBox(width: 5),
                Text(duration, style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 4),
                Text(
                  rating.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Text(
                  enrolled,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}