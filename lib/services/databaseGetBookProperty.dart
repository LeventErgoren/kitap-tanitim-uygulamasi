import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitap_tanitim_app/constants/querys.dart';
import 'package:kitap_tanitim_app/models/kitapDetay.dart';
import 'package:kitap_tanitim_app/riverpod/bookProperty.dart';
import 'package:kitap_tanitim_app/services/databaseConnect.dart';
import 'package:postgres/postgres.dart';

final BookProperty = FutureProvider.family((ref, int kitapId) async {
  Connection conn = await ref.watch(getConnector.future);

  try {
    Result result = await conn.execute(Querys.getBookProperty(kitapId));

    print("SONUÇ ALINDI ********************");
    List<KitapDetay> kitap = [];

    for (var row in result) {
      Map<String, dynamic> kMap = {
        "kitap_id": row[0],
        "kitap_adi": row[1],
        "sayfa_sayisi": row[2],
        "aciklama": row[3],
        "resim": row[4],
        "yazar_adi": row[5],
        "yazar_soyadi": row[6],
        "dogum_tarihi": row[7],
        "kategori_adi": row[8],
        "puan": row[9],
        "film_adi": row[10],
        "kategori": row[11],
        "yonetmen_adi": row[12],
        "yayin_yili": row[13],
        "kutuphane_adi": row[14],
        "kutuphane_adres": row[15],
        "site_adi": row[16],
        "ucret": row[17],
        "yayinevi_adi": row[18],
        "adres": row[19],
      };

      KitapDetay k = KitapDetay.fromMap(kMap);
      kitap.add(k);
    }

    print("Kitap Detayları Alındı!");
    ref.read(BookDetay.notifier).state = kitap;
  } catch (e) {
    print("KİTAP DETAYDA SORUN VAR!");
    print(e);
  }
});
