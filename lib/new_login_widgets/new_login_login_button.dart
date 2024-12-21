import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitap_tanitim_app/constants/navigator.dart';
import 'package:kitap_tanitim_app/constants/snackbar.dart';
import 'package:kitap_tanitim_app/constants/start_constants.dart';
import 'package:kitap_tanitim_app/pages/logged_screen.dart';
import 'package:kitap_tanitim_app/riverpod/providers.dart';
import 'package:kitap_tanitim_app/services/databaseBookGet.dart';
import 'package:kitap_tanitim_app/services/databaseLogin.dart';

class NewLoginLoginButton extends ConsumerWidget {
  const NewLoginLoginButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 20),
        Text(
          "Giriş Yap",
          style: StartConstants.forgotPasswordTextStyle,
        ),
        IconButton(
          onPressed: () async {
            GlobalKey<FormState> key = ref.watch(LoginKey);

            if (key.currentState!.validate()) {
              ref.invalidate(loginUser);
              key.currentState!.save();

              bool giris = await ref.watch(loginUser.future);

              if (giris) {
                await ref.read(getBooks.future);
                ClassNavigator.pushReplacementClass(
                  context,
                  LoggedScreen(),
                );
                SnackbarGoster.snackBarGoster("Giriş Başarılı!", context);
              } else {
                SnackbarGoster.snackBarGoster(
                    "Kullanıcı Adı veya Şifre Yanlış!", context);
              }
            }
          },
          icon: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 20,
          ),
        )
      ],
    );
  }
}
