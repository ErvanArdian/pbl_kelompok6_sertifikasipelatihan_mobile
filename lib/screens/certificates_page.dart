import 'package:flutter/material.dart';
import 'upload_certificate_page.dart'; // Import halaman unggah sertifikat

class CertificatesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sertifikat'),
        backgroundColor: Color(0xFF133E87),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Daftar Sertifikat Anda'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UploadSertifikatPage()),
                );
              },
              child: Text('Unggah Sertifikat'),
            ),
          ],
        ),
      ),
    );
  }
}