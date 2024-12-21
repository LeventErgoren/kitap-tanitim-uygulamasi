import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitap_tanitim_app/constants/navigator.dart';
import 'package:kitap_tanitim_app/constants/start_constants.dart';
import 'package:kitap_tanitim_app/pages/new_login_page.dart';

class NewSignupLoginTexts extends StatelessWidget {
  const NewSignupLoginTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Zaten hesabın var mı? ",
          style: StartConstants.smallTextStyle,
        ),
        InkWell(
          onTap: () {
            ClassNavigator.pushReplacementClass(
              context,
              NewLoginPage(),
            );
          },
          child: Text(
            "Giriş yap.",
            style: StartConstants.underLineTextStyle,
          ),
        ),
      ],
    );
  }
}
