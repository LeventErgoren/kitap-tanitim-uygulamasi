import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitap_tanitim_app/constants/querys.dart';
import 'package:kitap_tanitim_app/models/kitap.dart';
import 'package:kitap_tanitim_app/riverpod/books.dart';
import 'package:kitap_tanitim_app/services/databaseConnect.dart';

final getBooks = FutureProvider<void>((ref) async {
  try {
    final conn = await ref.watch(getConnector.future);
    final result = await conn.execute(Querys.kitapYazarQuery);

    print(result[4].toString());

    List<Kitap> kitaplar = [];

    for (var row in result) {
      Map<String, dynamic> kitapMap = {
        'kitap_id': row[0],
        'kitap_adi': row[1],
        'sayfa_sayisi': row[2],
        'aciklama': row[3],
        'yazar_id': row[4],
        'kategori_id': row[5],
        'resim': row[6],
        'yazar_adi': row[7],
        'yazar_soyadi': row[8],
      };
      Kitap kitap = Kitap.fromMap(kitapMap);
      kitaplar.add(kitap);
    }

    ref.read(Kitaplar.notifier).state = kitaplar;
    print("Kitaplar Alındı");
  } catch (e) {
    print("Kitaplar Alınamadı");
    print(e);
  }
});
