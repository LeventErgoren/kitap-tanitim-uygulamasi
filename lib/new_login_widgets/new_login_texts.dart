import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitap_tanitim_app/constants/start_constants.dart';

class NewLoginTexts extends StatelessWidget {
  const NewLoginTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Merhaba,",
          style: StartConstants.bigTextStyle,
        ),
        Text(
          "Hesabına giriş yap",
          style: StartConstants.smallTextStyle,
        ),
      ],
    );
  }
}
