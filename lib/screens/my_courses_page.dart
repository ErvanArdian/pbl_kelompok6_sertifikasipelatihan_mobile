import 'package:flutter/material.dart';

// Define color palette
const Color lightBeige = Color(0xFFF3F3E0);
const Color deepBlue = Color(0xFF133E87);
const Color lightBlue = Color(0xFF608BC1);
const Color lightGrayishBlue = Color(0xFFCBDCEB);

class MyCoursesPage extends StatefulWidget {
  @override
  _MyCoursesPageState createState() => _MyCoursesPageState();
}

class _MyCoursesPageState extends State<MyCoursesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Courses', style: TextStyle(color: Colors.white)),
        backgroundColor: deepBlue,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Pengajuan'),
            Tab(text: 'Pelatihan'),
          ],
          indicatorColor: lightBeige, // Tab indicator color
          labelColor: Colors.white, // Color of the selected tab text
          unselectedLabelColor:
              lightGrayishBlue, // Color of the unselected tab text
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PengajuanTab(),
          PelatihanTab(),
        ],
      ),
    );
  }
}

class PengajuanTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10), // Add padding around the ListView
      itemCount: 5, // Replace with the actual count of Pengajuan
      itemBuilder: (context, index) {
        return Card(
          color: lightGrayishBlue, // Card background color
          elevation: 4.0, // Card shadow for elevation
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners for card
          ),
          margin: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal:
                  10.0), // Horizontal and vertical margins between cards
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(
                vertical: 10, horizontal: 16), // Padding inside the card
            title: Text(
              'Pengajuan Pelatihan ${index + 1}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: deepBlue,
              ),
            ),
            subtitle: Text(
              'Status: Menunggu Persetujuan',
              style: TextStyle(color: lightBlue),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: deepBlue,
            ),
            onTap: () {
              // Add action on tap if necessary
            },
          ),
        );
      },
    );
  }
}

class PelatihanTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10), // Add padding around the ListView
      itemCount: 5, // Replace with the actual count of Pelatihan
      itemBuilder: (context, index) {
        return Card(
          color: lightGrayishBlue, // Card background color
          elevation: 4.0, // Card shadow for elevation
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners for card
          ),
          margin: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal:
                  10.0), // Horizontal and vertical margins between cards
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(
                vertical: 10, horizontal: 16), // Padding inside the card
            title: Text(
              'Pelatihan ${index + 1}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: deepBlue,
              ),
            ),
            subtitle: Text(
              'Status: Sedang Berlangsung',
              style: TextStyle(color: lightBlue),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: deepBlue,
            ),
            onTap: () {
              // Add action on tap if necessary
            },
          ),
        );
      },
    );
  }
}
