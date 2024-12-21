import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitap_tanitim_app/constants/navigator.dart';
import 'package:kitap_tanitim_app/constants/start_constants.dart';
import 'package:kitap_tanitim_app/pages/new_signup_page.dart';

class NewLoginSignupTexts extends StatelessWidget {
  const NewLoginSignupTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hesabın yok mu? ",
          style: StartConstants.smallTextStyle,
        ),
        InkWell(
          onTap: () {
            ClassNavigator.pushReplacementClass(
              context,
              NewKayitPage(),
            );
          },
          child: Text(
            "Kayıt Ol",
            style: StartConstants.underLineTextStyle,
          ),
        ),
      ],
    );
  }
}
