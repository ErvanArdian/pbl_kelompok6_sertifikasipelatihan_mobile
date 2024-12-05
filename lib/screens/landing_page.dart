import 'package:flutter/material.dart';
import 'login_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF133E87), // Dark background color (133E87)
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo with shadow effect
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

                // Main title text with gradient effect
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: const Color(
                          0xFFCBDCEB), // Light blue text color (CBDCEB)
                      shadows: [
                        Shadow(
                          blurRadius: 6.0,
                          color: Colors.black.withOpacity(0.4),
                          offset: const Offset(1.0, 1.0),
                        ),
                      ],
                    ),
                    children: const [
                      TextSpan(text: 'SkillHub TI\n'),
                      TextSpan(text: 'Sistem Pelatihan & Sertifikasi'),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // Start button with shadow and rounded corners
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(
                        0xFFF3F3E0), // Light background color (F3F3E0)
                    backgroundColor: const Color(
                        0xFF608BC1), // Medium blue background (608BC1)
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 8,
                    shadowColor: Colors.black.withOpacity(0.3),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: const Text(
                    'Mulai Sekarang',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 30),

                // Additional call-to-action text
                const Text(
                  'Kelola pelatihan dan sertifikasi Anda dengan mudah!\n Jurusan Teknologi Informasi\n Politeknik Negeri Malang',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFFCBDCEB), // Light blue text color (CBDCEB)
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}
