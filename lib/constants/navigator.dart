import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitap_tanitim_app/models/kitap.dart';
import 'package:kitap_tanitim_app/pages/book_detail_page.dart';
import 'package:kitap_tanitim_app/services/databaseGetBookProperty.dart';
import 'package:palette_generator/palette_generator.dart';

class ClassNavigator {
  static pushReplacementClass(BuildContext context, var c) {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => c,
      ),
    );
  }

  static pushNormalClass(BuildContext context, var c) {
    Navigator.of(context).push(CupertinoPageRoute(
      builder: (context) => c,
    ));
  }

  static pushBookDetayClass(
      BuildContext context, Kitap k, WidgetRef ref) async {
    await ref.read(BookProperty(k.kitap_id).future);
    Color renk = await getDominantColor(k);
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => BookDetailPage(k: k, renk: renk),
      ),
    );
  }

  static popClass(BuildContext context) {
    Navigator.of(context).pop();
  }

  static Future<Color> getDominantColor(Kitap k) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(NetworkImage(k.resim));

    return paletteGenerator.dominantColor!.color;
  }
}
