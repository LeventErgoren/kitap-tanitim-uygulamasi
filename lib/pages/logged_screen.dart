import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitap_tanitim_app/loggedWidgets/homePageText.dart';
import 'package:kitap_tanitim_app/loggedWidgets/home_books.dart';
import 'package:kitap_tanitim_app/loggedWidgets/home_page_drawer.dart';
import 'package:kitap_tanitim_app/models/kitap.dart';
import 'package:kitap_tanitim_app/models/user.dart';
import 'package:kitap_tanitim_app/pages/favorites_page.dart';
import 'package:kitap_tanitim_app/pages/profile_screen.dart';
import 'package:kitap_tanitim_app/riverpod/books.dart';
import 'package:kitap_tanitim_app/riverpod/homePageKategori.dart';
import 'package:kitap_tanitim_app/riverpod/loggedUser.dart';

class LoggedScreen extends ConsumerStatefulWidget {
  const LoggedScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoggedScreenState();
}

class _LoggedScreenState extends ConsumerState<LoggedScreen> {
  int nowIndex = 0;
  late List<String> kategoriler;
  final PageController _pageController = PageController();

  @override
  void initState() {
    kategoriler = _getKategoriler();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User u = ref.watch(LoggedUser);
    List<Kitap> kitaplar = ref.watch(Kitaplar);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          if (value == 0 && nowIndex == 0) {
            ref.read(HomePageKategori.notifier).state = 0;
          }

          print(value);
          nowIndex = value;

          _pageController.animateToPage(value,
              duration: Duration(milliseconds: 250), curve: Curves.linear);
          setState(() {});
        },
        currentIndex: nowIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Anasayfa'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favoriler'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      endDrawer: nowIndex == 0 ? HomePageDrawer() : null,
      body: PageView(
        allowImplicitScrolling: true,
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            nowIndex = value;
          });
        },
        children: [
          HomePageBody(context, kitaplar),
          FavoritesPage(),
          ProfileScreen(),
        ],
      ),
    );
  }

  HomePageBody(BuildContext context, List<Kitap> kitaplar) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'assets/pictures/hareketliresim.gif',
            ),
            fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          SizedBox(height: 30),
          SafeArea(child: HomePagetext(kitaplar: kitaplar)),
          SizedBox(height: 20),
          Expanded(
            child: HomeBooks(),
          ),
        ],
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
