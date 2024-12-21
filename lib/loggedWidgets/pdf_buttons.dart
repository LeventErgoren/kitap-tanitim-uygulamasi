import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitap_tanitim_app/constants/texts.dart';
import 'package:kitap_tanitim_app/models/kitap.dart';
import 'package:kitap_tanitim_app/riverpod/kitapSayfasi.dart';
import 'package:pdfx/pdfx.dart';

class PdfButtons extends ConsumerStatefulWidget {
  final PdfController kitap;
  final Kitap k;
  const PdfButtons({required this.kitap, required this.k, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PdfButtonsState();
}

class _PdfButtonsState extends ConsumerState<PdfButtons> {
  @override
  Widget build(BuildContext context) {
    int sayfa = ref.watch(KitapSayfasi);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                widget.kitap.animateToPage(
                  sayfa - 1,
                  duration: Duration(seconds: 1),
                  curve: Curves.easeOutQuint,
                );
              },
              icon: Icon(Icons.arrow_back_ios),
              iconSize: 20,
            ),
            Text(
              sayfa.toString() + '/' + widget.k.sayfa_sayisi.toString(),
              style: Texts.pdfTextStyle,
            ),
            IconButton(
              onPressed: () {
                widget.kitap.animateToPage(
                  sayfa + 1,
                  duration: Duration(seconds: 1),
                  curve: Curves.easeOutQuint,
                );
              },
              icon: Icon(Icons.arrow_forward_ios),
              iconSize: 20,
            ),
          ],
        ),
      ],
    );
  }
}
