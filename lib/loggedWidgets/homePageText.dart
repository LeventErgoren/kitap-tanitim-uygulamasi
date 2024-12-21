import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitap_tanitim_app/constants/constants.dart';
import 'package:kitap_tanitim_app/constants/texts.dart';
import 'package:kitap_tanitim_app/loggedWidgets/show_search_delegate.dart';
import 'package:kitap_tanitim_app/models/kitap.dart';

class HomePagetext extends ConsumerWidget {
  final List<Kitap> kitaplar;
  const HomePagetext({required this.kitaplar, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Padding(
        padding: Constants.homePageTextPadding,
        child: Row(
          children: [
            Expanded(
              child: Text(
                "BelleKitap",
                style: Texts.homePageTextStyle,
              ),
            ),
            IconButton(
                onPressed: () {
                  _showSearch(context, kitaplar, ref);
                },
                icon: Image.asset(
                  'assets/pictures/search.png',
                  height: 17,
                  width: 17,
                  color: Colors.white,
                )),
            IconButton(
              icon: Image.asset(
                'assets/pictures/menu.png',
                height: 19,
                width: 19,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showSearch(BuildContext context, List<Kitap> kitaplar, WidgetRef r) {
    showSearch(
      context: context,
      delegate: CustomSearchDelegete(kitaplar, r),
    );
  }
}
