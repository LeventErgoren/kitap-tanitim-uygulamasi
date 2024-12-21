import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitap_tanitim_app/constants/start_constants.dart';

class NewSignupTexts extends StatelessWidget {
  const NewSignupTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Merhaba,",
          style: StartConstants.bigTextStyle,
        ),
        Text(
          "Bir hesap oluştur",
          style: StartConstants.smallTextStyle,
        ),
      ],
    );
  }
}
