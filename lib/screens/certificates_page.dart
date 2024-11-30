import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/certificate_provider.dart';
import 'upload_certificate_page.dart';
import 'certificate_detail_page.dart';

class CertificatesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sertifikat'),
        backgroundColor: Color(0xFF133E87),
      ),
      body: Consumer<CertificateProvider>(
        builder: (context, certificateProvider, child) {
          return Column(
            children: [
              Text('Daftar Sertifikat Anda'),
              Expanded(
                child: ListView.builder(
                  itemCount: certificateProvider.certificates.length,
                  itemBuilder: (context, index) {
                    final certificate = certificateProvider.certificates[index];
                    return ListTile(
                      title: Text(certificate.namaSertifikat),
                      subtitle: Text('No: ${certificate.noSertifikat}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CertificateDetailPage(certificate: certificate),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
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
          );
        },
      ),
    );
  }
}
