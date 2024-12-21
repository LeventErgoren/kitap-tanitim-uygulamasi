import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitap_tanitim_app/constants/renkler.dart';

class Texts {
  static TextStyle underlineLoginTextStyle = GoogleFonts.robotoMono(
      fontSize: 22,
      color: Colors.blue.shade900,
      fontWeight: FontWeight.w300,
      decoration: TextDecoration.underline,
      decorationColor: Renkler.underLineColor,
      decorationThickness: 1.5);

  static TextStyle loginTextStyle = GoogleFonts.robotoMono(
    fontSize: 22,
    color: Colors.blue.shade900,
    fontWeight: FontWeight.w300,
  );

  static TextStyle loginButtonTextStyle = GoogleFonts.quicksand(
    color: Colors.white,
    fontSize: 16,
  );

  static TextStyle signUpRadioTextStyle = GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle kitapNameTextStyle = GoogleFonts.beVietnamPro(
    color: Colors.black,
    fontSize: 17,
  );

  static TextStyle homePageTextStyle = GoogleFonts.beVietnamPro(
    color: Colors.white,
    fontSize: 32,
    fontWeight: FontWeight.w500,
  );

  static TextStyle userProfileNameTextStyle = GoogleFonts.quicksand(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static TextStyle profileDetayTextStyle = GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle favorilerEklenmediTextStyle = GoogleFonts.balooPaaji2(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static TextStyle favorilerTextStyle = GoogleFonts.beVietnamPro(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static TextStyle favoritesKitapNameTextStyle = GoogleFonts.beVietnamPro(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle favoritesBoldTextStyle = GoogleFonts.beVietnamPro(
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static TextStyle favoritesNormalTextStyle = GoogleFonts.beVietnamPro(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  static TextStyle favoritesButtonTextStyle = TextStyle(
    color: Colors.purple,
  );

  static TextStyle bookDetailBookNameTextStyle =
      GoogleFonts.rasa(fontSize: 24, fontWeight: FontWeight.w400);

  static TextStyle bookDetailYazarNameTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 15,
  );

  static TextStyle bookDetailBookDetail = GoogleFonts.jost(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle bookDetailBookDetailGrey = GoogleFonts.jost(
      fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey);
  static TextStyle bookDetailTextStyle = GoogleFonts.outfit(
    fontSize: 18,
    fontWeight: FontWeight.w300,
    color: Colors.black,
  );

  static TextStyle bookDetailTextStyleBold300 = GoogleFonts.outfit(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static TextStyle homePageKategoriTextStyle = GoogleFonts.jost(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static TextStyle pdfTextStyle = GoogleFonts.jost(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle pdfAppBarTextStyle = GoogleFonts.jost(
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );

  static TextStyle favorilerKitapYokTextStyle = GoogleFonts.beVietnamPro(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static TextStyle favorilerTitle = GoogleFonts.beVietnamPro(
    fontSize: 17,
  );
}
