import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'training_detail_page.dart';

final Dio dio = Dio(); // Initialize Dio for HTTP requests
String url_domain = "http://192.168.16.252:8000/api/riwayat_pelatihan"; // API URL

class PelatihanPage extends StatefulWidget {
  @override
  _PelatihanPageState createState() => _PelatihanPageState();
}

class _PelatihanPageState extends State<PelatihanPage> {
  List<Map<String, dynamic>> all_data = []; // List to store training data
  bool _isInitialized = false;
  late int idPengguna; // Change to int

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  // Load id_pengguna from SharedPreferences
  Future<void> _loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      idPengguna = prefs.getInt('id_pengguna') ?? 0; // Change to getInt and default to 0
      _isInitialized = true;
    });
    if (idPengguna != 0) {
      fetchTrainingData(idPengguna);
    }
  }

  // Function to fetch training data from API
  Future<void> fetchTrainingData(int idPengguna) async {
    try {
      final response = await dio.get(
        '$url_domain?id_pengguna=$idPengguna',
        options: Options(
          headers: {
            'Content-Type': 'application/json', // Ensure content type is JSON
          },
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        setState(() {
          all_data = data.map((training) {
            return {
              "id_riwayat": training["id_riwayat"],
              "id_pengguna": training["id_pengguna"],
              "id_pelatihan": training["id_pelatihan"],
              "level_pelatihan": training["level_pelatihan"] ?? "No Level",
              "nama_pelatihan": training["nama_pelatihan"] ?? "No Title",
              "tanggal_mulai": training["tanggal_mulai"] ?? "No Start Date",
              "tanggal_selesai": training["tanggal_selesai"] ?? "No End Date",
              "lokasi": training["lokasi"] ?? "No Location",
              "penyelenggara": training["penyelenggara"],
              "dokumen_pelatihan": training["dokumen_pelatihan"] ?? "No Document",
              "tag_mk": training["tag_mk"],
              "tag_bidang_minat": training["tag_bidang_minat"],
              "created_at": training["created_at"],
              "updated_at": training["updated_at"],
              "mk_list": training["mk_list"],
              "bidang_minat_list": training["bidang_minat_list"],
              "id_periode": training["id_periode"],
            };
          }).toList();
        });
      } else {
        throw Exception('Failed to load training data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching training data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isInitialized
          ? all_data.isEmpty
              ? Center(child: CircularProgressIndicator()) // Loader while data is being fetched
              : ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: all_data.length,
                  itemBuilder: (context, index) {
                    final training = all_data[index];
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
                          training["nama_pelatihan"],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF133E87),
                          ),
                        ),
                        subtitle: Text(
                          'Lokasi: ${training["lokasi"]}\nTanggal: ${training["tanggal_mulai"]} - ${training["tanggal_selesai"]}',
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
                              builder: (context) => TrainingDetailPage(
                                title: training["nama_pelatihan"],
                                status: training["level_pelatihan"], // Changed to level_pelatihan
                                description: training["dokumen_pelatihan"],
                                startDate: training["tanggal_mulai"], // Added startDate
                                endDate: training["tanggal_selesai"], // Added endDate
                                location: training["lokasi"],
                                idPengguna: idPengguna, // Pass idPengguna as int
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                )
          : Center(child: CircularProgressIndicator()), // Loader while id_pengguna is being loaded
    );
  }
}
