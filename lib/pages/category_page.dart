import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../data/budaya_data.dart';
import '../models/budaya_model.dart';
import 'detail_page.dart';

/// Halaman Kategori (Category Page)
/// Menampilkan daftar item budaya berdasarkan kategori yang dipilih
class CategoryPage extends StatefulWidget {
  final String kategori;

  const CategoryPage({
    Key? key,
    required this.kategori,
  }) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late List<BudayaModel> _budayaList;
  List<BudayaModel> _filteredList = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _budayaList = BudayaData.getByKategori(widget.kategori);
    _filteredList = List.from(_budayaList);

    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredList = _budayaList
          .where((item) => item.nama.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  String _getCategoryTitle(String kategori) {
    switch (kategori.toLowerCase()) {
      case 'tari':
        return 'Tari';
      case 'musik':
        return 'Alat Musik';
      case 'pakaian':
        return 'Pakaian Adat';
      default:
        return 'Budaya';
    }
  }

  @override
  Widget build(BuildContext context) {
    final String title = _getCategoryTitle(widget.kategori);

    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSearchBar(title),
                  const SizedBox(height: 28),
                  Text(
                    'Daftar $title',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // List isi
            Expanded(
              child: _filteredList.isEmpty
                  ? _buildEmptyState()
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      itemCount: _filteredList.length,
                      itemBuilder: (context, index) =>
                          _buildBudayaItem(context, _filteredList[index]),
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  /// Widget: Search Bar
  Widget _buildSearchBar(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: AppColors.textSecondary),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _searchController,
              style: TextStyle(color: AppColors.textPrimary),
              decoration: InputDecoration(
                hintText: 'Cari $title...',
                hintStyle: TextStyle(
                  color: AppColors.textLight,
                  fontSize: 16,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Widget: Item Card
  Widget _buildBudayaItem(BuildContext context, BudayaModel budaya) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => DetailPage(budaya: budaya)),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.background.withOpacity(0.8),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // Gambar
            ClipOval(
              child: Image.asset(
                budaya.imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 80,
                  height: 80,
                  color: AppColors.divider,
                  child: Icon(Icons.broken_image, color: AppColors.textLight),
                ),
              ),
            ),
            const SizedBox(width: 16),

            // Info teks
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    budaya.nama,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '21 Oktober 2025',
                    style:
                        TextStyle(fontSize: 12, color: AppColors.textSecondary),
                  ),
                  Text(
                    'Oleh: Faizalv',
                    style:
                        TextStyle(fontSize: 12, color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),

            // Tombol selengkapnya
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Selengkapnya',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Widget: Empty State
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox, size: 80, color: AppColors.textLight),
          const SizedBox(height: 16),
          Text(
            'Belum ada data',
            style: AppTextStyles.h3.copyWith(color: AppColors.textLight),
          ),
        ],
      ),
    );
  }

  /// Widget: Bottom Navigation
  Widget _buildBottomNav(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavIcon(Icons.bookmark_border, () {}),
          _buildNavIcon(
            Icons.home,
            () => Navigator.popUntil(context, (route) => route.isFirst),
          ),
          _buildNavIcon(Icons.arrow_back, () => Navigator.pop(context)),
        ],
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, size: 28, color: AppColors.primary),
      ),
    );
  }
}
