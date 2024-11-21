import 'package:flutter/material.dart';

// Define color palette
const Color lightBeige = Color(0xFFF3F3E0);
const Color deepBlue = Color(0xFF133E87);
const Color lightBlue = Color(0xFF608BC1);
const Color lightGrayishBlue = Color(0xFFCBDCEB);

class TrainingDetailPage extends StatelessWidget {
  final String title;
  final String status;
  final String description;
  final String date; // Menambahkan parameter tanggal
  final String location; // Menambahkan parameter lokasi
  final String cost; // Menambahkan parameter biaya
  final String quota; // Menambahkan parameter kuota
  final List<String> materials; // Menambahkan parameter materi pelatihan
  final String speaker; // Menambahkan parameter pembicara

  TrainingDetailPage({
    required this.title,
    required this.status,
    required this.description,
    required this.date,
    required this.location,
    required this.cost,
    required this.quota,
    required this.materials,
    required this.speaker,
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
              'Status: $status',
              style: TextStyle(fontSize: 18, color: lightBlue),
            ),
            SizedBox(height: 10),
            Text(
              'Tanggal: $date',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Lokasi: $location',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Biaya: $cost',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Kuota: $quota',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Deskripsi: $description',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Materi Pelatihan:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...materials.map((material) => Text(' - $material')).toList(),
            SizedBox(height: 20),
            Text(
              'Pembicara: $speaker',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

// Contoh penggunaan TrainingDetailPage
// Anda dapat menginisialisasi halaman ini dengan data pelatihan berikut di tempat lain dalam aplikasi Anda.
void main() {
  runApp(MaterialApp(
    home: TrainingDetailPage(
      title: 'AI Training Program',
      status: 'Tersedia',
      description: 'Pelatihan ini dirancang untuk memberikan pemahaman mendalam tentang konsep dasar kecerdasan buatan (AI) dan aplikasinya dalam berbagai industri.',
      date: 'Januari 2024',
      location: 'Location A',
      cost: 'RP 1.000.000',
      quota: '50 Peserta',
      materials: [
        'Pengenalan Kecerdasan Buatan',
        'Algoritma Machine Learning',
        'Deep Learning dan Jaringan Saraf Tiruan',
        'Studi Kasus dan Proyek Praktis',
      ],
      speaker: 'Dr. Jane Doe, Ahli Kecerdasan Buatan dengan pengalaman lebih dari 10 tahun di industri.',
    ),
  ));
}