import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitap_tanitim_app/constants/navigator.dart';
import 'package:kitap_tanitim_app/models/kitap.dart';

class CustomSearchDelegete extends SearchDelegate {
  late List<Kitap> k;
  late WidgetRef r;
  CustomSearchDelegete(List<Kitap> kitaplar, WidgetRef ref) {
    k = kitaplar;
    r = ref;
  }

  String get searchFieldLabel => 'Ara';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query.isEmpty ? null : query = "";
        },
        icon: Icon(
          Icons.clear,
          color: Colors.black,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    late List<Kitap> gecici;
    print(query);
    gecici = k
        .where((element) =>
            element.kitap_adi.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return gecici.length > 0
        ? ListView.builder(
            itemBuilder: (context, index) {
              Kitap kitap = gecici[index];

              return InkWell(
                onTap: () {
                  ClassNavigator.pushBookDetayClass(context, kitap, r);
                },
                child: ListTile(
                  leading: Hero(
                    tag: kitap.kitap_id,
                    child: Image.network(kitap.resim),
                  ),
                  title: Text(kitap.kitap_adi),
                  subtitle: Text(kitap.yazar_adi + ' ' + kitap.yazar_soyadi),
                ),
              );
            },
            itemCount: gecici.length,
          )
        : Center(
            child: Text("Böyle bir kitap bulunamadı!"),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    late List<Kitap> gecici;
    print(query);
    gecici = k
        .where((element) =>
            element.kitap_adi.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return gecici.length > 0
        ? ListView.builder(
            itemBuilder: (context, index) {
              Kitap kitap = gecici[index];
              return InkWell(
                onTap: () {
                  ClassNavigator.pushBookDetayClass(context, kitap, r);
                },
                child: ListTile(
                  leading: Hero(
                    tag: kitap.kitap_id,
                    child: Image.network(kitap.resim),
                  ),
                  title: Text(kitap.kitap_adi),
                  subtitle: Text(kitap.yazar_adi + ' ' + kitap.yazar_soyadi),
                ),
              );
            },
            itemCount: gecici.length,
          )
        : Center(
            child: Text("Böyle bir kitap bulunamadı!"),
          );
  }
}
