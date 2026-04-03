// test/unit/flower_model_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:pam_p6_2026_ifs23051/data/dummy_data.dart';
import 'package:pam_p6_2026_ifs23051/data/models/flower_model.dart';

void main() {
  group('FlowerModel', () {
    late List<FlowerModel> flowers;

    setUp(() {
      flowers = DummyData.getFlowersData();
    });

    test('mengembalikan list yang tidak kosong', () {
      expect(flowers, isNotEmpty);
    });

    test('mengembalikan minimal 10 bunga', () {
      expect(flowers.length, greaterThanOrEqualTo(10));
    });

    test('semua bunga memiliki nama yang tidak kosong', () {
      for (final flower in flowers) {
        expect(flower.nama, isNotEmpty,
            reason: 'Nama tidak boleh kosong untuk: ${flower.nama}');
      }
    });

    test('semua bunga memiliki path gambar yang valid', () {
      for (final flower in flowers) {
        expect(flower.gambar, startsWith('assets/images/'),
            reason: 'Path gambar tidak valid untuk: ${flower.nama}');
        expect(flower.gambar, endsWith('.png'),
            reason: 'Gambar harus berformat .png untuk: ${flower.nama}');
      }
    });

    test('semua bunga memiliki deskripsi yang tidak kosong', () {
      for (final flower in flowers) {
        expect(flower.deskripsi, isNotEmpty,
            reason: 'Deskripsi kosong untuk: ${flower.nama}');
      }
    });

    test('tidak ada nama bunga yang duplikat', () {
      final namaList = flowers.map((f) => f.nama).toList();
      final namaSet = namaList.toSet();
      expect(namaSet.length, equals(namaList.length),
          reason: 'Ditemukan nama bunga yang duplikat');
    });

    test('data "Mawar Merah" terdapat dalam list', () {
      final mawar = flowers.where((f) => f.nama == 'Mawar Merah').firstOrNull;
      expect(mawar, isNotNull);
      expect(mawar!.gambar, contains('mawar'));
    });

    test('filter pencarian berdasarkan nama bekerja dengan benar', () {
      final hasil = flowers
          .where((f) => f.nama.toLowerCase().contains('mawar'))
          .toList();
      expect(hasil.length, equals(2)); // Mawar Merah & Mawar Putih
    });

    test('memanggil getFlowersData dua kali menghasilkan data yang sama', () {
      final flowers2 = DummyData.getFlowersData();
      expect(flowers.length, equals(flowers2.length));
      for (int i = 0; i < flowers.length; i++) {
        expect(flowers[i].nama, equals(flowers2[i].nama));
      }
    });
  });
}