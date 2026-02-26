import 'dart:io';

void main() {
  print('=== DEMO OPERATOR DALAM DART ===\n');

  // Deklarasi variabel dengan tipe data yang sesuai
  int angka1 = 10;
  int angka2 = 3;
  bool nilaiTrue = true;
  bool nilaiFalse = false;

  print('Variabel yang digunakan:');
  print('  angka1 = $angka1');
  print('  angka2 = $angka2');
  print('  nilaiTrue = $nilaiTrue');
  print('  nilaiFalse = $nilaiFalse');
  print('');

  // 1. ARITHMETIC OPERATORS (Operator Aritmatika)
  print('1. === OPERATOR ARITMATIKA ===');
  print('  Penjumlahan (+)        : $angka1 + $angka2 = ${angka1 + angka2}');
  print('  Pengurangan (-)        : $angka1 - $angka2 = ${angka1 - angka2}');
  print('  Perkalian (*)          : $angka1 * $angka2 = ${angka1 * angka2}');
  print('  Pembagian (/)          : $angka1 / $angka2 = ${(angka1 / angka2).toStringAsFixed(2)}');
  print('  Pembagian Bulat (~/)   : $angka1 ~/ $angka2 = ${angka1 ~/ angka2}');
  print('  Modulus (%)            : $angka1 % $angka2 = ${angka1 % angka2}');
  print('  Negasi (-)             : -$angka1 = ${-angka1}');
  print('');

  // 2. RELATIONAL OPERATORS (Operator Relasi/Perbandingan)
  print('2. === OPERATOR RELASI ===');
  print('  Sama dengan (==)        : $angka1 == $angka2 → ${angka1 == angka2}');
  print('  Tidak sama (!=)         : $angka1 != $angka2 → ${angka1 != angka2}');
  print('  Lebih besar (>)         : $angka1 > $angka2 → ${angka1 > angka2}');
  print('  Lebih kecil (<)         : $angka1 < $angka2 → ${angka1 < angka2}');
  print('  Lebih besar sama (>=)   : $angka1 >= $angka2 → ${angka1 >= angka2}');
  print('  Lebih kecil sama (<=)   : $angka1 <= $angka2 → ${angka1 <= angka2}');
  print('');

  // 3. LOGICAL OPERATORS (Operator Logika)
  print('3. === OPERATOR LOGIKA ===');
  print('  AND (&&)                : $nilaiTrue && $nilaiFalse → ${nilaiTrue && nilaiFalse}');
  print('  OR (||)                 : $nilaiTrue || $nilaiFalse → ${nilaiTrue || nilaiFalse}');
  print('  NOT (!)                 : !$nilaiTrue → ${!nilaiTrue}');
  print('  NOT (!)                 : !$nilaiFalse → ${!nilaiFalse}');
  print('');

  // 4. ASSIGNMENT OPERATORS (Operator Penugasan)
  print('4. === OPERATOR PENUGASAN ===');
  int temp = angka1;
  print('  =   (assignment)        : temp = $angka1 → temp = $temp');
  temp += angka2;
  print('  +=  (add and assign)    : temp += $angka2 → temp = $temp');
  temp -= angka2;
  print('  -=  (subtract and assign): temp -= $angka2 → temp = $temp');
  temp *= angka2;
  print('  *=  (multiply and assign): temp *= $angka2 → temp = $temp');
  temp = angka1;
  temp ~/= angka2;
  print('  ~/= (divide and assign) : temp ~/= $angka2 → temp = $temp');
  temp = angka1;
  temp %= angka2;
  print('  %=  (modulus and assign): temp %= $angka2 → temp = $temp');
  print('');

  // 5. INCREMENT/DECREMENT OPERATORS
  print('5. === OPERATOR INCREMENT/DECREMENT ===');
  int increment = 5;
  print('  Pre-increment (++var)   : ++increment = ${++increment}');
  increment = 5;
  print('  Post-increment (var++)  : increment++ = ${increment++} (hasil: ${increment})');
  int decrement = 5;
  print('  Pre-decrement (--var)   : --decrement = ${--decrement}');
  decrement = 5;
  print('  Post-decrement (var--)  : decrement-- = ${decrement--} (hasil: ${decrement})');
  print('');

  // 6. TYPE TEST OPERATORS
  print('6. === OPERATOR TYPE TEST ===');
  dynamic variabelDynamic = 'Hello Dart';
  print('  is (type test)          : variabelDynamic is String → ${variabelDynamic is String}');
  print('  is! (type negation)     : variabelDynamic is! int → ${variabelDynamic is! int}');
  print('');

  // 7. CONDITIONAL OPERATORS (Ternary)
  print('7. === OPERATOR KONDISIONAL (TERNARY) ===');
  String status = angka1 > angka2 ? 'lebih besar' : 'lebih kecil';
  print('  Ternary (?:)            : $angka1 > $angka2 ? "lebih besar" : "lebih kecil"');
  print('                          → "$status"');

  // Null-aware operators
  String? nullableValue;
  String result = nullableValue ?? 'Default Value';
  print('  Null-coalescing (??)    : nullableValue ?? "Default Value"');
  print('                          → "$result"');
  print('');

  // 8. BITWISE OPERATORS
  print('8. === OPERATOR BITWISE ===');
  int bit1 = 10; // Binary: 1010
  int bit2 = 6;  // Binary: 0110
  print('  AND (&)                 : $bit1 & $bit2 = ${bit1 & bit2}');
  print('  OR (|)                  : $bit1 | $bit2 = ${bit1 | bit2}');
  print('  XOR (^)                 : $bit1 ^ $bit2 = ${bit1 ^ bit2}');
  print('  NOT (~)                 : ~$bit1 = ${~bit1}');
  print('  Left Shift (<<)         : $bit1 << 1 = ${bit1 << 1}');
  print('  Right Shift (>>)        : $bit1 >> 1 = ${bit1 >> 1}');
  print('');

  print('=== DEMO OPERATOR SELESAI ===');
}