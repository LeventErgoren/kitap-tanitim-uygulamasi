import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitap_tanitim_app/models/user.dart';
import 'package:kitap_tanitim_app/riverpod/loggedUser.dart';
import 'package:kitap_tanitim_app/riverpod/providers.dart';
import 'package:kitap_tanitim_app/services/databaseConnect.dart';
import 'package:postgres/postgres.dart';

final loginUser = FutureProvider<bool>((ref) async {
  String userName = ref.read(LoginUserName);
  String password = ref.read(LoginPassword);

  try {
    Connection conn = await ref.watch(getConnector.future);

    var result = await conn.execute(
        "SELECT * FROM kullanici WHERE kullanici_adi = '$userName' AND sifre = '$password'");

    if (result.length > 0) {
      User user = new User(
          kullanici_adi: result[0][1].toString(),
          sifre: result[0][2].toString(),
          isim: result[0][3].toString(),
          soyisim: result[0][4].toString(),
          cinsiyet: result[0][5].toString(),
          kayit_tarihi: result[0][6] as DateTime);

      ref.read(LoggedUser.notifier).state = user;

      return true;
    }
    return false;
  } catch (e) {
    print("GİRİŞ YAPMADA SORUN VAR");
    print(e);
    return false;
  }
});
