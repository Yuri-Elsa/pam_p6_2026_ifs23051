// lib/data/models/flower_model.dart

class FlowerModel {
  const FlowerModel({
    required this.nama,
    required this.gambar,
    required this.deskripsi,
    required this.bahasaBunga,
    required this.asalDaerah,
  });

  final String nama;
  final String gambar;
  final String deskripsi;
  final String bahasaBunga; // Makna/simbolisme bunga
  final String asalDaerah;

  FlowerModel copyWith({
    String? nama,
    String? gambar,
    String? deskripsi,
    String? bahasaBunga,
    String? asalDaerah,
  }) {
    return FlowerModel(
      nama: nama ?? this.nama,
      gambar: gambar ?? this.gambar,
      deskripsi: deskripsi ?? this.deskripsi,
      bahasaBunga: bahasaBunga ?? this.bahasaBunga,
      asalDaerah: asalDaerah ?? this.asalDaerah,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is FlowerModel && runtimeType == other.runtimeType && nama == other.nama;

  @override
  int get hashCode => nama.hashCode;

  @override
  String toString() => 'FlowerModel(nama: $nama)';
}