// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Kitap {
  int kitap_id;
  String kitap_adi;
  int sayfa_sayisi;
  String aciklama;
  int yazar_id;
  int kategori_id;
  String resim;
  String yazar_adi;
  String yazar_soyadi;
  Kitap({
    required this.kitap_id,
    required this.kitap_adi,
    required this.sayfa_sayisi,
    required this.aciklama,
    required this.yazar_id,
    required this.kategori_id,
    required this.resim,
    required this.yazar_adi,
    required this.yazar_soyadi,
  });

  Kitap copyWith({
    int? kitap_id,
    String? kitap_adi,
    int? sayfa_sayisi,
    String? aciklama,
    int? yazar_id,
    int? kategori_id,
    String? resim,
    String? yazar_adi,
    String? yazar_soyadi,
  }) {
    return Kitap(
      kitap_id: kitap_id ?? this.kitap_id,
      kitap_adi: kitap_adi ?? this.kitap_adi,
      sayfa_sayisi: sayfa_sayisi ?? this.sayfa_sayisi,
      aciklama: aciklama ?? this.aciklama,
      yazar_id: yazar_id ?? this.yazar_id,
      kategori_id: kategori_id ?? this.kategori_id,
      resim: resim ?? this.resim,
      yazar_adi: yazar_adi ?? this.yazar_adi,
      yazar_soyadi: yazar_soyadi ?? this.yazar_soyadi,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kitap_id': kitap_id,
      'kitap_adi': kitap_adi,
      'sayfa_sayisi': sayfa_sayisi,
      'aciklama': aciklama,
      'yazar_id': yazar_id,
      'kategori_id': kategori_id,
      'resim': resim,
      'yazar_adi': yazar_adi,
      'yazar_soyadi': yazar_soyadi,
    };
  }

  factory Kitap.fromMap(Map<String, dynamic> map) {
    return Kitap(
      kitap_id: map['kitap_id'] as int,
      kitap_adi: map['kitap_adi'] as String,
      sayfa_sayisi: map['sayfa_sayisi'] as int,
      aciklama: map['aciklama'] as String,
      yazar_id: map['yazar_id'] as int,
      kategori_id: map['kategori_id'] as int,
      resim: map['resim'] as String,
      yazar_adi: map['yazar_adi'] as String,
      yazar_soyadi: map['yazar_soyadi'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Kitap.fromJson(String source) =>
      Kitap.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Kitap(kitap_id: $kitap_id, kitap_adi: $kitap_adi, sayfa_sayisi: $sayfa_sayisi, aciklama: $aciklama, yazar_id: $yazar_id, kategori_id: $kategori_id, resim: $resim, yazar_adi: $yazar_adi, yazar_soyadi: $yazar_soyadi)';
  }

  @override
  bool operator ==(covariant Kitap other) {
    if (identical(this, other)) return true;

    return other.kitap_id == kitap_id &&
        other.kitap_adi == kitap_adi &&
        other.sayfa_sayisi == sayfa_sayisi &&
        other.aciklama == aciklama &&
        other.yazar_id == yazar_id &&
        other.kategori_id == kategori_id &&
        other.resim == resim &&
        other.yazar_adi == yazar_adi &&
        other.yazar_soyadi == yazar_soyadi;
  }

  @override
  int get hashCode {
    return kitap_id.hashCode ^
        kitap_adi.hashCode ^
        sayfa_sayisi.hashCode ^
        aciklama.hashCode ^
        yazar_id.hashCode ^
        kategori_id.hashCode ^
        resim.hashCode ^
        yazar_adi.hashCode ^
        yazar_soyadi.hashCode;
  }
}
