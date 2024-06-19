import 'dart:convert';

class Kendaraan {
  final String namaKendaraan;
  final String noTelepon;
  final String alamat;
  final String gambar;
  Kendaraan({
    required this.namaKendaraan,
    required this.noTelepon,
    required this.alamat,
    required this.gambar,
  });

  Kendaraan copyWith({
    String? namaKendaraan,
    String? noTelepon,
    String? alamat,
    String? gambar,
  }) {
    return Kendaraan(
      namaKendaraan: namaKendaraan ?? this.namaKendaraan,
      noTelepon: noTelepon ?? this.noTelepon,
      alamat: alamat ?? this.alamat,
      gambar: gambar ?? this.gambar,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'namaKendaraan': namaKendaraan});
    result.addAll({'noTelepon': noTelepon});
    result.addAll({'alamat': alamat});
    result.addAll({'gambar': gambar});
    return result;
  }

  factory Kendaraan.fromMap(Map<String, dynamic> map) {
    return Kendaraan(
      namaKendaraan: map['namaKendaraan'] ?? '',
      noTelepon: map['noTelepon'] ?? '',
      alamat: map['alamat'] ?? '',
      gambar: map['gambar'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Kendaraan.fromJson(String source) =>
      Kendaraan.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Kendaraan(namaKendaraan: $namaKendaraan, noTelepon: $noTelepon, alamat: $alamat, gambar: $gambar)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Kendaraan &&
        other.namaKendaraan == namaKendaraan &&
        other.noTelepon == noTelepon &&
        other.alamat == alamat &&
        other.gambar == gambar;
  }

  @override
  int get hashCode {
    return namaKendaraan.hashCode ^
        noTelepon.hashCode ^
        alamat.hashCode ^
        gambar.hashCode;
  }
}
