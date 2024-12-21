import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitap_tanitim_app/constants/constants.dart';
import 'package:kitap_tanitim_app/constants/navigator.dart';
import 'package:kitap_tanitim_app/constants/texts.dart';
import 'package:kitap_tanitim_app/loggedWidgets/bookDetailProperty.dart';
import 'package:kitap_tanitim_app/loggedWidgets/book_detail_favorite.dart';
import 'package:kitap_tanitim_app/models/favorites.dart';
import 'package:kitap_tanitim_app/models/kitap.dart';
import 'package:kitap_tanitim_app/models/kitapDetay.dart';
import 'package:kitap_tanitim_app/pages/pdf_pages.dart';
import 'package:kitap_tanitim_app/riverpod/bookProperty.dart';
import 'package:kitap_tanitim_app/riverpod/favorites.dart';
import 'package:kitap_tanitim_app/services/databaseGetBookProperty.dart';
import 'package:palette_generator/palette_generator.dart';

class BookDetailPage extends ConsumerStatefulWidget {
  final Kitap k;
  final Color renk;
  const BookDetailPage({required this.k, required this.renk, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => BookDetailPageState();
}

class BookDetailPageState extends ConsumerState<BookDetailPage> {
  late Color renk;
  late List<KitapDetay> kitap;
  late KitapDetay? kd = null;

  @override
  void initState() {
    renk = widget.renk;
    _getKitap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Kitap k = widget.k;

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          ref.invalidate(BookProperty);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: renk,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 276,
                  ),
                  Positioned(
                    top: 200,
                    child: Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                    ),
                  ),
                  Positioned(
                    top: 75,
                    left: 0,
                    right: 0,
                    child: Hero(
                      tag: k.kitap_id,
                      child: Image.network(
                        k.resim,
                        height: 200,
                      ),
                    ),
                  ),
                  SafeArea(
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        ClassNavigator.popClass(context);
                      },
                    ),
                  ),
                  Positioned(
                    left: 50,
                    bottom: 8,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            ClassNavigator.pushNormalClass(
                              context,
                              PdfPages(
                                k: k,
                                appBarColor: renk,
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/pictures/oku.png',
                            width: 33,
                            height: 33,
                            color: Colors.black.withOpacity(0.80),
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Text("Oku"),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 40,
                    bottom: 10,
                    child: Column(
                      children: [
                        BookDetailFavorite(
                          kitap_id: k.kitap_id,
                        ),
                        Text("Favorile"),
                      ],
                    ),
                  ),
                ],
              ),
              kd == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : BookDetailProperty(kd: kd!, kitap: kitap!),
            ],
          ),
        ),
      ),
    );
  }

  _getKitap() async {
    List<KitapDetay> k = await ref.read(BookDetay);
    kitap = k;
    kd = k[0];
    setState(() {});
  }
}
