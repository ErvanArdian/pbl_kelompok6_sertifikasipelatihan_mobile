import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/landing_page.dart';
import 'providers/certificate_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CertificateProvider(),
      child: MaterialApp(
        title: 'Pelatihan & Sertifikasi',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: LandingPage(),
      ),
    );
  }
}
