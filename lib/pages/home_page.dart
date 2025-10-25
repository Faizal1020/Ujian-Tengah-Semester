import 'package:flutter/material.dart';
import 'category_page.dart';

/// Halaman Beranda (Home Page)
/// Menampilkan logo, kolom pencarian, dan kategori budaya Jawa:
/// - Pakaian Adat
/// - Tari
/// - Alat Musik
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB8956A), // Coklat keemasan
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),

                    // Logo
                    Image.asset(
                      'assets/images/keris_logo.png',
                      height: 120,
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.shield,
                        size: 120,
                        color: Colors.yellow.shade700,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Judul
                    const Text(
                      'Laraska',
                      style: TextStyle(
                        fontSize: 46,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Serif',
                        color: Color(0xFF5C4033),
                        letterSpacing: 2,
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Search Bar
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFD4C4A8),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Cari budaya...',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.shade700,
                          ),
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15),
                        ),
                      ),
                    ),

                    const SizedBox(height: 50),

                    // Kategori
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildCategoryButton(
                          context,
                          icon: Icons.checkroom,
                          label: 'Pakaian Adat',
                          category: 'pakaian',
                        ),
                        _buildCategoryButton(
                          context,
                          icon: Icons.self_improvement,
                          label: 'Tari',
                          category: 'tari',
                        ),
                        _buildCategoryButton(
                          context,
                          icon: Icons.music_note,
                          label: 'Alat Musik',
                          category: 'musik',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Navigation
            _buildBottomNav(context),
          ],
        ),
      ),
    );
  }

  /// Tombol kategori
  Widget _buildCategoryButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String category,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(kategori: category),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: const Color(0xFFF5E6D3),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF8B6F47),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: Icon(
              icon,
              size: 38,
              color: const Color(0xFF5C4033),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 85,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF3E2723),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Bottom Navigation Bar
  Widget _buildBottomNav(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF9B8357),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavIcon(Icons.grid_view, () {}),
          _buildNavIcon(Icons.home, () {}),
          _buildNavIcon(Icons.arrow_back, () {
            Navigator.pop(context);
          }),
        ],
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, VoidCallback onTap) {
    return IconButton(
      icon: Icon(
        icon,
        color: const Color(0xFF3E2723),
        size: 28,
      ),
      onPressed: onTap,
    );
  }
}
