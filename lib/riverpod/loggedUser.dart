import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitap_tanitim_app/models/user.dart';

final LoggedUser = StateProvider<User>((ref) {
  return User(
      kullanici_adi: "",
      sifre: "",
      isim: "",
      soyisim: "",
      cinsiyet: "",
      kayit_tarihi: DateTime.now());
});
