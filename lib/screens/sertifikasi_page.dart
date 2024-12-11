import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/certificate_provider.dart';
import 'certificate_detail_page.dart';

class SertifikasiPage extends StatefulWidget {
  @override
  _SertifikasiPageState createState() => _SertifikasiPageState();
}

class _SertifikasiPageState extends State<SertifikasiPage> {
  late String idPengguna;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  // Load id_pengguna from SharedPreferences
  Future<void> _loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      idPengguna = prefs.getString('id_pengguna') ?? '';
      _isInitialized = true;
    });
    if (idPengguna.isNotEmpty) {
      Provider.of<CertificateProvider>(context, listen: false).fetchCertificates(idPengguna);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isInitialized
          ? Consumer<CertificateProvider>(
              builder: (context, certificateProvider, child) {
                if (certificateProvider.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                if (certificateProvider.errorMessage.isNotEmpty) {
                  return Center(child: Text(certificateProvider.errorMessage));
                }

                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Daftar Sertifikat Anda',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF133E87),
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
                            color: const Color(0xFFCBDCEB),
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                              title: Text(
                                certificate.namaSertifikasi,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF133E87),
                                ),
                              ),
                              subtitle: Text(
                                'No: ${certificate.noSertifikat}',
                                style: TextStyle(color: const Color(0xFF608BC1)),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: const Color(0xFF133E87),
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
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
