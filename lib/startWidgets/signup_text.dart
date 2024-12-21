import 'package:flutter/material.dart';
import 'package:kitap_tanitim_app/constants/navigator.dart';
import 'package:kitap_tanitim_app/constants/texts.dart';
import 'package:kitap_tanitim_app/pages/login_screen.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              ClassNavigator.pushReplacementClass(context, LoginScreen());
            },
            child: Text(
              "Giriş Yap",
              style: Texts.loginTextStyle,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              "Kayıt Ol",
              style: Texts.underlineLoginTextStyle,
            ),
          )
        ],
      ),
    );
  }

  
}
