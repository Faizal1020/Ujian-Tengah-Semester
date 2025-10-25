import '../models/budaya_model.dart';

/// Data Dummy untuk Aplikasi Laraska
///
/// Data ini akan diganti dengan API Firebase/Node.js
/// pada tahap pengembangan selanjutnya
class BudayaData {
  // ===== TARI JAWA =====
  static List<BudayaModel> getAllTari() {
    return [
      BudayaModel(
        id: 1,
        nama: 'Tari Serampi',
        kategori: 'tari',
        daerah: 'Jawa Tengah',
        imagePath: 'assets/images/tari/serimpi.jpg',
        deskripsiSingkat:
            'Tarian klasik keraton yang menggambarkan keanggunan dan kelembutan',
        deskripsiLengkap:
            'Tari Serampi adalah tarian klasik Jawa yang berasal dari Keraton Surakarta. Tarian ini dibawakan oleh empat penari wanita yang melambangkan empat arah mata angin.',
        sejarah:
            'Tari Serampi berkembang pada masa Keraton Mataram Islam dan terus dilestarikan hingga kini. Tarian ini awalnya hanya ditampilkan untuk acara-acara kenegaraan di dalam keraton.',
        filosofi:
            'Setiap gerakan dalam Tari Serampi memiliki makna mendalam tentang keseimbangan alam dan kehidupan. Empat penari melambangkan empat unsur alam yang harus selaras.',
      ),
      BudayaModel(
        id: 2,
        nama: 'Tari Gambyong',
        kategori: 'tari',
        daerah: 'Surakarta',
        imagePath: 'assets/images/tari/gambyong.jpg',
        deskripsiSingkat:
            'Tarian pergaulan yang menggambarkan keceriaan dan kegembiraan',
        deskripsiLengkap:
            'Tari Gambyong adalah tarian tradisional Jawa yang berasal dari Surakarta. Tarian ini menggambarkan kegembiraan dan kehidupan masyarakat Jawa.',
        sejarah:
            'Tari Gambyong berawal dari nama seorang penari tayub bernama Gambyong yang hidup pada abad ke-18. Tariannya yang indah kemudian diabadikan menjadi tarian klasik.',
        filosofi:
            'Gerakan Tari Gambyong yang dinamis melambangkan semangat hidup dan keramahan masyarakat Jawa. Setiap gerakan tangan mengandung makna komunikasi non-verbal.',
      ),
      BudayaModel(
        id: 3,
        nama: 'Tari Bedhaya',
        kategori: 'tari',
        daerah: 'Yogyakarta',
        imagePath: 'assets/images/tari/bedhaya.jpg',
        deskripsiSingkat:
            'Tarian sakral keraton yang dibawakan oleh sembilan penari',
        deskripsiLengkap:
            'Tari Bedhaya adalah tarian sakral yang berasal dari Keraton Yogyakarta dan Surakarta. Tarian ini dibawakan oleh sembilan penari putri dengan gerakan yang sangat halus.',
        sejarah:
            'Tari Bedhaya konon diciptakan oleh Sultan Agung pada abad ke-17. Tarian ini memiliki nilai spiritual yang tinggi dan hanya ditampilkan pada acara-acara khusus keraton.',
        filosofi:
            'Sembilan penari dalam Tari Bedhaya melambangkan sembilan penjuru mata angin dan Wali Songo. Gerakan lembutnya mencerminkan kesucian dan spiritualitas tinggi.',
      ),
    ];
  }

  // ===== PAKAIAN ADAT JAWA =====
  static List<BudayaModel> getAllPakaian() {
    return [
      BudayaModel(
        id: 1,
        nama: 'Kebaya Jawa',
        kategori: 'pakaian',
        daerah: 'Jawa Tengah & Yogyakarta',
        imagePath: 'assets/images/pakaian/kebaya.jpg',
        deskripsiSingkat:
            'Pakaian tradisional wanita Jawa yang melambangkan keanggunan',
        deskripsiLengkap:
            'Kebaya Jawa adalah pakaian tradisional khas Jawa yang dikenakan oleh wanita. Kebaya terbuat dari bahan tipis seperti katun atau sutra dengan bordir yang indah.',
        sejarah:
            'Kebaya mulai dikenal sejak abad ke-15 dan berkembang menjadi pakaian resmi keraton. Setiap daerah di Jawa memiliki variasi kebaya dengan ciri khas masing-masing.',
        filosofi:
            'Bahan kebaya yang tipis dan transparan melambangkan keterbukaan hati, sementara potongannya yang rapi mencerminkan keteraturan dalam kehidupan orang Jawa.',
      ),
      BudayaModel(
        id: 2,
        nama: 'Beskap',
        kategori: 'pakaian',
        daerah: 'Jawa Tengah',
        imagePath: 'assets/images/pakaian/beskap.jpg',
        deskripsiSingkat:
            'Pakaian formal pria Jawa yang melambangkan kewibawaan',
        deskripsiLengkap:
            'Beskap adalah pakaian resmi pria Jawa yang biasa dikenakan dalam acara-acara formal seperti pernikahan atau upacara adat. Beskap memiliki potongan jas dengan kancing di depan.',
        sejarah:
            'Beskap berkembang pada masa kolonial Belanda, menggabungkan gaya pakaian Eropa dengan sentuhan tradisional Jawa. Hingga kini, beskap tetap menjadi simbol formalitas.',
        filosofi:
            'Warna gelap pada beskap melambangkan kedewasaan dan kebijaksanaan. Kancing-kancing di depan melambangkan keterbukaan dan kejujuran dalam bersikap.',
      ),
      BudayaModel(
        id: 3,
        nama: 'Blangkon',
        kategori: 'pakaian',
        daerah: 'Seluruh Jawa',
        imagePath: 'assets/images/pakaian/blangkon.jpg',
        deskripsiSingkat:
            'Kain batik tradisional yang dikenakan dengan cara dililitkan',
        deskripsiLengkap:
            'Jarik atau kain batik adalah pakaian tradisional Jawa yang dikenakan dengan cara dililitkan di pinggang. Setiap motif batik memiliki makna dan kegunaan tersendiri.',
        sejarah:
            'Batik telah ada sejak masa Kerajaan Majapahit. Teknik membatik diturunkan dari generasi ke generasi dan telah diakui UNESCO sebagai warisan budaya dunia.',
        filosofi:
            'Motif parang melambangkan kekuatan dan kepemimpinan, motif kawung melambangkan kesucian, sedangkan motif truntum melambangkan cinta yang tumbuh kembali.',
      ),
    ];
  }

  // ===== MUSIK TRADISIONAL JAWA =====
  static List<BudayaModel> getAllMusik() {
    return [
      BudayaModel(
        id: 1,
        nama: 'Gamelan',
        kategori: 'musik',
        daerah: 'Jawa Tengah & Yogyakarta',
        imagePath: 'assets/images/musik/gamelan.jpg',
        deskripsiSingkat:
            'Ensembel musik tradisional yang terdiri dari berbagai instrumen perkusi',
        deskripsiLengkap:
            'Gamelan adalah orkestra tradisional Jawa yang terdiri dari seperangkat instrumen musik seperti gong, kenong, saron, dan bonang. Musik gamelan menghasilkan harmoni yang khas dan memukau.',
        sejarah:
            'Gamelan berkembang pesat pada masa Kerajaan Majapahit (1293-1597) dan mencapai puncak kejayaannya di era Keraton Mataram. Setiap keraton memiliki gamelan pusaka yang diwariskan turun-temurun.',
        filosofi:
            'Gamelan mengandung filosofi mendalam tentang kehidupan bermasyarakat. Harmoni dalam gamelan melambangkan keselarasan hidup dan pentingnya gotong royong dalam masyarakat Jawa.',
      ),
      BudayaModel(
        id: 2,
        nama: 'Kendang',
        kategori: 'musik',
        daerah: 'Keraton Jawa',
        imagePath: 'assets/images/musik/kendang.jpg',
        deskripsiSingkat:
            'Komposisi musik gamelan dengan struktur dan pola tertentu',
        deskripsiLengkap:
            'Gending adalah komposisi musik gamelan yang memiliki struktur, irama, dan laras tertentu. Setiap gending membawa suasana dan karakter yang berbeda.',
        sejarah:
            'Gending-gending klasik banyak diciptakan pada masa keemasan keraton Jawa. Beberapa gending bahkan berusia ratusan tahun dan masih dimainkan hingga kini.',
        filosofi:
            'Setiap gending memiliki watak tersendiri - ada yang sakral untuk upacara spiritual, ada yang gembira untuk perayaan, dan ada yang meditatif untuk kontemplasi.',
      ),
      BudayaModel(
        id: 3,
        nama: 'Saron',
        kategori: 'musik',
        daerah: 'Seluruh Jawa',
        imagePath: 'assets/images/musik/saron.jpg', // ← diperbaiki huruf kecil
        deskripsiSingkat:
            'Puisi tradisional Jawa yang dinyanyikan dengan aturan tertentu',
        deskripsiLengkap:
            'Tembang Macapat adalah bentuk puisi tradisional Jawa yang dinyanyikan. Macapat memiliki 11 jenis tembang, masing-masing dengan aturan guru gatra, guru wilangan, dan guru lagu.',
        sejarah:
            'Tembang Macapat berkembang sejak masa Walisongo sebagai media dakwah Islam. Kesebelas tembang tersebut adalah Maskumambang, Mijil, Sinom, Kinanthi, Asmaradana, Gambuh, Megatruh, Pangkur, Durma, Pucung, dan Dandanggula.',
        filosofi:
            'Setiap tembang memiliki watak yang sesuai dengan fase kehidupan manusia. Sinom untuk masa muda, Asmaradana untuk masa jatuh cinta, Pangkur untuk kemarahan, dan seterusnya.',
      ),
    ];
  }

  // ===== GET BY ID =====
  static BudayaModel? getById(int id) {
    final allData = [
      ...getAllTari(),
      ...getAllPakaian(),
      ...getAllMusik(),
    ];

    try {
      return allData.firstWhere((item) => item.id == id);
    } catch (e) {
      return null;
    }
  }

  // ===== GET BY KATEGORI =====
  static List<BudayaModel> getByKategori(String kategori) {
    final allData = [
      ...getAllTari(),
      ...getAllPakaian(),
      ...getAllMusik(),
    ];
    return allData.where((item) => item.kategori == kategori).toList();
  }

  // ===== SEARCH =====
  static List<BudayaModel> search(String keyword) {
    final allData = [
      ...getAllTari(),
      ...getAllPakaian(),
      ...getAllMusik(),
    ];

    if (keyword.isEmpty) return allData;

    final lowerKeyword = keyword.toLowerCase();
    return allData.where((item) {
      return item.nama.toLowerCase().contains(lowerKeyword) ||
          item.daerah.toLowerCase().contains(lowerKeyword) ||
          item.deskripsiSingkat.toLowerCase().contains(lowerKeyword);
    }).toList();
  }
}
