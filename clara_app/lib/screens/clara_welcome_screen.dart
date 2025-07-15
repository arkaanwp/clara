import 'package:flutter/material.dart';

class ClaraWelcomeScreen extends StatelessWidget {
  const ClaraWelcomeScreen({super.key});

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
              'assets/clara/Normal.png',
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
