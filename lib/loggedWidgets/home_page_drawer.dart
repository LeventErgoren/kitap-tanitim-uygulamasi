import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitap_tanitim_app/constants/texts.dart';
import 'package:kitap_tanitim_app/riverpod/homePageKategori.dart';

class HomePageDrawer extends ConsumerStatefulWidget {
  const HomePageDrawer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageDrawerState();
}

class _HomePageDrawerState extends ConsumerState<HomePageDrawer> {
  late List<String> kategoriler;

  @override
  void initState() {
    kategoriler = _getKategoriler();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 0; i < kategoriler.length; i++)
              InkWell(
                onTap: () {
                  ref.read(HomePageKategori.notifier).state = i + 1;
                  Scaffold.of(context).closeEndDrawer();
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: Center(
                    child: Text(
                      kategoriler[i],
                      style: Texts.homePageKategoriTextStyle,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  List<String> _getKategoriler() {
    List<String> k = [
      "Komedi",
      "Dram",
      "Eleştiri",
      "Deneme",
      "Polisiye",
      "Roman",
      "Çocuk Kitapları",
      "Felsefik Kurgu",
      "Şiir",
    ];

    return k;
  }
}
