import 'dart:io';

void main() {
  while (true) {
    print('\n╔════════════════════════════════════════╗');
    print('║   APLIKASI KONVERSI UNIT LENGKAP      ║');
    print('╚════════════════════════════════════════╝');
    print('\nMenu Kategori Konversi:');
    print('1. Panjang (Length)');
    print('2. Massa (Mass)');
    print('3. Volume');
    print('4. Suhu (Temperature)');
    print('0. Keluar');
    print('');

    print('Pilih kategori (0-4): ');
    String? pilihan = stdin.readLineSync()?.trim();

    if (pilihan == '0') {
      print('\nTerima kasih telah menggunakan aplikasi ini!');
      break;
    }

    switch (pilihan) {
      case '1':
        _konversiPanjang();
        break;
      case '2':
        _konversiMassa();
        break;
      case '3':
        _konversiVolume();
        break;
      case '4':
        _konversiSuhu();
        break;
      default:
        print('Pilihan tidak valid! Silakan pilih 0-4.');
    }

    // Tanya apakah ingin lanjut
    print('\nApakah ingin melakukan konversi lain? (y/n): ');
    String? lanjut = stdin.readLineSync()?.trim().toLowerCase();
    if (lanjut != 'y' && lanjut != 'ya') {
      print('\nTerima kasih telah menggunakan aplikasi ini!');
      break;
    }
  }
}

/// Konversi Satuan Panjang
void _konversiPanjang() {
  print('\n=== KONVERSI SATUAN PANJANG ===');

  // Map untuk satuan panjang (base unit: meter)
  final Map<String, double> satuanPanjang = {
    'mm': 0.001,           // millimeter
    'cm': 0.01,            // centimeter
    'm': 1.0,              // meter
    'km': 1000.0,          // kilometer
    'in': 0.0254,          // inch
    'ft': 0.3048,          // feet
    'yd': 0.9144,          // yard
    'mi': 1609.344,        // mile
  };

  final Map<String, String> namaPanjang = {
    'mm': 'Millimeter',
    'cm': 'Centimeter',
    'm': 'Meter',
    'km': 'Kilometer',
    'in': 'Inch',
    'ft': 'Feet',
    'yd': 'Yard',
    'mi': 'Mile',
  };

  _tampilkanDanProsesKonversi(satuanPanjang, namaPanjang, 'Panjang');
}

/// Konversi Satuan Massa
void _konversiMassa() {
  print('\n=== KONVERSI SATUAN MASSA ===');

  // Map untuk satuan massa (base unit: gram)
  final Map<String, double> satuanMassa = {
    'mg': 0.001,           // milligram
    'g': 1.0,              // gram
    'kg': 1000.0,          // kilogram
    'oz': 28.3495,         // ounce
    'lb': 453.592,         // pound
    'ton': 1000000.0,      // metric ton
  };

  final Map<String, String> namaMassa = {
    'mg': 'Milligram',
    'g': 'Gram',
    'kg': 'Kilogram',
    'oz': 'Ounce',
    'lb': 'Pound',
    'ton': 'Ton',
  };

  _tampilkanDanProsesKonversi(satuanMassa, namaMassa, 'Massa');
}

/// Konversi Satuan Volume
void _konversiVolume() {
  print('\n=== KONVERSI SATUAN VOLUME ===');

  // Map untuk satuan volume (base unit: liter)
  final Map<String, double> satuanVolume = {
    'ml': 0.001,           // milliliter
    'l': 1.0,              // liter
    'm3': 1000.0,          // cubic meter
    'gal': 3.78541,        // gallon (US)
    'qt': 0.946353,        // quart (US)
    'pt': 0.473176,        // pint (US)
    'cup': 0.24,           // cup
    'fl oz': 0.0295735,    // fluid ounce
  };

  final Map<String, String> namaVolume = {
    'ml': 'Milliliter',
    'l': 'Liter',
    'm3': 'Meter Kubik',
    'gal': 'Gallon (US)',
    'qt': 'Quart (US)',
    'pt': 'Pint (US)',
    'cup': 'Cup',
    'fl oz': 'Fluid Ounce',
  };

  _tampilkanDanProsesKonversi(satuanVolume, namaVolume, 'Volume');
}

/// Konversi Satuan Suhu
void _konversiSuhu() {
  print('\n=== KONVERSI SATUAN SUHU ===');

  print('\nPilihan Satuan Suhu:');
  print('1. Celsius (°C)');
  print('2. Fahrenheit (°F)');
  print('3. Kelvin (K)');
  print('4. Reamur (°R)');
  print('');

  print('Masukkan nilai suhu: ');
  double? nilai = double.tryParse(stdin.readLineSync() ?? '');

  if (nilai == null) {
    print('Error: Input tidak valid!');
    return;
  }

  // Validasi untuk Kelvin (tidak boleh negatif absolut)
  print('Masukkan satuan asal (C/F/K/R): ');
  String satuanAsal = (stdin.readLineSync() ?? '').trim().toLowerCase();

  print('Masukkan satuan tujuan (C/F/K/R): ');
  String satuanTujuan = (stdin.readLineSync() ?? '').trim().toLowerCase();

  // Konversi suhu
  double hasil = _konversiNilaiSuhu(nilai, satuanAsal, satuanTujuan);

  if (hasil.toString() == 'error') {
    print('Error: Satuan tidak valid! Gunakan C, F, K, atau R.');
    return;
  }

  // Tampilkan hasil
  print('\n=== HASIL KONVERSI SUHU ===');
  print('${_formatSuhu(nilai, satuanAsal)} = ${_formatSuhu(hasil, satuanTujuan)}');
}

/// Fungsi helper untuk konversi suhu
double _konversiNilaiSuhu(double nilai, String dari, String ke) {
  // Konversi ke Celsius terlebih dahulu
  double celsius;

  switch (dari.toLowerCase()) {
    case 'c':
      celsius = nilai;
      break;
    case 'f':
      celsius = (nilai - 32) * 5/9;
      break;
    case 'k':
      if (nilai < 0) {
        print('Error: Kelvin tidak boleh kurang dari 0!');
        return -999;
      }
      celsius = nilai - 273.15;
      break;
    case 'r':
      celsius = nilai * 5/4;
      break;
    default:
      return -999;
  }

  // Konversi dari Celsius ke satuan tujuan
  switch (ke.toLowerCase()) {
    case 'c':
      return celsius;
    case 'f':
      return (celsius * 9/5) + 32;
    case 'k':
      return celsius + 273.15;
    case 'r':
      return celsius * 4/5;
    default:
      return -999;
  }
}

/// Fungsi untuk format suhu
String _formatSuhu(double nilai, String satuan) {
  String simbol = {
    'c': '°C',
    'f': '°F',
    'k': 'K',
    'r': '°R',
  }[satuan.toLowerCase()] ?? satuan;

  return '${nilai.toStringAsFixed(2)} $simbol';
}

/// Fungsi umum untuk proses konversi (Panjang, Massa, Volume)
void _tampilkanDanProsesKonversi(
    Map<String, double> faktorKonversi,
    Map<String, String> namaSatuan,
    String kategori) {

  print('\nPilihan Satuan $kategori:');
  int nomor = 1;
  List<String> kunciSatuan = faktorKonversi.keys.toList();

  for (var kunci in kunciSatuan) {
    print('$nomor. ${namaSatuan[kunci]} (${kunci.toUpperCase()})');
    nomor++;
  }
  print('');

  // Input nilai
  print('Masukkan nilai: ');
  double? nilai = double.tryParse(stdin.readLineSync() ?? '');

  if (nilai == null) {
    print('Error: Input tidak valid! Harus berupa angka.');
    return;
  }

  // Validasi nilai negatif untuk massa dan volume
  if ((kategori == 'Massa' || kategori == 'Volume') && nilai < 0) {
    print('Error: Nilai $kategori tidak boleh negatif!');
    return;
  }

  // Input satuan asal
  print('Masukkan satuan asal (contoh: m, kg, l): ');
  String satuanAsal = (stdin.readLineSync() ?? '').trim().toLowerCase();

  // Input satuan tujuan
  print('Masukkan satuan tujuan (contoh: km, g, ml): ');
  String satuanTujuan = (stdin.readLineSync() ?? '').trim().toLowerCase();

  // Validasi satuan
  if (!faktorKonversi.containsKey(satuanAsal)) {
    print('Error: Satuan asal tidak valid!');
    return;
  }

  if (!faktorKonversi.containsKey(satuanTujuan)) {
    print('Error: satuan tujuan tidak valid!');
    return;
  }

  // Proses konversi menggunakan Map
  // Rumus: (nilai / faktor_asal) * faktor_tujuan
  double nilaiDalamBaseUnit = nilai * faktorKonversi[satuanAsal]!;
  double hasil = nilaiDalamBaseUnit / faktorKonversi[satuanTujuan]!;

  // Tampilkan hasil dengan format yang rapi
  print('\n=== HASIL KONVERSI ===');
  print('${_formatHasil(nilai, satuanAsal, namaSatuan)}');
  print('  =');
  print('${_formatHasil(hasil, satuanTujuan, namaSatuan)}');
}

/// Fungsi untuk format hasil konversi
String _formatHasil(double nilai, String kode, Map<String, String> namaSatuan) {
  String nama = namaSatuan[kode] ?? kode;
  String nilaiFormat;

  // Format angka berdasarkan besarnya
  if (nilai >= 1000000) {
    nilaiFormat = (nilai / 1000000).toStringAsFixed(2) + ' juta';
  } else if (nilai >= 1000) {
    nilaiFormat = (nilai / 1000).toStringAsFixed(2) + ' ribu';
  } else if (nilai < 0.01 && nilai > 0) {
    nilaiFormat = nilai.toStringAsFixed(6);
  } else {
    nilaiFormat = nilai.toStringAsFixed(4).replaceAll(RegExp(r'\.?0+$'), '');
  }

  return '  $nilaiFormat $nama (${kode.toUpperCase()})';
}