// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Favoriler {
  int kitap_id;
  String kitap_adi;
  int sayfa_sayisi;
  String resim;
  String yazar_adi;
  String yazar_soyadi;
  String kategori_adi;
  Favoriler({
    required this.kitap_id,
    required this.kitap_adi,
    required this.sayfa_sayisi,
    required this.resim,
    required this.yazar_adi,
    required this.yazar_soyadi,
    required this.kategori_adi,
  });

  Favoriler copyWith({
    int? kitap_id,
    String? kitap_adi,
    int? sayfa_sayisi,
    String? resim,
    String? yazar_adi,
    String? yazar_soyadi,
    String? kategori_adi,
  }) {
    return Favoriler(
      kitap_id: kitap_id ?? this.kitap_id,
      kitap_adi: kitap_adi ?? this.kitap_adi,
      sayfa_sayisi: sayfa_sayisi ?? this.sayfa_sayisi,
      resim: resim ?? this.resim,
      yazar_adi: yazar_adi ?? this.yazar_adi,
      yazar_soyadi: yazar_soyadi ?? this.yazar_soyadi,
      kategori_adi: kategori_adi ?? this.kategori_adi,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kitap_id': kitap_id,
      'kitap_adi': kitap_adi,
      'sayfa_sayisi': sayfa_sayisi,
      'resim': resim,
      'yazar_adi': yazar_adi,
      'yazar_soyadi': yazar_soyadi,
      'kategori_adi': kategori_adi,
    };
  }

  factory Favoriler.fromMap(Map<String, dynamic> map) {
    return Favoriler(
      kitap_id: map['kitap_id'] as int,
      kitap_adi: map['kitap_adi'] as String,
      sayfa_sayisi: map['sayfa_sayisi'] as int,
      resim: map['resim'] as String,
      yazar_adi: map['yazar_adi'] as String,
      yazar_soyadi: map['yazar_soyadi'] as String,
      kategori_adi: map['kategori_adi'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Favoriler.fromJson(String source) =>
      Favoriler.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Favoriler(kitap_id: $kitap_id, kitap_adi: $kitap_adi, sayfa_sayisi: $sayfa_sayisi, resim: $resim, yazar_adi: $yazar_adi, yazar_soyadi: $yazar_soyadi, kategori_adi: $kategori_adi)';
  }

  @override
  bool operator ==(covariant Favoriler other) {
    if (identical(this, other)) return true;

    return other.kitap_id == kitap_id &&
        other.kitap_adi == kitap_adi &&
        other.sayfa_sayisi == sayfa_sayisi &&
        other.resim == resim &&
        other.yazar_adi == yazar_adi &&
        other.yazar_soyadi == yazar_soyadi &&
        other.kategori_adi == kategori_adi;
  }

  @override
  int get hashCode {
    return kitap_id.hashCode ^
        kitap_adi.hashCode ^
        sayfa_sayisi.hashCode ^
        resim.hashCode ^
        yazar_adi.hashCode ^
        yazar_soyadi.hashCode ^
        kategori_adi.hashCode;
  }
}
