import 'dart:io';
/// Tanggal: [Tanggal]
void main() {
  print('=== PROGRAM BMI CALCULATOR ===');
  print('Body Mass Index (BMI) Calculator\n');

  // Input berat badan (kg)
  print('Masukkan berat badan Anda (kg): ');
  double? beratBadan = double.tryParse(stdin.readLineSync() ?? '');

  // Input tinggi badan (cm)
  print('Masukkan tinggi badan Anda (cm): ');
  double? tinggiBadan = double.tryParse(stdin.readLineSync() ?? '');

  // Validasi input
  if (beratBadan == null || tinggiBadan == null || beratBadan <= 0 || tinggiBadan <= 0) {
    print('\n Input tidak valid! Berat dan tinggi badan harus berupa angka positif.');
    return;
  }

  // Konversi tinggi dari cm ke meter
  double tinggiMeter = tinggiBadan / 100;

  // Hitung BMI: weight (kg) / height² (m²) [[11]]
  double bmi = beratBadan / (tinggiMeter * tinggiMeter);

  // Tampilkan hasil
  print('\n=== HASIL PERHITUNGAN ===');
  print('Berat Badan  : ${beratBadan.toStringAsFixed(1)} kg');
  print('Tinggi Badan : ${tinggiBadan.toStringAsFixed(1)} cm');
  print('BMI Anda     : ${bmi.toStringAsFixed(2)}');

  // Kategori BMI
  String kategori = _getKategoriBMI(bmi);
  print('Kategori     : $kategori');
}

/// Fungsi untuk menentukan kategori BMI
String _getKategoriBMI(double bmi) {
  if (bmi < 18.5) {
    return 'Kekurangan Berat Badan (Underweight)';
  } else if (bmi >= 18.5 && bmi < 25) {
    return 'Normal (Ideal)';
  } else if (bmi >= 25 && bmi < 30) {
    return 'Kelebihan Berat Badan (Overweight)';
  } else {
    return 'Obesitas';
  }
}