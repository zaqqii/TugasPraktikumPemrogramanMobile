import 'dart:io';

void main() {
  print('╔════════════════════════════════════════╗');
  print('║     KALKULATOR MATEMATIKA DART         ║');
  print('║  Faktorial & Pengecekan Bilangan       ║');
  print('╚════════════════════════════════════════╝');
  print('');

  while (true) {
    print('\n--- MENU UTAMA ---');
    print('1. Hitung Faktorial');
    print('2. Cek Bilangan Prima');
    print('3. Cek Bilangan Genap/Ganjil');
    print('4. Tabel Perkalian');
    print('5. Keluar');
    stdout.write('Pilih menu (1-5): ');

    String? pilihan = stdin.readLineSync();

    switch (pilihan) {
      case '1':
        hitungFaktorial();
        break;
      case '2':
        cekBilanganPrima();
        break;
      case '3':
        cekGenapGanjil();
        break;
      case '4':
        tabelPerkalian();
        break;
      case '5':
        print('\nTerima kasih telah menggunakan program ini!');
        return;
      default:
        print('\n Pilihan tidak valid! Silakan coba lagi.');
    }
  }
}

// Fungsi menghitung faktorial menggunakan perulangan for
void hitungFaktorial() {
  stdout.write('\nMasukkan bilangan bulat positif: ');
  String? input = stdin.readLineSync();

  if (input == null || input.isEmpty) {
    print('Input tidak boleh kosong!');
    return;
  }

  int? n = int.tryParse(input);

  if (n == null) {
    print('Input harus berupa angka!');
    return;
  }

  if (n < 0) {
    print('Faktorial tidak didefinisikan untuk bilangan negatif!');
    return;
  }

  if (n > 20) {
    print('Bilangan terlalu besar! Maksimal 20 untuk menghindari overflow.');
    return;
  }

  BigInt faktorial = BigInt.one;
  String proses = '';

  for (int i = 1; i <= n; i++) {
    faktorial *= BigInt.from(i);
    proses += i.toString();
    if (i < n) proses += ' × ';
  }

  print('\n HASIL PERHITUNGAN:');
  print('   $n! = $proses');
  print('   $n! = $faktorial');
}

void cekBilanganPrima() {
  stdout.write('\nMasukkan bilangan bulat positif: ');
  String? input = stdin.readLineSync();

  if (input == null || input.isEmpty) {
    print('Input tidak boleh kosong!');
    return;
  }

  int? n = int.tryParse(input);

  if (n == null || n < 0) {
    print('Input tidak valid!');
    return;
  }

  if (n <= 1) {
    print('\n $n bukan bilangan prima (bilangan prima harus > 1)');
    return;
  }

  if (n == 2) {
    print('\n $n adalah bilangan prima (bilangan prima genap satu-satunya)');
    return;
  }

  if (n % 2 == 0) {
    print('\n $n bukan bilangan prima (bilangan genap selain 2)');
    return;
  }

  bool isPrima = true;
  String faktor = '';

  for (int i = 3; i * i <= n; i += 2) {
    if (n % i == 0) {
      isPrima = false;
      faktor = i.toString();
      break; // Keluar dari perulangan jika sudah menemukan faktor
    }
  }

  if (isPrima) {
    print('\n $n adalah bilangan prima');
    print('   Tidak ditemukan faktor selain 1 dan $n');
  } else {
    print('\n $n bukan bilangan prima');
    print('   Dapat dibagi oleh $faktor');
  }
}

// Fungsi cek genap/ganjil dengan validasi
void cekGenapGanjil() {
  stdout.write('\nMasukkan bilangan: ');
  String? input = stdin.readLineSync();

  int? n = int.tryParse(input ?? '');

  if (n == null) {
    print('Input tidak valid!');
    return;
  }

  // Percabangan nested: cek negatif dan genap/ganjil
  if (n < 0) {
    if (n % 2 == 0) {
      print('\n $n adalah bilangan genap negatif');
    } else {
      print('\n $n adalah bilangan ganjil negatif');
    }
  } else if (n == 0) {
    print('\n $n adalah bilangan netral (genap)');
  } else {
    if (n % 2 == 0) {
      print('\n $n adalah bilangan genap positif');
    } else {
      print('\n $n adalah bilangan ganjil positif');
    }
  }
}

// Fungsi tabel perkalian menggunakan nested loop
void tabelPerkalian() {
  stdout.write('\n Masukkan ukuran tabel (1-10): ');
  String? input = stdin.readLineSync();

  int? n = int.tryParse(input ?? '');

  if (n == null || n < 1 || n > 10) {
    print('Ukuran harus antara 1-10!');
    return;
  }

  print('\n TABEL PERKALIAN ${n}x$n:');
  print('─' * (n * 6 + 4));

  // Nested loop: perulangan dalam perulangan
  stdout.write('   |');
  for (int i = 1; i <= n; i++) {
    stdout.write(' ${i.toString().padLeft(3)} ');
  }
  print('');
  print('─' * (n * 6 + 4));

  for (int i = 1; i <= n; i++) {
    stdout.write('${i.toString().padLeft(2)} |');
    for (int j = 1; j <= n; j++) {
      stdout.write(' ${(i * j).toString().padLeft(3)} ');
    }
    print('');
  }
  print('─' * (n * 6 + 4));
}