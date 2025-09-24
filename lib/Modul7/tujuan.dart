import 'package:flutter/material.dart';

class Tujuan extends StatelessWidget {
  const Tujuan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Halaman Tujuan")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Ini adalah halaman Tujuan",
                style: TextStyle(fontSize: 20)),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Kembali ke Home"),
            ),
          ],
        ),
      ),
    );
  }
}



//tugas
// import 'package:flutter/material.dart';

// class TujuanPage extends StatelessWidget {
//   const TujuanPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.red,
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         title: const Text("Ini Halaman Tujuan"),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20), // batas kanan kiri atas bawah
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Untuk berpindah ke halaman baru, gunakan metode Navigator.push(). "
//               "Metode push() akan menambahkan Route ke dalam tumpukan Route yang dikelola oleh Navigator. "
//               "Route ini dapat dibuat secara kustom atau menggunakan MaterialPageRoute, "
//               "yang memiliki animasi transisi sesuai dengan platform yang digunakan.",
//               style: TextStyle(fontSize: 16, color: Colors.white),
//               textAlign: TextAlign.justify,
//             ),

//             const SizedBox(height: 20),

//             // Kotak putih tumpul untuk gambar (tengah)
//             Center(
//               child: Container(
//                 width: 200,  // lebar kotak
//                 height: 200, // tinggi kotak
//                 margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16), // sudut tumpul
//                 ),
//                 alignment: Alignment.center,
//                 child: Image.asset(
//                   "assets/iceland.png", // ganti sesuai nama file asset Anda
//                   width: 120,
//                   height: 120,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),

//             const Text(
//               "Untuk menutup halaman kedua dan kembali ke halaman pertama, gunakan metode Navigator.pop(). "
//               "Metode pop() akan menghapus Route saat ini dari tumpukan Route yang dikelola oleh Navigator.",
//               style: TextStyle(fontSize: 16, color: Colors.white),
//               textAlign: TextAlign.justify,
//             ),

//             const SizedBox(height: 20),

//             Align(
//               alignment: Alignment.center,
//               child: ElevatedButton.icon(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   foregroundColor: Colors.white,
//                   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                 ),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: const Icon(Icons.arrow_back),
//                 label: const Text("Kembali ke home"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
