import 'package:flutter/material.dart';
import 'my_courses_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  final String username;
  final int totalPelatihan;
  final int totalSertifikasi;

  HomePage({
    required this.username,
    this.totalPelatihan = 5,
    this.totalSertifikasi = 3,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // Daftar halaman untuk masing-masing item navigation bar
  final List<Widget> _pages = [
    Center(
      child: Text('Home Page'), // Placeholder halaman Home
    ),
    MyCoursesPage(),
    ProfilePage(username: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _currentIndex == 0
          ? _buildHomeContent() // Konten Home khusus
          : _pages[_currentIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xFF133E87),
      elevation: 0,
      automaticallyImplyLeading: false, // This removes the back button
      title: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello,',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              Text(
                'Hi ${widget.username}',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              Text(
                'SkillHub TI',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Image.asset(
                'assets/logojti.jpg', // Replace with the correct path of your image
                height: 30, // Set the size of the logo as needed
                width: 30, // Set the size of the logo as needed
              ),
              SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHomeContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildUserCard(),
          SizedBox(height: 20),
          Text(
            'Explore Features',
            style: TextStyle(
              fontSize: 18,
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
              courseCard('Sertifikasi Aktif', 3, Icons.check_circle, context),
              courseCard('Pelatihan Selesai', 5, Icons.check, context),
              courseCard('Sertifikasi Tidak Berlaku', 1, Icons.cancel, context),
              courseCard('Pelatihan Akan Dijalani', 2, Icons.schedule, context),
            ],
          ),
          // Tambahkan konten lainnya sesuai kebutuhan
        ],
      ),
    );
  }

  Widget _buildUserCard() {
    return GestureDetector(
      onTap: () {
        // Navigate to ProfilePage when the card is clicked
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProfilePage(username: widget.username)),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xFF608BC1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 30, color: Color(0xFF608BC1)),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.username}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Uncomment and add other details if needed
                    // Text(
                    //   '43527*',
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 14,
                    //   ),
                    // ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border.all(color: Color(0xFF608BC1), width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          backgroundColor: Color(0xFF133E87),
          elevation: 0,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Color(0xFFCBDCEB),
          type: BottomNavigationBarType.fixed,
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
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index; // Change the active page index
            });
          },
        ),
      ),
    );
  }

  Widget courseCard(
      String title, int count, IconData icon, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Do nothing on tap as navigation to TrainingCategoryPage is not required
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
              Text('$count',
                  style: TextStyle(color: Color(0xFF608BC1), fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
