import 'dart:async';
import 'package:flutter/material.dart';
import 'clara_ask_identity_screen.dart';

class ClaraWelcomeScreen extends StatefulWidget {
  const ClaraWelcomeScreen({super.key});

  @override
  State<ClaraWelcomeScreen> createState() => _ClaraWelcomeScreenState();
}

class _ClaraWelcomeScreenState extends State<ClaraWelcomeScreen> {
  @override
  void initState() {
    super.initState();
    // Navigasi otomatis ke screen berikutnya setelah 2 detik
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ClaraAskIdentityScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Avatar Clara
            Image.asset(
              'assets/clara/normal.png',
              width: 350,
              height: 350,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 32),
            // Greeting text
            const Text(
              'Halo!\nAku Clara!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
