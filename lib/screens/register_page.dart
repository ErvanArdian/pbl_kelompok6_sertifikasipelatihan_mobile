import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  String errorMessage = '';
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  // Colors based on the provided color palette
  final Color lightBackground = Color(0xFFF3F3E0);  // F3F3E0
  final Color lightBlue = Color(0xFFCBDCEB);         // CBDCEB
  final Color mediumBlue = Color(0xFF608BC1);        // 608BC1
  final Color darkBlue = Color(0xFF133E87);          // 133E87

  void _register() {
    if (usernameController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      setState(() {
        errorMessage = 'Username, password, and confirm password must be filled out';
      });
    } else if (passwordController.text != confirmPasswordController.text) {
      setState(() {
        errorMessage = 'Passwords do not match';
      });
    } else {
      // Perform registration logic (e.g., save to a database)
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      appBar: AppBar(
        backgroundColor: mediumBlue,
        title: const Text('Register'),
        centerTitle: true,
        automaticallyImplyLeading: true,  // To show the back button
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Username input
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(color: mediumBlue),
                  filled: true,
                  fillColor: lightBackground,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: mediumBlue),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Password input with eye icon
              TextField(
                controller: passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: mediumBlue),
                  filled: true,
                  fillColor: lightBackground,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: mediumBlue),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: mediumBlue,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Confirm Password input with eye icon
              TextField(
                controller: confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(color: mediumBlue),
                  filled: true,
                  fillColor: lightBackground,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: mediumBlue),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                      color: mediumBlue,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Register button
              ElevatedButton(
                onPressed: _register,
                style: ElevatedButton.styleFrom(
                  backgroundColor: mediumBlue,
                  foregroundColor: lightBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Register'),
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

              // Login link
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sudah memiliki akun?",
                    style: TextStyle(color: lightBlue),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Go back to login
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: mediumBlue),
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
