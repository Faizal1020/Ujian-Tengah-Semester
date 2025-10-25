import 'package:flutter/material.dart';
import '../models/budaya_model.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';

/// Halaman Detail (Detail Page)
/// Menampilkan informasi lengkap tentang item budaya yang dipilih
/// meliputi gambar, deskripsi, sejarah, dan filosofi
class DetailPage extends StatelessWidget {
  final BudayaModel budaya;

  const DetailPage({
    Key? key,
    required this.budaya,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          AppColors.getColorByCategory(budaya.kategori).withOpacity(0.6),
      body: Column(
        children: [
          // ===== HEADER GAMBAR =====
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Stack(
              children: [
                // Gambar utama
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  child: Image.asset(
                    budaya.imagePath,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppColors.divider,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.image_not_supported,
                                  size: 64, color: AppColors.textLight),
                              const SizedBox(height: 8),
                              Text(
                                'Gambar tidak tersedia',
                                style: AppTextStyles.bodyMedium
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Tombol kembali
                Positioned(
                  top: MediaQuery.of(context).padding.top + 8,
                  left: 16,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),

                // Label kategori
                Positioned(
                  top: MediaQuery.of(context).padding.top + 8,
                  right: 16,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.getColorByCategory(budaya.kategori),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      budaya.kategori.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ===== KONTEN SCROLLABLE =====
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Judul
                    Text(
                      budaya.nama,
                      style: AppTextStyles.h1.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 12),

                    // Daerah asal
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            size: 20, color: Colors.white70),
                        const SizedBox(width: 8),
                        Text(
                          budaya.daerah,
                          style:
                              AppTextStyles.h4.copyWith(color: Colors.white70),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Deskripsi singkat
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Colors.white.withOpacity(0.3), width: 1),
                      ),
                      child: Text(
                        budaya.deskripsiSingkat,
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          height: 1.6,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Deskripsi lengkap
                    _buildSection(
                      title: 'Deskripsi',
                      icon: Icons.description,
                      content: budaya.deskripsiLengkap,
                    ),
                    const SizedBox(height: 28),

                    // Sejarah
                    _buildSection(
                      title: 'Sejarah',
                      icon: Icons.history_edu,
                      content: budaya.sejarah,
                    ),
                    const SizedBox(height: 28),

                    // Filosofi
                    _buildSection(
                      title: 'Filosofi',
                      icon: Icons.auto_stories,
                      content: budaya.filosofi,
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      // ===== BOTTOM NAVIGATION BAR =====
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        decoration: BoxDecoration(
          color: AppColors.secondary.withOpacity(0.9),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildBottomNavItem(
              icon: Icons.bookmark_border,
              onTap: () {
                // TODO: fitur bookmark nanti diimplementasikan
              },
            ),
            _buildBottomNavItem(
              icon: Icons.home,
              onTap: () =>
                  Navigator.popUntil(context, (route) => route.isFirst),
            ),
            _buildBottomNavItem(
              icon: Icons.share,
              onTap: () {
                // TODO: fitur share
              },
            ),
          ],
        ),
      ),
    );
  }

  /// ===== WIDGET BAGIAN SECTION =====
  Widget _buildSection({
    required String title,
    required IconData icon,
    required String content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Judul section
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, size: 22, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: AppTextStyles.sectionTitle.copyWith(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Garis pemisah
        Container(
          height: 2,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 16),

        // Isi teks
        Text(
          content,
          style: AppTextStyles.bodyLarge.copyWith(
            color: Colors.white.withOpacity(0.95),
            height: 1.7,
          ),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }

  /// ===== BOTTOM NAVIGATION ICON =====
  Widget _buildBottomNavItem({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return IconButton(
      icon: Icon(icon, color: Colors.white),
      iconSize: 28,
      onPressed: onTap,
    );
  }
}
