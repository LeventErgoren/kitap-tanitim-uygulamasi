import 'package:flutter/material.dart';
import 'package:kitap_tanitim_app/constants/navigator.dart';
import 'package:kitap_tanitim_app/constants/texts.dart';
import 'package:kitap_tanitim_app/pages/sign_up_screen.dart';

class LoginText extends StatelessWidget {
  const LoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {},
            child: Text(
              "Giriş Yap",
              style: Texts.underlineLoginTextStyle,
            ),
          ),
          InkWell(
            onTap: () {
              ClassNavigator.pushReplacementClass(context, SignUpScreen());
            },
            child: Text(
              "Kayıt Ol",
              style: Texts.loginTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
