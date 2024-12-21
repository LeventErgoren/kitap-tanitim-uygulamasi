import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartConstants {
  static TextStyle bigTextStyle = GoogleFonts.beVietnamPro(
    fontSize: 48,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle smallTextStyle = GoogleFonts.beVietnamPro(
    fontSize: 16,
    color: Colors.white,
  );

  static TextStyle inputsTextStyle = GoogleFonts.beVietnamPro(
    color: Colors.grey,
  );

  static TextStyle forgotPasswordTextStyle = GoogleFonts.beVietnamPro(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static TextStyle underLineTextStyle = GoogleFonts.beVietnamPro(
    decoration: TextDecoration.underline,
    decorationColor: Colors.white,
    fontSize: 16,
    color: Colors.white,
  );
}
