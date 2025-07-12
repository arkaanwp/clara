import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Warna latar belakang yang lembut
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: const Text('Clara'),
        backgroundColor: Colors.lightBlue[100],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ini adalah avatar "Clara" seperti di dokumen [cite: 32]
            const CircleAvatar(
              radius: 50,
              // Kamu bisa ganti dengan gambar nantinya
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 20),

            // Sapaan untuk pengguna
            const Text(
              'Selamat datang, Ibu Wati!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Siap mencatat transaksi hari ini?',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 40),

            // Ini tombol utama "ketuk-untuk-berbicara" [cite: 32]
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Di segmen selanjutnya, kita akan tambahkan fungsi rekam suara di sini
                print("Tombol rekam ditekan!");
              },
              icon: const Icon(Icons.mic, size: 40),
              label: const Text('Ketuk untuk Bicara'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                textStyle: const TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
