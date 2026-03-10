void main() {
  // 1. IDENTITAS & PERSONALISASI NIM
  String nama = "Abdul Zaqi";
  String nim = "244107060155";

  String tigaDigitTerakhir = nim.substring(nim.length - 3);
  double nilaiUnikNIM = double.parse(tigaDigitTerakhir);

  // 2. VARIABEL & TIPE DATA
  List<double> hargaBarang = [
    45000.0,   // Barang 1
    75000.0,   // Barang 2
    32000.0,   // Barang 3
    68000.0,   // Barang 4
    55000.0,   // Barang 5
  ];

  hargaBarang.add(nilaiUnikNIM);

  String? pesanDiskon;

  // 3. FUNCTIONS - Panggil fungsi hitungTotal
  double totalAwal = hitungTotal(hargaBarang);

  // 4. CONTROL FLOW (PERCABANGAN) - Logika diskon
  double besarDiskon = 0;
  double totalAkhir = totalAwal;

  if (totalAwal > 200000) {
    // Diskon 20%
    besarDiskon = totalAwal * 0.20;
    totalAkhir = totalAwal - besarDiskon;
    pesanDiskon = "Selamat! Anda mendapatkan diskon 20%";
  } else if (totalAwal >= 100000 && totalAwal <= 200000) {
    // Diskon 10%
    besarDiskon = totalAwal * 0.10;
    totalAkhir = totalAwal - besarDiskon;
    pesanDiskon = "Anda mendapatkan diskon 10%";
  } else {
    // Tidak ada diskon
    besarDiskon = 0;
    totalAkhir = totalAwal;
    pesanDiskon = "Maaf, tidak ada diskon untuk pembelian ini";
  }

  // OUTPUT -  Yang Muncul
  print("========================================");
  print("   SISTEM PENGOLAH DISKON TOKO");
  print("========================================");
  print("Nama Mahasiswa : $nama");
  print("NIM            : $nim");
  print("3 Digit Terakhir NIM: $tigaDigitTerakhir");
  print("Nilai Unik NIM : $nilaiUnikNIM");
  print("----------------------------------------");
  print("Daftar Harga Barang:");
  for (int i = 0; i < hargaBarang.length; i++) {
    if (i == hargaBarang.length - 1) {
      print("  Barang ${i + 1} (Bonus NIM): Rp ${hargaBarang[i]}");
    } else {
      print("  Barang ${i + 1}: Rp ${hargaBarang[i]}");
    }
  }
  print("----------------------------------------");
  print("Total Awal     : Rp ${totalAwal.toStringAsFixed(2)}");
  print("Besar Diskon   : Rp ${besarDiskon.toStringAsFixed(2)}");
  print("Total Akhir    : Rp ${totalAkhir.toStringAsFixed(2)}");
  print("----------------------------------------");
  print("Keterangan     : ${pesanDiskon!}");
  print("========================================");
}

double hitungTotal(List<double> daftarHarga) {
  double total = 0;

  for (double harga in daftarHarga) {
    total += harga;
  }

  return total;
}