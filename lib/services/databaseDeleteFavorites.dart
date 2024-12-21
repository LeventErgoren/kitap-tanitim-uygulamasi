import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitap_tanitim_app/constants/querys.dart';
import 'package:kitap_tanitim_app/riverpod/loggedUser.dart';
import 'package:kitap_tanitim_app/services/databaseConnect.dart';
import 'package:postgres/postgres.dart';

final DeleteFavorite = FutureProvider.family((ref, int kitapId) async {
  String kullaniciAdi = ref.read(LoggedUser).kullanici_adi;

  try {
    Connection conn = await ref.watch(getConnector.future);
    Result result =
        await conn.execute(Querys.deleteFavorite(kullaniciAdi, kitapId));

    print("Favorilerden silindi.");
  } catch (e) {
    print("FAVORİ SİLMEDE HATA VAR!");
    print(e);
  }
});
