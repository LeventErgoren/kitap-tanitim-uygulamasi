import 'package:flutter/material.dart';
import 'package:kitap_tanitim_app/constants/constants.dart';
import 'package:kitap_tanitim_app/constants/decoration.dart';

class Kategoriler extends StatelessWidget {
  const Kategoriler({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        SizedBox(width: 10),
        kategoriOlustur("Komedi", Colors.white),
        SizedBox(width: 10),
        kategoriOlustur("Dram", Colors.white),
        SizedBox(width: 10),
        kategoriOlustur("Eleştiri", Colors.white),
        SizedBox(width: 10),
        kategoriOlustur("Deneme", Colors.white),
        SizedBox(width: 10),
        kategoriOlustur("Polisiye", Colors.white),
        SizedBox(width: 10),
        kategoriOlustur("Roman", Colors.white),
        SizedBox(width: 10),
        kategoriOlustur("Çocuk Kitapları", Colors.white),
        SizedBox(width: 10),
        kategoriOlustur("Felsefik Kurgu", Colors.white),
        SizedBox(width: 10),
      ],
    );
  }

  kategoriOlustur(String kategoriName, Color renk) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: Decorations.kategoriBorderRadius,
      ),
      child: IntrinsicWidth(
        stepWidth: 40,
        child: Center(
          child: Padding(
            padding: Constants.kategoriPadding,
            child: Text(kategoriName),
          ),
        ),
      ),
    );
  }
}
