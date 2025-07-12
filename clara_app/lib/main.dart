import 'package:clara/screens/home_screen.dart'; // Import file yang baru kamu buat
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clara',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Ganti halaman utama ke HomeScreen
      home: const HomeScreen(),
    );
  }
}
