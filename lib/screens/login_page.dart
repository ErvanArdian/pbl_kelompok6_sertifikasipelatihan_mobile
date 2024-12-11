import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences
import 'home_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Dio dio = Dio();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMessage = '';
  bool _obscureText = true; // To toggle password visibility

  final Color lightBackground = Color(0xFFF3F3E0); // F3F3E0
  final Color lightBlue = Color(0xFFCBDCEB); // CBDCEB
  final Color mediumBlue = Color(0xFF608BC1); // 608BC1
  final Color darkBlue = Color(0xFF133E87); // 133E87

  final String urlLogin = "http://192.168.231.252:8000/api/login"; // API URL for login

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Show a dialog based on login result
  void showLoginResultDialog(BuildContext context, String message, bool isSuccess, String? penggunaId, String? username) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            isSuccess ? 'Login Berhasil' : 'Login Gagal',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isSuccess ? Colors.green : Colors.red,
            ),
          ),
          content: Text(
            message,
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if (isSuccess && penggunaId != null) {
                    // Save id_pengguna in SharedPreferences
                    saveUserId(penggunaId);
                    navigateToHome(penggunaId); // Pass penggunaId to HomePage
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                ),
                child: const Text('OK', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        );
      },
    );
  }

  // Save id_pengguna to SharedPreferences
  Future<void> saveUserId(String penggunaId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('id_pengguna', penggunaId); // Save id_pengguna as String
  }

  // Navigate to HomePage after successful login
  void navigateToHome(String levelId) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(username: usernameController.text, idJenisPengguna: levelId),
      ),
    );
  }

  // Perform login request
  Future<void> login(String username, String password) async {
    try {
      final response = await dio.post(urlLogin, data: {
        'username': username,
        'password': password,
      });

      if (response.statusCode == 200 && response.data['user'] != null) {
        final data = response.data;
        final String? penggunaId = data['user']['id_jenis_pengguna']?.toString();
        final String? userName = data['user']['nama'] ?? 'Pengguna';
        final String token = data['token']; // Save the token

        if (penggunaId != null && token.isNotEmpty) {
          showLoginResultDialog(context, 'Selamat datang, $userName!', true, penggunaId, userName); // Pass username to the dialog
        } else {
          showLoginResultDialog(context, 'Pengguna ID atau token tidak ditemukan.', false, null, null);
        }
      } else {
        showLoginResultDialog(context, 'Username atau password salah', false, null, null);
      }
    } on DioError catch (e) {
      final errorMessage = e.response?.data['message'] ?? 'Terjadi kesalahan pada server.';
      showLoginResultDialog(context, errorMessage, false, null, null);
    } catch (e) {
      showLoginResultDialog(context, 'Terjadi kesalahan. Silakan coba lagi.', false, null, null);
    } finally {
      usernameController.clear();
      passwordController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Welcome text
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/logojti.jpg',
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              Text(
                'SkillHub TI',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: lightBackground,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                'Silakan masuk untuk melanjutkan',
                style: TextStyle(fontSize: 14, color: lightBlue),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),

              // Username input with rounded corners
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(color: mediumBlue),
                  filled: true,
                  fillColor: lightBackground,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                    borderSide: BorderSide(color: mediumBlue),
                  ),
                  prefixIcon: Icon(
                    Icons.person, // Icon for the username field
                    color: mediumBlue,
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Password input with rounded corners and visibility toggle
              TextField(
                controller: passwordController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: mediumBlue),
                  filled: true,
                  fillColor: lightBackground,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                    borderSide: BorderSide(color: mediumBlue),
                  ),
                  prefixIcon: Icon(
                    Icons.lock, // Icon for the password field
                    color: mediumBlue,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: mediumBlue,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText; // Toggle visibility
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Login button
              ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  login(usernameController.text, passwordController.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: mediumBlue,
                  foregroundColor: lightBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Masuk'),
              ),

              // Error message
              if (errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    errorMessage,
                    style: TextStyle(color: Colors.redAccent),
                    textAlign: TextAlign.center,
                  ),
                ),

              SizedBox(height: 10),

              // Register link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum punya akun?',
                    style: TextStyle(color: lightBackground),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text(
                      'Daftar sekarang',
                      style: TextStyle(color: lightBlue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
