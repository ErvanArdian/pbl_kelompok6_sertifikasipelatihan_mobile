import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import '../models/certificate.dart';
import '../providers/certificate_provider.dart';

class UploadSertifikatPage extends StatefulWidget {
  @override
  _UploadSertifikatPageState createState() => _UploadSertifikatPageState();
}

class _UploadSertifikatPageState extends State<UploadSertifikatPage> {
  final _formKey = GlobalKey<FormState>();
  String? jenisSertifikat;
  String? namaSertifikat;
  String? noSertifikat;
  DateTime? tanggalTerbit;
  DateTime? masaBerlaku;
  String? tahunPeriode;
  String? penyelenggara;
  String? filePath;

  void _uploadFile() async {
    String? selectedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    ).then((result) {
      if (result != null) {
        return result.files.single.path;
      }
      return null;
    });

    setState(() {
      filePath = selectedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Sertifikat')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildCard(
                label: 'Jenis Sertifikat',
                onSaved: (value) {
                  jenisSertifikat = value;
                },
              ),
              _buildCard(
                label: 'Nama Sertifikat',
                onSaved: (value) {
                  namaSertifikat = value;
                },
              ),
              _buildCard(
                label: 'No Sertifikat',
                onSaved: (value) {
                  noSertifikat = value;
                },
              ),
              _buildDateCard(
                label: 'Tanggal Terbit',
                onDateSelected: (pickedDate) {
                  setState(() {
                    tanggalTerbit = pickedDate;
                  });
                },
                date: tanggalTerbit,
              ),
              _buildDateCard(
                label: 'Masa Berlaku',
                onDateSelected: (pickedDate) {
                  setState(() {
                    masaBerlaku = pickedDate;
                  });
                },
                date: masaBerlaku,
              ),
              _buildCard(
                label: 'Tahun Periode',
                onSaved: (value) {
                  tahunPeriode = value;
                },
              ),
              _buildCard(
                label: 'Penyelenggara',
                onSaved: (value) {
                  penyelenggara = value;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _uploadFile,
                child: Text('Upload Dokumen Sertifikat'),
              ),
              if (filePath != null) Text('File yang diunggah: $filePath'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final newCertificate = Certificate(
                      jenisSertifikat: jenisSertifikat!,
                      namaSertifikat: namaSertifikat!,
                      noSertifikat: noSertifikat!,
                      tanggalTerbit: tanggalTerbit!,
                      masaBerlaku: masaBerlaku!,
                      tahunPeriode: tahunPeriode!,
                      penyelenggara: penyelenggara!,
                      filePath: filePath!,
                    );

                    Provider.of<CertificateProvider>(context, listen: false)
                        .addCertificate(newCertificate);
                    Navigator.pop(context);
                  }
                },
                child: Text('Simpan Data Sertifikat'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required String label, required Function(String?)? onSaved}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextFormField(
          decoration: InputDecoration(labelText: label),
          onSaved: onSaved,
        ),
      ),
    );
  }

  Widget _buildDateCard({required String label, required Function(DateTime?) onDateSelected, DateTime? date}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextFormField(
          decoration: InputDecoration(labelText: label),
          readOnly: true,
          controller: TextEditingController(
            text: date != null ? "${date.day}/${date.month}/${date.year}" : "",
          ),
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );
            if (pickedDate != null) {
              onDateSelected(pickedDate);
            }
          },
        ),
      ),
    );
  }
}
