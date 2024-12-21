import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitap_tanitim_app/models/favorites.dart';
import 'package:kitap_tanitim_app/riverpod/favorites.dart';
import 'package:kitap_tanitim_app/services/databaseAddFavorites.dart';
import 'package:kitap_tanitim_app/services/databaseDeleteFavorites.dart';

class BookDetailFavorite extends ConsumerStatefulWidget {
  final int kitap_id;
  const BookDetailFavorite({required this.kitap_id, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      BookDetailFavoriteState();
}

class BookDetailFavoriteState extends ConsumerState<BookDetailFavorite> {
  bool favori = true;
  @override
  Widget build(BuildContext context) {
    List<Favoriler> favoriler = ref.watch(FavoriProvider);
    if (favoriler
            .where(
              (element) => element.kitap_id == widget.kitap_id,
            )
            .length >
        0) {
      favori = true;
    } else {
      favori = false;
    }
    return IconButton(
        onPressed: () async {
          if (favoriler
                  .where(
                    (element) => element.kitap_id == widget.kitap_id,
                  )
                  .length >
              0) {
            print("silme çalışıyor");
            ref.read(FavoriProvider.notifier).update(
              (state) {
                return state
                    .where((e) => e.kitap_id != widget.kitap_id)
                    .toList();
              },
            );
            await ref.read(DeleteFavorite(widget.kitap_id).future);
            ref.invalidate(DeleteFavorite);
            favori = false;
          } else {
            print("ekleme çalışıyor");
            await ref.read(AddFavorites(widget.kitap_id).future);
            ref.invalidate(AddFavorites);

            favori = true;
          }
        },
        icon: favori
            ? Image.asset(
                'assets/pictures/doluKalp.png',
                width: 25,
                height: 25,
              )
            : Image.asset(
                'assets/pictures/bosKalp.png',
                width: 25,
                height: 25,
              ));
  }
}
