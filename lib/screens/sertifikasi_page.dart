import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'certificate_detail_page.dart';

class SertifikasiPage extends StatefulWidget {
  @override
  _SertifikasiPageState createState() => _SertifikasiPageState();
}

class _SertifikasiPageState extends State<SertifikasiPage> {
  late int idPengguna; // Change to int
  bool _isInitialized = false;
  List<Certificate> _certificates = [];
  bool _isLoading = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  // Load id_pengguna from SharedPreferences
  Future<void> _loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      idPengguna = prefs.getInt('id_pengguna') ?? 0; // Ensure id_pengguna is an int
      _isInitialized = true;
    });
    if (idPengguna != 0) {
      fetchCertificates(idPengguna);
    } else {
      setState(() {
        _errorMessage = 'Invalid user ID';
      });
    }
  }

  Future<void> fetchCertificates(int idPengguna) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await Dio().get('http://192.168.16.252:8000/api/riwayat_sertifikasi?id_pengguna=$idPengguna');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        setState(() {
          _certificates = data.map((item) => Certificate.fromJson(item)).toList();
          _errorMessage = ''; // Clear any previous error message
        });
      } else {
        setState(() {
          _errorMessage = 'Failed to load data from API';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isInitialized
          ? _isLoading
              ? Center(child: CircularProgressIndicator())
              : _errorMessage.isNotEmpty
                  ? Center(child: Text(_errorMessage))
                  : Column(
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
                            itemCount: _certificates.length,
                            itemBuilder: (context, index) {
                              final certificate = _certificates[index];
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
                    )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class Certificate {
  final int idRiwayat;
  final int idPengguna;
  final String? idPelatihan;
  final String levelSertifikasi;
  final String jenisSertifikasi;
  final String namaSertifikasi;
  final String noSertifikat;
  final String tanggalTerbit;
  final String masaBerlaku;
  final int penyelenggara;
  final String dokumenSertifikat;

  Certificate({
    required this.idRiwayat,
    required this.idPengguna,
    this.idPelatihan,
    required this.levelSertifikasi,
    required this.jenisSertifikasi,
    required this.namaSertifikasi,
    required this.noSertifikat,
    required this.tanggalTerbit,
    required this.masaBerlaku,
    required this.penyelenggara,
    required this.dokumenSertifikat,
  });

  factory Certificate.fromJson(Map<String, dynamic> json) {
    return Certificate(
      idRiwayat: json['id_riwayat'],
      idPengguna: json['id_pengguna'],
      idPelatihan: json['id_pelatihan'],
      levelSertifikasi: json['level_sertifikasi'] ?? "No Level",
      jenisSertifikasi: json['jenis_sertifikasi'] ?? "No Type",
      namaSertifikasi: json['nama_sertifikasi'] ?? "No Name",
      noSertifikat: json['no_sertifikat'] ?? "No Number",
      tanggalTerbit: json['tanggal_terbit'] ?? "No Issue Date",
      masaBerlaku: json['masa_berlaku'] ?? "No Expiry Date",
      penyelenggara: json['penyelenggara'] ?? 0,
      dokumenSertifikat: json['dokumen_sertifikat'] ?? "No Document",
    );
  }
}
