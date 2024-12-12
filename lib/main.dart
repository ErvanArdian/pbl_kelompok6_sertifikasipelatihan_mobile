import 'package:flutter/material.dart';
import 'screens/landing_page.dart'; // Import SertifikasiPage instead of LandingPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pelatihan & Sertifikasi',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LandingPage(), // Set SertifikasiPage as the home
    );
  }
}
