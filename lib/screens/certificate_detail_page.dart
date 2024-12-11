import 'package:flutter/material.dart';
import '../providers/certificate_provider.dart';

class CertificateDetailPage extends StatelessWidget {
  final Certificate certificate;

  CertificateDetailPage({required this.certificate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(certificate.namaSertifikasi),
        backgroundColor: const Color(0xFF133E87),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Sertifikasi: ${certificate.namaSertifikasi}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Nomor Sertifikat: ${certificate.noSertifikat}'),
            SizedBox(height: 8),
            Text('Level Sertifikasi: ${certificate.levelSertifikasi}'),
            SizedBox(height: 8),
            Text('Jenis Sertifikasi: ${certificate.jenisSertifikasi}'),
            SizedBox(height: 8),
            Text('Tanggal Terbit: ${certificate.tanggalTerbit}'),
            SizedBox(height: 8),
            Text('Masa Berlaku: ${certificate.masaBerlaku}'),
            SizedBox(height: 8),
            Text('Penyelenggara: ${certificate.penyelenggara}'),
            SizedBox(height: 8),
            if (certificate.dokumenSertifikat.isNotEmpty)
              Text('Dokumen Sertifikat: ${certificate.dokumenSertifikat}'),
          ],
        ),
      ),
    );
  }
}
