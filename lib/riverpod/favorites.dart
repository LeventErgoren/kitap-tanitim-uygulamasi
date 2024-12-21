import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitap_tanitim_app/models/favorites.dart';

final FavoriProvider = StateProvider<List<Favoriler>>((ref) {
  return [];
});
