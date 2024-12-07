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
      appBar: AppBar(
        title: Text('Upload Sertifikat'),
        backgroundColor: Color(0xFF133E87),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Center(
                child: Text(
                  'Sertifikasi',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildTextField(
                label: 'Jenis Sertifikat',
                onSaved: (value) {
                  jenisSertifikat = value;
                },
              ),
              _buildTextField(
                label: 'Nama Sertifikat',
                onSaved: (value) {
                  namaSertifikat = value;
                },
              ),
              _buildTextField(
                label: 'Nomor Sertifikat',
                onSaved: (value) {
                  noSertifikat = value;
                },
              ),
              _buildDateField(
                label: 'Tanggal Terbit',
                onDateSelected: (pickedDate) {
                  setState(() {
                    tanggalTerbit = pickedDate;
                  });
                },
                date: tanggalTerbit,
              ),
              _buildDateField(
                label: 'Masa Berlaku',
                onDateSelected: (pickedDate) {
                  setState(() {
                    masaBerlaku = pickedDate;
                  });
                },
                date: masaBerlaku,
              ),
              _buildTextField(
                label: 'Tahun Periode',
                onSaved: (value) {
                  tahunPeriode = value;
                },
              ),
              _buildTextField(
                label: 'Penyelenggara',
                onSaved: (value) {
                  penyelenggara = value;
                },
              ),
              _buildUploadField(),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
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
                  child: Text('Simpan'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF133E87), // Button color
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, required Function(String?)? onSaved}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          fillColor: Colors.grey[200],
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
        onSaved: onSaved,
      ),
    );
  }

  Widget _buildDateField({required String label, required Function(DateTime?) onDateSelected, DateTime? date}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          fillColor: Colors.grey[200],
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
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
    );
  }

  Widget _buildUploadField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: _uploadFile,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[400]!),
          ),
          child: Row(
            children: [
              Icon(Icons.upload_file, color: Colors.grey[700]),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  filePath != null ? filePath! : 'Unggah Berkas',
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),
              TextButton(
                onPressed: _uploadFile,
                child: Text('Tambah berkas'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
