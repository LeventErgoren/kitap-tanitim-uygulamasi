import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:kitap_tanitim_app/constants/constants.dart';
import 'package:kitap_tanitim_app/constants/texts.dart';
import 'package:kitap_tanitim_app/loggedWidgets/pdf_buttons.dart';
import 'package:kitap_tanitim_app/models/kitap.dart';
import 'package:kitap_tanitim_app/riverpod/kitapSayfasi.dart';
import 'package:pdfx/pdfx.dart';

class PdfPages extends ConsumerStatefulWidget {
  final Kitap k;
  final Color appBarColor;
  const PdfPages({required this.k, required this.appBarColor, super.key});

  @override
  ConsumerState<PdfPages> createState() => _PdfPagesState();
}

class _PdfPagesState extends ConsumerState<PdfPages> {
  late Future<PdfDocument> s;
  late PdfController kitap;

  @override
  void initState() {
    s = PdfDocument.openAsset("assets/pdf/" + "${widget.k.kitap_id}.pdf");
    kitap = PdfController(document: s);
    super.initState();
  }

  @override
  void dispose() {
    kitap.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        ref.read(KitapSayfasi.notifier).state = 1;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.k.kitap_adi,
            style: Texts.pdfAppBarTextStyle,
          ),
          backgroundColor: Colors.grey,
          actions: [],
        ),
        body: Container(
          color: Colors.grey,
          child: Column(
            children: [
              PdfButtons(
                kitap: kitap,
                k: widget.k,
              ),
              Expanded(
                child: PdfView(
                  controller: kitap,
                  onPageChanged: (page) {
                    ref.read(KitapSayfasi.notifier).state = page;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
