import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitap_tanitim_app/constants/querys.dart';
import 'package:kitap_tanitim_app/models/favorites.dart';
import 'package:kitap_tanitim_app/riverpod/favorites.dart';
import 'package:kitap_tanitim_app/riverpod/loggedUser.dart';
import 'package:kitap_tanitim_app/services/databaseConnect.dart';
import 'package:kitap_tanitim_app/services/databaseFavorites.dart';
import 'package:postgres/postgres.dart';

final AddFavorites = FutureProvider.family((ref, int kitapId) async {
  String kullaniciAdi = ref.read(LoggedUser).kullanici_adi;
  Connection conn = await ref.read(getConnector.future);

  try {
    Result result =
        await conn.execute(Querys.addFavorite(kullaniciAdi, kitapId));

    result = await conn.execute(Querys.addFavoriteCast(kitapId));

    Favoriler favori;

    var row = result[0];

    Map<String, dynamic> favoriMap = {
      'kitap_id': row[0],
      'kitap_adi': row[1],
      'sayfa_sayisi': row[2],
      'resim': row[3],
      'yazar_adi': row[4],
      'yazar_soyadi': row[5],
      'kategori_adi': row[6],
    };

    favori = Favoriler.fromMap(favoriMap);

    ref.read(FavoriProvider.notifier).update(
      (state) {
        return [...state, favori];
      },
    );
  } catch (e) {
    print("FAVORİLERE EKLEMEDE SORUN VAR!");
    print(e);
  }
});
