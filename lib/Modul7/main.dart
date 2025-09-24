//Praktikum
import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
//tugas (Hapus komen tugas cmn sing prak jadi di komen)
// import 'package:flutter/material.dart';
// import 'home.dart';
// import 'tujuan.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const HomePage(),
//         '/tujuan': (context) => const TujuanPage(),
//       },
//     );
//   }
// }
