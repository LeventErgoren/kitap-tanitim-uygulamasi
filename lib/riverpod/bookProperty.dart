import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitap_tanitim_app/models/kitapDetay.dart';

final BookDetay = StateProvider<List<KitapDetay>>((ref) {
  return [];
});

