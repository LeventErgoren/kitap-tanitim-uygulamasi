import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitap_tanitim_app/models/kitap.dart';

final Kitaplar = StateProvider<List<Kitap>>((ref) {
  return [];
});
