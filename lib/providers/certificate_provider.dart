import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class CertificateProvider with ChangeNotifier {
  List<Certificate> _certificates = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<Certificate> get certificates => _certificates;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  final String apiUrl = "http://192.168.231.252:8000/api/riwayat_sertifikasi"; // Your API URL

  Future<void> fetchCertificates(String idPengguna) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await Dio().get('$apiUrl?id_pengguna=$idPengguna');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        _certificates = data.map((item) {
          return Certificate.fromJson(item);
        }).toList();
        _errorMessage = ''; // Clear any previous error message
      } else {
        _errorMessage = 'Failed to load data from API';
      }
    } catch (e) {
      _errorMessage = 'Error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
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
