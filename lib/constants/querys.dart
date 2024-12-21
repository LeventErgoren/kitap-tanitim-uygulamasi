class Querys {
  static String kitapYazarQuery =
      "SELECT k.kitap_id, k.kitap_adi, k.sayfa_sayisi, k.aciklama, k.yazar_id, k.kategori_id, k.resim, y.yazar_adi, y.yazar_soyadi FROM kitap k, yazar y WHERE k.yazar_id = y.yazar_id ORDER BY RANDOM()";

  static String favorilerQuery(String kullaniciId) {
    return "SELECT k.kitap_id, k.kitap_adi, k.sayfa_sayisi, k.resim, y.yazar_adi, y.yazar_soyadi, kg.kategori_adi FROM kullanici kk, favoriler f, kitap k, yazar y, kategori kg WHERE kk.kullanici_adi = '$kullaniciId' AND kk.kullanici_id = f.kullanici_id AND f.kitap_id = k.kitap_id AND k.yazar_id = y.yazar_id AND k.kategori_id = kg.kategori_id";
  }

  static String favoritesDismissedQuery(String kullaniciAdi, int kitapId) {
    return "DELETE FROM favoriler WHERE kullanici_id = (SELECT kullanici_id FROM kullanici WHERE kullanici_adi = '$kullaniciAdi') AND kitap_id = $kitapId";
  }

  static String deleteFavorite(String kullaniciAdi, int kitapId) {
    return "DELETE FROM favoriler WHERE kitap_id = $kitapId AND kullanici_id = (SELECT kullanici_id FROM kullanici where kullanici_adi = '$kullaniciAdi')";
  }

  static String addFavorite(String kullaniciAdi, int kitap_id) {
    return "INSERT INTO favoriler (kitap_id, kullanici_id) VALUES($kitap_id, (SELECT kullanici_id FROM kullanici WHERE kullanici_adi = '$kullaniciAdi'))";
  }

  static addFavoriteCast(int kitapId) {
    return "SELECT k.kitap_id, k.kitap_adi, k.sayfa_sayisi, k.resim, y.yazar_adi, y.yazar_soyadi, kg.kategori_adi FROM kitap k, yazar y, kategori kg WHERE k.yazar_id = y.yazar_id AND k.kategori_id = kg.kategori_id AND k.kitap_id = $kitapId";
  }

  static getBookProperty(int kitapId) {
    return "SELECT k.kategori_id, k.kitap_adi, k.sayfa_sayisi, k.aciklama, k.resim , y.yazar_adi, y.yazar_soyadi, y.dogum_tarihi, ktg.kategori_adi, d.puan , f.film_adi, f.kategori, f.yonetmen_adi, f.yayin_yili, kh.kutuphane_adi , kh.kutuphane_adres, p.site_adi, p.ucret, ye.yayinevi_adi, ye.adres FROM kitap k LEFT JOIN film f USING(kitap_id) INNER JOIN yazar y ON k.yazar_id = y.yazar_id INNER JOIN degerlendirme d ON k.degerlendirme_id = d.degerlendirme_id INNER JOIN kategori ktg ON k.kategori_id = ktg.kategori_id LEFT JOIN pdf p ON p.kitap_id = k.kitap_id INNER JOIN kutup_kitap kk ON kk.kitap_id = k.kitap_id INNER JOIN kutuphane kh ON kh.kutuphane_id = kk.kutuphane_id INNER JOIN yayinevi ye ON ye.yayinevi_id = kh.yayinevi_id WHERE k.kitap_id = $kitapId";
  }
}
