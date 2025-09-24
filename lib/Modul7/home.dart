//Praktikum
import 'package:flutter/material.dart';
import 'tujuan.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Halaman Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Ini adalah halaman Home",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Tujuan()),
                );
              },
              child: const Text("Ke Halaman Tujuan"),
            ),
          ],
        ),
      ),
    );
  }
}



//tugas
// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: const Text("Ini Halaman Home"),
//       ),
//       body: SingleChildScrollView(
//         // padding body utama (batas luar konten)
//         padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Banyak aplikasi memiliki beberapa layar untuk menampilkan informasi yang berbeda. "
//               "Contohnya, ada layar produk, dan ketika pengguna mengklik produk, "
//               "akan muncul layar dengan detail produk tersebut.",
//               style: TextStyle(fontSize: 16, color: Colors.white),
//               textAlign: TextAlign.justify,
//             ),

//             const SizedBox(height: 20),

//             // Kotak putih tumpul untuk gambar (tengah)
//             Center(
//               child: Container(
//                 width: 200, // lebar kotak
//                 height: 200, // tinggi kotak
//                 margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16), // sudut tumpul
//                 ),
//                 alignment: Alignment.center,
//                 child: Image.asset(
//                   "assets/home.png",
//                   width: 120,
//                   height: 120,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),

//             const Text(
//               "Pertama, kita perlu membuat dua halaman atau 'routes' yang ingin kita tampilkan. "
//               "Selanjutnya, kita gunakan perintah Navigator.push() untuk berpindah dari halaman pertama ke halaman kedua. "
//               "Ini seperti kita membuka halaman baru. Terakhir, kita bisa kembali dari halaman kedua ke halaman pertama "
//               "menggunakan Navigator.pop(). Seperti menutup halaman kedua dan kembali ke halaman pertama.",
//               style: TextStyle(fontSize: 16, color: Colors.white),
//               textAlign: TextAlign.justify,
//             ),

//             const SizedBox(height: 20),

//             Align(
//               alignment: Alignment.center,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red,
//                   foregroundColor: Colors.white,
//                   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                 ),
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/tujuan');
//                 },
//                 child: const Text("Ke halaman tujuan >"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
