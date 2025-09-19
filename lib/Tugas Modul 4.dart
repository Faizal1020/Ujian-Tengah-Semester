import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(), // background gelap
      home: const MusicControlScreen(),
    );
  }
}

class MusicControlScreen extends StatelessWidget {
  const MusicControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Konten utama kosong / placeholder
      body: const Center(
        child: Text(
          'Koplo Songs',
          style: TextStyle(fontSize: 20),
        ),
      ),

      // Bottom Control Bar
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        color: Colors.black54,
        child: Row(
          children: [
            // Tombol Shuffle
            Expanded(
              child: IconButton(
                icon: const Icon(Icons.shuffle, color: Colors.white),
                onPressed: () {},
              ),
            ),

            // Tombol Previous
            Expanded(
              child: IconButton(
                icon: const Icon(Icons.skip_previous, color: Colors.white),
                onPressed: () {},
              ),
            ),

            // Tombol Play lebih besar pakai Flexible
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: IconButton(
                iconSize: 48, // lebih besar
                icon: const Icon(Icons.play_circle_fill, color: Colors.white),
                onPressed: () {},
              ),
            ),

            // Tombol Next
            Expanded(
              child: IconButton(
                icon: const Icon(Icons.skip_next, color: Colors.white),
                onPressed: () {},
              ),
            ),

            // Tombol Repeat
            Expanded(
              child: IconButton(
                icon: const Icon(Icons.repeat, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
