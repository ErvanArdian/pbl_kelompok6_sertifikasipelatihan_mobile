import 'package:flutter/material.dart';

// Define color palette
const Color lightBeige = Color(0xFFF3F3E0);
const Color deepBlue = Color(0xFF133E87);
const Color lightBlue = Color(0xFF608BC1);
const Color lightGrayishBlue = Color(0xFFCBDCEB);

class TrainingDetailPage extends StatelessWidget {
  final String title;
  final String status; // This now represents the "Level Pelatihan"
  final String description;
  final String startDate; // Menambahkan parameter tanggal mulai
  final String endDate; // Menambahkan parameter tanggal selesai
  final String location; // Menambahkan parameter lokasi 
  final String idPengguna; // Menambahkan parameter id_pengguna

  TrainingDetailPage({
    required this.title,
    required this.status,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.idPengguna, // Menambahkan parameter id_pengguna
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: Colors.white)),
        backgroundColor: deepBlue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: deepBlue),
            ),
            SizedBox(height: 10),
            Text(
              'Level Pelatihan: $status', // Changed to Level Pelatihan
              style: TextStyle(fontSize: 18, color: lightBlue),
            ),
            SizedBox(height: 10),
            Text(
              'Tanggal Mulai: $startDate', // Tanggal Mulai
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Tanggal Selesai: $endDate', // Tanggal Selesai
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Lokasi: $location',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Deskripsi: $description',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
