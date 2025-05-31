import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitap_tanitim_app/constants/constants.dart';
import 'package:kitap_tanitim_app/constants/navigator.dart';
import 'package:kitap_tanitim_app/constants/texts.dart';
import 'package:kitap_tanitim_app/models/favorites.dart';
import 'package:kitap_tanitim_app/models/kitap.dart';
import 'package:kitap_tanitim_app/riverpod/books.dart';
import 'package:kitap_tanitim_app/riverpod/favorites.dart';
import 'package:kitap_tanitim_app/riverpod/homePageKategori.dart';
import 'package:kitap_tanitim_app/services/databaseAddFavorites.dart';
import 'package:kitap_tanitim_app/services/databaseBookGet.dart';
import 'package:kitap_tanitim_app/services/databaseDeleteFavorites.dart';
import 'package:kitap_tanitim_app/services/databaseFavorites.dart';

class HomeBooks extends ConsumerStatefulWidget {
  const HomeBooks({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeBooksState();
}

class _HomeBooksState extends ConsumerState<HomeBooks> {
  @override
  Widget build(BuildContext context) {
    List<Favoriler> favoriler = ref.watch(FavoriProvider);
    List<Kitap> kitaplar = ref.watch(Kitaplar);
    int kategori = ref.watch(HomePageKategori);

    if (kategori != 0) {
      kitaplar = kitaplar
          .where(
            (element) => element.kategori_id == kategori,
          )
          .toList();
    }

    print(kitaplar.length);

    return Padding(
        padding: Constants.homeBooksPadding,
        child: kitaplar.length > 0
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 300,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  var k = kitaplar[index];

                  return kitapGoster(k, favoriler);
                },
                itemCount: kitaplar.length,
              )
            : Center(
                child: Text(
                  "Bu Türde Kitap Bulunamadı!",
                  style: GoogleFonts.beVietnamPro(
                      color: Colors.white, fontSize: 18),
                ),
              ));
  }

  kitapGoster(Kitap k, List<Favoriler> favoriler) {
    bool favori = false;

    if (favoriler
            .where(
              (element) => element.kitap_id == k.kitap_id,
            )
            .length >
        0) {
      favori = true;
    } else {
      favori = false;
    }
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          child: InkWell(
            onTap: () {
              ClassNavigator.pushBookDetayClass(context, k, ref);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              width: 170,
              height: 200,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            ClassNavigator.pushBookDetayClass(context, k, ref);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                SizedBox(height: 30),
                Hero(
                  tag: k.kitap_id,
                  child: Image.network(
                    k.resim,
                    width: 200,
                    height: 180,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  k.kitap_adi,
                  style: Texts.kitapNameTextStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  k.yazar_adi + ' ' + k.yazar_soyadi,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -5,
          right: -5,
          child: IconButton(
              onPressed: () async {
                if (favoriler
                        .where(
                          (element) => element.kitap_id == k.kitap_id,
                        )
                        .length >
                    0) {
                  print("silme çalışıyor");
                  ref.read(FavoriProvider.notifier).update(
                    (state) {
                      return state
                          .where((e) => e.kitap_id != k.kitap_id)
                          .toList();
                    },
                  );
                  await ref.read(DeleteFavorite(k.kitap_id).future);
                  ref.invalidate(DeleteFavorite);
                } else {
                  print("ekleme çalışıyor");
                  await ref.read(AddFavorites(k.kitap_id).future);
                  ref.invalidate(AddFavorites);
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
                    )),
        ),
      ],
    );
  }
}
