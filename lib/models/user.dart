// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  @override
  String toString() {
    return 'Kullanıcı Adı: $kullanici_adi Şifre: $sifre İsim: $isim Soyisim: $soyisim Cinsiyet: $cinsiyet Kayıt Tarihi: $kayit_tarihi';
  }

  String kullanici_adi;
  String sifre;
  String isim;
  String soyisim;
  String cinsiyet;
  DateTime kayit_tarihi;
  User({
    required this.kullanici_adi,
    required this.sifre,
    required this.isim,
    required this.soyisim,
    required this.cinsiyet,
    required this.kayit_tarihi,
  });

  User copyWith({
    String? kullanici_adi,
    String? sifre,
    String? isim,
    String? soyisim,
    String? cinsiyet,
    DateTime? kayit_tarihi,
  }) {
    return User(
      kullanici_adi: kullanici_adi ?? this.kullanici_adi,
      sifre: sifre ?? this.sifre,
      isim: isim ?? this.isim,
      soyisim: soyisim ?? this.soyisim,
      cinsiyet: cinsiyet ?? this.cinsiyet,
      kayit_tarihi: kayit_tarihi ?? this.kayit_tarihi,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kullanici_adi': kullanici_adi,
      'sifre': sifre,
      'isim': isim,
      'soyisim': soyisim,
      'cinsiyet': cinsiyet,
      'kayit_tarihi': kayit_tarihi.millisecondsSinceEpoch,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      kullanici_adi: map['kullanici_adi'] as String,
      sifre: map['sifre'] as String,
      isim: map['isim'] as String,
      soyisim: map['soyisim'] as String,
      cinsiyet: map['cinsiyet'] as String,
      kayit_tarihi:
          DateTime.fromMillisecondsSinceEpoch(map['kayit_tarihi'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.kullanici_adi == kullanici_adi &&
        other.sifre == sifre &&
        other.isim == isim &&
        other.soyisim == soyisim &&
        other.cinsiyet == cinsiyet &&
        other.kayit_tarihi == kayit_tarihi;
  }

  @override
  int get hashCode {
    return kullanici_adi.hashCode ^
        sifre.hashCode ^
        isim.hashCode ^
        soyisim.hashCode ^
        cinsiyet.hashCode ^
        kayit_tarihi.hashCode;
  }
}
