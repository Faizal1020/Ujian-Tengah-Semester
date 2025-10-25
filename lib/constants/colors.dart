import 'package:flutter/material.dart';

/// Color Palette berdasarkan Filosofi Budaya Jawa
///
/// Warna-warna ini terinspirasi dari filosofi dan nilai-nilai Jawa:
/// - SOGA (Coklat): Kesederhanaan dan ketenangan
/// - KUNIR (Kuning): Kejayaan dan kemakmuran
/// - Tanah Liat: Kesuburan dan kehidupan
class AppColors {
  // Warna Utama
  static const Color primary = Color(0xFF6B4423); // SOGA - Coklat Jawa
  static const Color secondary = Color(0xFFD4A574); // KUNIR - Kuning Kunyit
  static const Color accent = Color(0xFF8B6F47); // Tanah Liat

  // Background
  static const Color background = Color(0xFFFAF6F1); // Putih Tulang
  static const Color cardBg = Color(0xFFFFFFFF); // Putih Bersih

  // Text Colors
  static const Color textPrimary = Color(0xFF2C1810); // Coklat Tua
  static const Color textSecondary = Color(0xFF6B5A4D); // Coklat Medium
  static const Color textLight = Color(0xFF9B8B7E); // Coklat Muda

  // Category Colors
  static const Color tariColor = Color(0xFFB8860B); // Emas Tua - Tari
  static const Color musikColor = Color(0xFF8B4513); // Saddle Brown - Musik
  static const Color pakaianColor = Color(0xFFCD853F); // Peru - Pakaian

  // Functional Colors
  static const Color divider = Color(0xFFE5D4C1); // Divider
  static const Color shadow = Color(0x1A000000); // Shadow

  /// Get color berdasarkan kategori
  static Color getColorByCategory(String kategori) {
    switch (kategori.toLowerCase()) {
      case 'tari':
        return tariColor;
      case 'musik':
        return musikColor;
      case 'pakaian':
        return pakaianColor;
      default:
        return primary;
    }
  }
}
