import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitap_tanitim_app/riverpod/providers.dart';
import 'package:kitap_tanitim_app/services/databaseConnect.dart';
import 'package:postgres/postgres.dart';

final signUpUser = FutureProvider<bool>((ref) async {
  String userName = ref.read(UserName);
  String password = ref.read(Password);
  String name = ref.read(Name);
  String lastName = ref.read(LastName);
  String gender = ref.read(Cinsiyet);

  try {
    Connection conn = await ref.watch(getConnector.future);
    await conn.execute(
        "INSERT INTO kullanici (kullanici_adi, sifre, isim, soyisim, cinsiyet, kayit_tarihi) VALUES ('$userName', '$password', '$name', '$lastName', '$gender',CURRENT_DATE)");

    return true;
  } catch (e) {
    print("VERİTABANINDA HATA VAR!");
    print(e);
    return false;
  }
});
