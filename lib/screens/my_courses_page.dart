import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'training_detail_page.dart';
import '../providers/certificate_provider.dart';
import 'upload_certificate_page.dart';
import 'certificate_detail_page.dart';

// Define color palette
const Color lightBeige = Color(0xFFF3F3E0);
const Color deepBlue = Color(0xFF133E87);
const Color lightBlue = Color(0xFF608BC1);
const Color lightGrayishBlue = Color(0xFFCBDCEB);


final Dio dio = Dio();
var all_data = [];

String url_domain = "http://10.208.18.217:8000/"; 

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
      // Remove the AppBar and BottomNavigationBar
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildSertifikasiTab(),
          _buildPelatihanTab(),
        ],
      ),
      floatingActionButton: _tabController.index == 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UploadSertifikatPage()),
                );
              },
              backgroundColor: deepBlue,
              child: Icon(Icons.add, color: Colors.white),
            )
          : null,
    );
  }

  Widget _buildSertifikasiTab() {
    return Consumer<CertificateProvider>(
      builder: (context, certificateProvider, child) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Daftar Sertifikat Anda',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: deepBlue,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: certificateProvider.certificates.length,
                itemBuilder: (context, index) {
                  final certificate = certificateProvider.certificates[index];
                  return Card(
                    color: lightGrayishBlue,
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      title: Text(
                        certificate.namaSertifikat,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: deepBlue,
                        ),
                      ),
                      subtitle: Text(
                        'No: ${certificate.noSertifikat}',
                        style: TextStyle(color: lightBlue),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: deepBlue,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CertificateDetailPage(certificate: certificate),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPelatihanTab() {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: 1, // Update to 1 for the AI Training Program
      itemBuilder: (context, index) {
        return Card(
          color: lightGrayishBlue,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            title: Text(
              'AI Training Program',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: deepBlue,
              ),
            ),
            subtitle: Text(
              'Status: Berjalan',
              style: TextStyle(color: lightBlue),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: deepBlue,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrainingDetailPage(
                    title: 'AI Training Program',
                    status: 'Berjalan',
                    description: 'Pelatihan ini dirancang untuk memberikan pemahaman mendalam tentang konsep dasar kecerdasan buatan (AI) dan aplikasinya dalam berbagai industri.',
                    date: 'Januari 2024',
                    location: 'JL. Suekarno Hatta',
                    cost: 'RP 1.000.000',
                    quota: '50 Peserta',
                    materials: [
                      'Pengenalan Kecerdasan Buatan',
                      'Algoritma Machine Learning',
                      'Deep Learning dan Jaringan Saraf Tiruan',
                      'Studi Kasus dan Proyek Praktis',
                    ],
                    speaker: 'Dr. Budi Arie, Ahli Kecerdasan Buatan dengan pengalaman lebih dari 10 tahun di industri.',
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}