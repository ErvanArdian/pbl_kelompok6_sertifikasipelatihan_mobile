import 'package:flutter/material.dart';
import '../models/certificate.dart';

class CertificateProvider with ChangeNotifier {
  List<Certificate> _certificates = [];

  List<Certificate> get certificates => _certificates;

  void addCertificate(Certificate certificate) {
    _certificates.add(certificate);
    notifyListeners();
  }
}
