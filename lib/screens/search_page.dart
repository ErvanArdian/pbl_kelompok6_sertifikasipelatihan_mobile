import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
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
                children: [
                  _buildCourseCard(
                    'Keamanan Siber dan Jaringan',
                    'Menengah',
                    '5 jam',
                    4.7,
                    '8K Terdaftar',
                    'assets/cyber.jpg', // Add path to your image assets
                  ),
                  _buildCourseCard(
                    'Data Science Tingkat Lanjut',
                    'Lanjutan',
                    '6 jam',
                    4.8,
                    '8K Terdaftar',
                    'assets/data_science.jpg',
                  ),
                  _buildCourseCard(
                    'Pengembangan Game dengan Unity',
                    'Lanjutan',
                    '5 jam',
                    4.7,
                    '5K Terdaftar',
                    'assets/game.jpg',
                  ),
                  _buildCourseCard(
                    'Kecerdasan Buatan dalam Teknologi Modern',
                    'Lanjutan',
                    '7 jam',
                    4.9,
                    '12K Terdaftar',
                    'assets/ai2.jpeg',
                  ),
                  _buildCourseCard(
                    'Analisis Data dan Visualisasi',
                    'Lanjutan',
                    '4.5 jam',
                    4.6,
                    '10K Terdaftar',
                    'assets/data_analyst.jpg',
                  ),
                ],
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
          // Handle navigation
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