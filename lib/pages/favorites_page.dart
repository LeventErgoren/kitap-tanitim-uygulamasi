import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitap_tanitim_app/constants/constants.dart';
import 'package:kitap_tanitim_app/constants/renkler.dart';
import 'package:kitap_tanitim_app/constants/texts.dart';
import 'package:kitap_tanitim_app/models/favorites.dart';
import 'package:kitap_tanitim_app/riverpod/favorites.dart';
import 'package:kitap_tanitim_app/services/databaseFavorites.dart';
import 'package:kitap_tanitim_app/services/databaseFavoritesDismissed.dart';

class FavoritesPage extends ConsumerStatefulWidget {
  const FavoritesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends ConsumerState<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    ref.watch(Favorites.future);
    List<Favoriler> favoriler = ref.watch(FavoriProvider);
    return SafeArea(
        child: favoriler.length == 0
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/pictures/empty.png',
                      height: 125,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Henüz kitap",
                      style: Texts.favorilerKitapYokTextStyle,
                    ),
                    Text(
                      "favorilemediniz!",
                      style: Texts.favorilerKitapYokTextStyle,
                    )
                  ],
                ),
              )
            : Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Favoriler",
                    style: Texts.favorilerTextStyle,
                  ),
                  Divider(),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        Favoriler f = favoriler[index];

                        return Dismissible(
                          background: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Siliniyor..."),
                                Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )
                              ],
                            ),
                          ),
                          confirmDismiss: (direction) async {
                            return await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    "Kitabı favorilerden çıkarmak istediğinize emin misiniz?",
                                    textAlign: TextAlign.center,
                                    style: Texts.favorilerTitle,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(false);
                                      },
                                      child: Text("Hayır"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(true);
                                      },
                                      child: Text("Evet"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          onDismissed: (direction) {
                            ref.read(FavoriProvider.notifier).update((state) {
                              return state
                                  .where(
                                      (kitap) => kitap.kitap_id != f.kitap_id)
                                  .toList();
                            });
                            ref.read(FavoritesDismissed(f.kitap_id));
                          },
                          key: UniqueKey(),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Container(
                              height: 235,
                              decoration: BoxDecoration(
                                color: Renkler.favoritesColor,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Image.network(
                                        f.resim,
                                        height: 125,
                                        width: 100,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        _kitapAdi(f.kitap_adi),
                                        textAlign: TextAlign.center,
                                        style:
                                            Texts.favoritesKitapNameTextStyle,
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Yazar: ',
                                            style: Texts.favoritesBoldTextStyle,
                                          ),
                                          Text(
                                            _kitapAdi(
                                              f.yazar_adi +
                                                  ' ' +
                                                  f.yazar_soyadi,
                                            ),
                                            style:
                                                Texts.favoritesNormalTextStyle,
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Kategori: ",
                                            style: Texts.favoritesBoldTextStyle,
                                          ),
                                          Text(
                                            f.kategori_adi,
                                            style:
                                                Texts.favoritesNormalTextStyle,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Sayfa Sayısı: ",
                                            style: Texts.favoritesBoldTextStyle,
                                          ),
                                          Text(
                                            f.sayfa_sayisi.toString(),
                                            style:
                                                Texts.favoritesNormalTextStyle,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: favoriler.length,
                    ),
                  ),
                ],
              ));
  }

  String _kitapAdi(String kitap_adi) {
    String k = "";
    if (kitap_adi.split(" ").length > 2) {
      for (int i = 0; i < kitap_adi.split(" ").length; i++) {
        k += kitap_adi.split(" ")[i] + ' ';
        if (i != 0 && i % 2 == 1) {
          k += '\n';
        }
      }
    } else {
      k = kitap_adi;
    }

    return k;
  }
}
