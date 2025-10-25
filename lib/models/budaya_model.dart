/// Model untuk data budaya Jawa
///
/// Model ini dirancang agar mudah di-migrate ke API Laravel nantinya
/// dengan menambahkan factory fromJson dan method toJson
class BudayaModel {
  final int id;
  final String nama;
  final String kategori; // "tari", "musik", "pakaian"
  final String daerah;
  final String deskripsiSingkat;
  final String deskripsiLengkap;
  final String sejarah;
  final String filosofi;
  final String imagePath; // Path lokal untuk UTS, bisa jadi URL untuk API

  BudayaModel({
    required this.id,
    required this.nama,
    required this.kategori,
    required this.daerah,
    required this.deskripsiSingkat,
    required this.deskripsiLengkap,
    required this.sejarah,
    required this.filosofi,
    required this.imagePath,
  });

  /// Factory untuk parsing dari JSON (untuk persiapan API Laravel)
  factory BudayaModel.fromJson(Map<String, dynamic> json) {
    return BudayaModel(
      id: json['id'],
      nama: json['nama'],
      kategori: json['kategori'],
      daerah: json['daerah'],
      deskripsiSingkat: json['deskripsi_singkat'],
      deskripsiLengkap: json['deskripsi_lengkap'],
      sejarah: json['sejarah'],
      filosofi: json['filosofi'],
      imagePath: json['image_path'], // Bisa jadi image_url dari API
    );
  }

  /// Convert model ke JSON (untuk persiapan API Laravel)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'kategori': kategori,
      'daerah': daerah,
      'deskripsi_singkat': deskripsiSingkat,
      'deskripsi_lengkap': deskripsiLengkap,
      'sejarah': sejarah,
      'filosofi': filosofi,
      'image_path': imagePath,
    };
  }

  /// Copy with method untuk update data
  BudayaModel copyWith({
    int? id,
    String? nama,
    String? kategori,
    String? daerah,
    String? deskripsiSingkat,
    String? deskripsiLengkap,
    String? sejarah,
    String? filosofi,
    String? imagePath,
  }) {
    return BudayaModel(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      kategori: kategori ?? this.kategori,
      daerah: daerah ?? this.daerah,
      deskripsiSingkat: deskripsiSingkat ?? this.deskripsiSingkat,
      deskripsiLengkap: deskripsiLengkap ?? this.deskripsiLengkap,
      sejarah: sejarah ?? this.sejarah,
      filosofi: filosofi ?? this.filosofi,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
