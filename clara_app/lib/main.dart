// Import file yang baru kamu buat
import 'package:flutter/material.dart';
import 'screens/clara_welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clara App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const ClaraWelcomeScreen(),
    );
  }
}
