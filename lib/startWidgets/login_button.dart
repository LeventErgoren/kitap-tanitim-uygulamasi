import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitap_tanitim_app/constants/decoration.dart';
import 'package:kitap_tanitim_app/constants/navigator.dart';
import 'package:kitap_tanitim_app/constants/renkler.dart';
import 'package:kitap_tanitim_app/constants/snackbar.dart';
import 'package:kitap_tanitim_app/constants/texts.dart';
import 'package:kitap_tanitim_app/pages/logged_screen.dart';
import 'package:kitap_tanitim_app/riverpod/loggedUser.dart';
import 'package:kitap_tanitim_app/riverpod/providers.dart';
import 'package:kitap_tanitim_app/services/databaseBookGet.dart';
import 'package:kitap_tanitim_app/services/databaseConnect.dart';
import 'package:kitap_tanitim_app/services/databaseLogin.dart';

class LoginButton extends ConsumerStatefulWidget {
  const LoginButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginButtonState();
}

class _LoginButtonState extends ConsumerState<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        GlobalKey<FormState> key = ref.watch(LoginKey);

        if (key.currentState!.validate()) {
          ref.invalidate(loginUser);
          key.currentState!.save();

          bool giris = await ref.watch(loginUser.future);

          if (giris) {
            await ref.read(getBooks.future);
            ClassNavigator.pushReplacementClass(context, LoggedScreen());
            SnackbarGoster.snackBarGoster("Giriş Başarılı!", context);
          } else {
            SnackbarGoster.snackBarGoster(
                "Kullanıcı Adı veya Şifre Yanlış!", context);
          }
        }
      },
      child: Container(
        width: 180,
        height: 50,
        decoration: BoxDecoration(
            color: Renkler.loginButtonContainerColor,
            borderRadius: Decorations.loginButtonRadius),
        child: Center(
          child: Text(
            "Giriş Yap",
            style: Texts.loginButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
