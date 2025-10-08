// lib/view/detail.dart
import 'package:flutter/material.dart';
import 'package:game_app/model/game.dart';
import 'package:game_app/viewmodel/fetchgame.dart';
import 'package:readmore/readmore.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final int gameId = ModalRoute.of(context)?.settings.arguments as int;

    return Scaffold(
      backgroundColor: Colors.amberAccent.shade400, // warna kuning luar
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title: const Text('Detail Game', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<Game>(
        future: fetchGameDetail(gameId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('Data tidak ditemukan.'));
          }

          final game = snapshot.data!;

          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Gambar utama di bagian atas (melebar penuh), dengan sudut bawah melengkung
                  Container(
                    width: double.infinity,
                    height: 260,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                      child: Image.network(
                        game.thumbnail,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: Colors.grey,
                          child: const Center(child: Icon(Icons.broken_image)),
                        ),
                      ),
                    ),
                  ),

                  // Kolom biru yang menempel di bawah gambar (meng-overlap sedikit)
                  // Transform digunakan untuk "mengangkat" kolom agar menempel ke gambar
                  Transform.translate(
                    offset: const Offset(0, -40),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100, // warna kolom biru
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.12),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Judul dan info kecil
                          Text(
                            game.title,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '${game.genre} • ${game.platform}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          const SizedBox(height: 12),

                          // ===== Minimum System Requirements (dalam box putih kecil) =====
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Minimum System Requirements',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                _reqRow('OS',
                                    game.minimumSystemRequirements?['os']),
                                _reqRow(
                                    'Processor',
                                    game.minimumSystemRequirements?[
                                        'processor']),
                                _reqRow('Memory',
                                    game.minimumSystemRequirements?['memory']),
                                _reqRow(
                                    'Graphics',
                                    game.minimumSystemRequirements?[
                                        'graphics']),
                                _reqRow('Storage',
                                    game.minimumSystemRequirements?['storage']),
                              ],
                            ),
                          ),

                          const SizedBox(height: 12),

                          // ===== Screenshots horizontal =====
                          if (game.screenshots != null &&
                              game.screenshots!.isNotEmpty)
                            SizedBox(
                              height: 120,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: game.screenshots!.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(width: 10),
                                itemBuilder: (context, index) {
                                  final img = game.screenshots![index]['image']
                                      as String?;
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      img ?? '',
                                      width: 200,
                                      height: 120,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) => Container(
                                        width: 200,
                                        height: 120,
                                        color: Colors.grey.shade300,
                                        child: const Icon(Icons.broken_image),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

                          const SizedBox(height: 12),

                          // ===== Deskripsi (tetap di dalam kolom biru) =====
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50, // lebih terang
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ReadMoreText(
                              game.description ?? 'Deskripsi tidak tersedia.',
                              trimLines: 4,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: ' Baca selengkapnya',
                              trimExpandedText: ' Tutup',
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),

                          const SizedBox(height: 8),

                          // Tombol kunjungi situs (opsional)
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue.shade700,
                              ),
                              onPressed: () {
                                // untuk sekarang hanya notifikasi (bisa ditambahkan launch url)
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'URL: ${game.gameUrl.isNotEmpty ? game.gameUrl : "tidak tersedia"}'),
                                  ),
                                );
                              },
                              child: const Text('Kunjungi Situs'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // beri ruang bawah supaya tidak menempel ke tepi layar
                  const SizedBox(height: 24),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _reqRow(String title, dynamic value) {
    final v = (value is String) ? value : (value?.toString() ?? '-');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(width: 100, child: Text(title)),
          const SizedBox(width: 4),
          const Text(':'),
          const SizedBox(width: 8),
          Expanded(child: Text(v)),
        ],
      ),
    );
  }
}
