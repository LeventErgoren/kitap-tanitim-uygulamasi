// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class KitapDetay {
  int kitap_id;
  String kitap_adi;
  int sayfa_sayisi;
  String aciklama;
  String resim;
  String yazar_adi;
  String yazar_soyadi;
  DateTime dogum_tarihi;
  String kategori_adi;
  int puan;
  String? film_adi;
  String? kategori;
  String? yonetmen_adi;
  int? yayin_yili;
  String kutuphane_adi;
  String kutuphane_adres;
  String? site_adi;
  int? ucret;
  String yayinevi_adi;
  String adres;
  KitapDetay({
    required this.kitap_id,
    required this.kitap_adi,
    required this.sayfa_sayisi,
    required this.aciklama,
    required this.resim,
    required this.yazar_adi,
    required this.yazar_soyadi,
    required this.dogum_tarihi,
    required this.kategori_adi,
    required this.puan,
    this.film_adi,
    this.kategori,
    this.yonetmen_adi,
    this.yayin_yili,
    required this.kutuphane_adi,
    required this.kutuphane_adres,
    this.site_adi,
    this.ucret,
    required this.yayinevi_adi,
    required this.adres,
  });

  KitapDetay copyWith({
    int? kitap_id,
    String? kitap_adi,
    int? sayfa_sayisi,
    String? aciklama,
    String? resim,
    String? yazar_adi,
    String? yazar_soyadi,
    DateTime? dogum_tarihi,
    String? kategori_adi,
    int? puan,
    String? film_adi,
    String? kategori,
    String? yonetmen_adi,
    int? yayin_yili,
    String? kutuphane_adi,
    String? kutuphane_adres,
    String? site_adi,
    int? ucret,
    String? yayinevi_adi,
    String? adres,
  }) {
    return KitapDetay(
      kitap_id: kitap_id ?? this.kitap_id,
      kitap_adi: kitap_adi ?? this.kitap_adi,
      sayfa_sayisi: sayfa_sayisi ?? this.sayfa_sayisi,
      aciklama: aciklama ?? this.aciklama,
      resim: resim ?? this.resim,
      yazar_adi: yazar_adi ?? this.yazar_adi,
      yazar_soyadi: yazar_soyadi ?? this.yazar_soyadi,
      dogum_tarihi: dogum_tarihi ?? this.dogum_tarihi,
      kategori_adi: kategori_adi ?? this.kategori_adi,
      puan: puan ?? this.puan,
      film_adi: film_adi ?? this.film_adi,
      kategori: kategori ?? this.kategori,
      yonetmen_adi: yonetmen_adi ?? this.yonetmen_adi,
      yayin_yili: yayin_yili ?? this.yayin_yili,
      kutuphane_adi: kutuphane_adi ?? this.kutuphane_adi,
      kutuphane_adres: kutuphane_adres ?? this.kutuphane_adres,
      site_adi: site_adi ?? this.site_adi,
      ucret: ucret ?? this.ucret,
      yayinevi_adi: yayinevi_adi ?? this.yayinevi_adi,
      adres: adres ?? this.adres,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kitap_id': kitap_id,
      'kitap_adi': kitap_adi,
      'sayfa_sayisi': sayfa_sayisi,
      'aciklama': aciklama,
      'resim': resim,
      'yazar_adi': yazar_adi,
      'yazar_soyadi': yazar_soyadi,
      'dogum_tarihi': dogum_tarihi.millisecondsSinceEpoch,
      'kategori_adi': kategori_adi,
      'puan': puan,
      'film_adi': film_adi,
      'kategori': kategori,
      'yonetmen_adi': yonetmen_adi,
      'yayin_yili': yayin_yili,
      'kutuphane_adi': kutuphane_adi,
      'kutuphane_adres': kutuphane_adres,
      'site_adi': site_adi,
      'ucret': ucret,
      'yayinevi_adi': yayinevi_adi,
      'adres': adres,
    };
  }

  factory KitapDetay.fromMap(Map<String, dynamic> map) {
    return KitapDetay(
      kitap_id: map['kitap_id'] as int,
      kitap_adi: map['kitap_adi'] as String,
      sayfa_sayisi: map['sayfa_sayisi'] as int,
      aciklama: map['aciklama'] as String,
      resim: map['resim'] as String,
      yazar_adi: map['yazar_adi'] as String,
      yazar_soyadi: map['yazar_soyadi'] as String,
      dogum_tarihi: map['dogum_tarihi'] as DateTime,
      kategori_adi: map['kategori_adi'] as String,
      puan: map['puan'] as int,
      film_adi: map['film_adi'] != null ? map['film_adi'] as String : null,
      kategori: map['kategori'] != null ? map['kategori'] as String : null,
      yonetmen_adi:
          map['yonetmen_adi'] != null ? map['yonetmen_adi'] as String : null,
      yayin_yili: map['yayin_yili'] != null ? map['yayin_yili'] as int : null,
      kutuphane_adi: map['kutuphane_adi'] as String,
      kutuphane_adres: map['kutuphane_adres'] as String,
      site_adi: map['site_adi'] != null ? map['site_adi'] as String : null,
      ucret: map['ucret'] != null ? map['ucret'] as int : null,
      yayinevi_adi: map['yayinevi_adi'] as String,
      adres: map['adres'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory KitapDetay.fromJson(String source) =>
      KitapDetay.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'KitapDetay(kitap_id: $kitap_id, kitap_adi: $kitap_adi, sayfa_sayisi: $sayfa_sayisi, aciklama: $aciklama, resim: $resim, yazar_adi: $yazar_adi, yazar_soyadi: $yazar_soyadi, dogum_tarihi: $dogum_tarihi, kategori_adi: $kategori_adi, puan: $puan, film_adi: $film_adi, kategori: $kategori, yonetmen_adi: $yonetmen_adi, yayin_yili: $yayin_yili, kutuphane_adi: $kutuphane_adi, kutuphane_adres: $kutuphane_adres, site_adi: $site_adi, ucret: $ucret, yayinevi_adi: $yayinevi_adi, adres: $adres)';
  }

  @override
  bool operator ==(covariant KitapDetay other) {
    if (identical(this, other)) return true;

    return other.kitap_id == kitap_id &&
        other.kitap_adi == kitap_adi &&
        other.sayfa_sayisi == sayfa_sayisi &&
        other.aciklama == aciklama &&
        other.resim == resim &&
        other.yazar_adi == yazar_adi &&
        other.yazar_soyadi == yazar_soyadi &&
        other.dogum_tarihi == dogum_tarihi &&
        other.kategori_adi == kategori_adi &&
        other.puan == puan &&
        other.film_adi == film_adi &&
        other.kategori == kategori &&
        other.yonetmen_adi == yonetmen_adi &&
        other.yayin_yili == yayin_yili &&
        other.kutuphane_adi == kutuphane_adi &&
        other.kutuphane_adres == kutuphane_adres &&
        other.site_adi == site_adi &&
        other.ucret == ucret &&
        other.yayinevi_adi == yayinevi_adi &&
        other.adres == adres;
  }

  @override
  int get hashCode {
    return kitap_id.hashCode ^
        kitap_adi.hashCode ^
        sayfa_sayisi.hashCode ^
        aciklama.hashCode ^
        resim.hashCode ^
        yazar_adi.hashCode ^
        yazar_soyadi.hashCode ^
        dogum_tarihi.hashCode ^
        kategori_adi.hashCode ^
        puan.hashCode ^
        film_adi.hashCode ^
        kategori.hashCode ^
        yonetmen_adi.hashCode ^
        yayin_yili.hashCode ^
        kutuphane_adi.hashCode ^
        kutuphane_adres.hashCode ^
        site_adi.hashCode ^
        ucret.hashCode ^
        yayinevi_adi.hashCode ^
        adres.hashCode;
  }
}
