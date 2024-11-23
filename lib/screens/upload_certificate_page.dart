import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

// Define color palette
const Color lightBeige = Color(0xFFF3F3E0);
const Color deepBlue = Color(0xFF133E87);
const Color lightBlue = Color(0xFF608BC1);
const Color lightGrayishBlue = Color(0xFFCBDCEB);

class UploadCertificatePage extends StatefulWidget {
  @override
  _UploadCertificatePageState createState() => _UploadCertificatePageState();
}

class _UploadCertificatePageState extends State<UploadCertificatePage> {
  File? _certificateFile;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _certificateFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickFile() async {
    // Memilih file PDF
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _certificateFile = File(result.files.single.path!);
      });
    }
  }

  void _uploadCertificate() {
    if (_certificateFile != null) {
      // Logika untuk mengunggah sertifikat ke server atau menyimpannya
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sertifikat berhasil diunggah!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Silakan pilih sertifikat terlebih dahulu.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Unggah Sertifikat'),
        backgroundColor: deepBlue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            color: lightBeige, // Set background color
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Unggah Sertifikat',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: deepBlue, // Set text color
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 250,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: lightGrayishBlue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _certificateFile != null
                          ? Image.file(
                              _certificateFile!,
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            )
                          : Icon(
                              Icons.cloud_upload,
                              size: 50,
                              color: lightBlue, // Set icon color
                            ),
                      SizedBox(height: 10),
                      Text(
                        _certificateFile != null
                            ? 'Sertifikat siap diunggah'
                            : 'Unggah berkas disini',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: deepBlue, // Set text color
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _pickImage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: deepBlue, // Set button color
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 12,
                          ),
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text('Pilih Gambar'),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: _pickFile,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: deepBlue, // Set button color
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 12,
                          ),
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text('Pilih PDF'),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: _uploadCertificate,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: deepBlue, // Set button color
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 12,
                          ),
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text('Simpan'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}