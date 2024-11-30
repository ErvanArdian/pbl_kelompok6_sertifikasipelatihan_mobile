import 'package:flutter/material.dart';
import '../models/certificate.dart';

class CertificateDetailPage extends StatelessWidget {
  final Certificate certificate;

  CertificateDetailPage({required this.certificate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Sertifikat'),
        backgroundColor: Color(0xFF133E87),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama Sertifikat: ${certificate.namaSertifikat}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('Jenis Sertifikat: ${certificate.jenisSertifikat}'),
              SizedBox(height: 10),
              Text('No Sertifikat: ${certificate.noSertifikat}'),
              SizedBox(height: 10),
              Text('Tanggal Terbit: ${certificate.tanggalTerbit.day}/${certificate.tanggalTerbit.month}/${certificate.tanggalTerbit.year}'),
              SizedBox(height: 10),
              Text('Masa Berlaku: ${certificate.masaBerlaku.day}/${certificate.masaBerlaku.month}/${certificate.masaBerlaku.year}'),
              SizedBox(height: 10),
              Text('Tahun Periode: ${certificate.tahunPeriode}'),
              SizedBox(height: 10),
              Text('Penyelenggara: ${certificate.penyelenggara}'),
              SizedBox(height: 20),
              if (certificate.filePath != null) 
                Text('File: ${certificate.filePath}'),
            ],
          ),
        ),
      ),
    );
  }
}
