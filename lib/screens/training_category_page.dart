import 'package:flutter/material.dart';

class TrainingCategoryPage extends StatelessWidget {
  final String categoryName;

  TrainingCategoryPage({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF133E87),
        title: Text(categoryName, style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Example card for training program with image
          trainingCard(
            'Artificial Intelligence',
            'January 2024',
            'Kota A',
            1750000,
            50,
            'assets/ai_training.jpg', // Image asset
            context,
          ),
          SizedBox(height: 12), // Reduced space between cards
          trainingCard(
            'Cyber Security',
            'February 2024',
            'Kota B',
            1500000,
            60,
            'assets/cyber.jpg', // Image asset
            context,
          ),
          // Add more training programs here
        ],
      ),
    );
  }

  Widget trainingCard(String name, String date, String location, int cost,
      int quota, String imageUrl, BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.only(
          bottom: 12), // Reduced margin for smaller gap between cards
      child: Column(
        children: [
          // Image section
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              imageUrl,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          // Card content
          ListTile(
            title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Date: $date'),
                Text('Location: $location'),
                Text('Biaya: \Rp $cost'),
                Text('Kuota: $quota'),
              ],
            ),
            trailing: ElevatedButton(
              onPressed: () {
                // Navigate to the registration page
              },
              child: Text('Detail'),
            ),
          ),
        ],
      ),
    );
  }
}
