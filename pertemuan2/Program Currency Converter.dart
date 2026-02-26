import 'dart:io';

void main() {
  print('=== KALKULATOR KONVERSI MATA UANG ===\n');

  // Definisi kurs mata uang (Map untuk menyimpan faktor konversi)
  // Base currency: USD
  final Map<String, double> kursMataUang = {
    'USD': 1.0,
    'IDR': 15750.0,  // 1 USD = 15,750 IDR
    'EUR': 0.92,     // 1 USD = 0.92 EUR
  };

  // Tampilkan pilihan mata uang
  print('Pilihan Mata Uang:');
  print('1. IDR (Rupiah Indonesia)');
  print('2. USD (Dollar Amerika)');
  print('3. EUR (Euro)');
  print('');

  // Input jumlah uang
  print('Masukkan jumlah uang: ');
  double? jumlah = double.tryParse(stdin.readLineSync() ?? '');

  if (jumlah == null || jumlah <= 0) {
    print('Error: Jumlah uang harus berupa angka positif!');
    return;
  }

  // Input mata uang asal
  print('Masukkan mata uang asal (IDR/USD/EUR): ');
  String mataUangAsal = (stdin.readLineSync() ?? '').toUpperCase().trim();

  // Input mata uang tujuan
  print('Masukkan mata uang tujuan (IDR/USD/EUR): ');
  String mataUangTujuan = (stdin.readLineSync() ?? '').toUpperCase().trim();

  // Validasi mata uang
  if (!kursMataUang.containsKey(mataUangAsal) ||
      !kursMataUang.containsKey(mataUangTujuan)) {
    print('Error: Mata uang tidak valid! Pilih IDR, USD, atau EUR.');
    return;
  }

  // Proses konversi
  // Rumus: (jumlah / kurs_asal) * kurs_tujuan
  double nilaiDalamUSD = jumlah / kursMataUang[mataUangAsal]!;
  double hasilKonversi = nilaiDalamUSD * kursMataUang[mataUangTujuan]!;

  // Tampilkan hasil dengan format yang rapi
  print('\n=== HASIL KONVERSI ===');
  print('${formatAngka(jumlah, mataUangAsal)} = ${formatAngka(hasilKonversi, mataUangTujuan)}');
  print('Kurs yang digunakan (per 2026):');
  print('  1 USD = ${kursMataUang['IDR']!.toStringAsFixed(0)} IDR');
  print('  1 USD = ${kursMataUang['EUR']!.toStringAsFixed(2)} EUR');
}

/// Fungsi untuk memformat angka dengan simbol mata uang
String formatAngka(double angka, String kodeMataUang) {
  String simbol = {
    'IDR': 'Rp ',
    'USD': '\$',
    'EUR': '€',
  }[kodeMataUang] ?? '';

  // Format dengan pemisah ribuan
  String angkaTerformat = angka.toStringAsFixed(2);

  return '$simbol$angkaTerformat';
}