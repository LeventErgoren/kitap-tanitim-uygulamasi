import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitap_tanitim_app/constants/querys.dart';
import 'package:kitap_tanitim_app/riverpod/books.dart';
import 'package:kitap_tanitim_app/riverpod/loggedUser.dart';
import 'package:kitap_tanitim_app/services/databaseConnect.dart';
import 'package:kitap_tanitim_app/services/databaseFavorites.dart';
import 'package:postgres/postgres.dart';

final FavoritesDismissed = FutureProvider.family((ref, int kitapId) async {
  try {
    String kullaniciAdi = ref.read(LoggedUser).kullanici_adi;

    Connection conn = await ref.watch(getConnector.future);

    var result = await conn
        .execute(Querys.favoritesDismissedQuery(kullaniciAdi, kitapId));
    print("Silme Başarılı");
  } catch (e) {
    print("Kitap silinirken bir sorun yaşandı");
    print(e);
  }
});
