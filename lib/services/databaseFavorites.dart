import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitap_tanitim_app/constants/querys.dart';
import 'package:kitap_tanitim_app/models/favorites.dart';
import 'package:kitap_tanitim_app/riverpod/favorites.dart';
import 'package:kitap_tanitim_app/riverpod/loggedUser.dart';
import 'package:kitap_tanitim_app/services/databaseConnect.dart';
import 'package:postgres/postgres.dart';

final Favorites = FutureProvider<List<Favoriler>>((ref) async {
  try {
    String kullaniciAdi = ref.read(LoggedUser).kullanici_adi;
    Connection conn = await ref.watch(getConnector.future);

    final result = await conn.execute(Querys.favorilerQuery(kullaniciAdi));

    List<Favoriler> favoriler = [];

    for (var row in result) {
      Map<String, dynamic> favoriMap = {
        'kitap_id': row[0],
        'kitap_adi': row[1],
        'sayfa_sayisi': row[2],
        'resim': row[3],
        'yazar_adi': row[4],
        'yazar_soyadi': row[5],
        'kategori_adi': row[6],
      };

      Favoriler favori = Favoriler.fromMap(favoriMap);
      favoriler.add(favori);
    }

    ref.read(FavoriProvider.notifier).state = favoriler;
  } catch (e) {
    print("Favorilerde sorun var.");
    print(e);
  }

  return [];
});
