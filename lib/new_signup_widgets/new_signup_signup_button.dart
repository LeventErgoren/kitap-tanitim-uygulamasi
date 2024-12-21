import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitap_tanitim_app/constants/navigator.dart';
import 'package:kitap_tanitim_app/constants/snackbar.dart';
import 'package:kitap_tanitim_app/pages/new_login_page.dart';
import 'package:kitap_tanitim_app/riverpod/providers.dart';
import 'package:kitap_tanitim_app/services/databaseConnect.dart';
import 'package:kitap_tanitim_app/services/databaseSignUp.dart';

class NewSignupSignupButton extends ConsumerWidget {
  const NewSignupSignupButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GlobalKey<FormState> key = ref.watch(SignUpKey);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 20),
        Text(
          "Kayıt Ol",
          style: GoogleFonts.beVietnamPro(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        IconButton(
          onPressed: () async {
            if (key.currentState!.validate() == false) {
            } else {
              ref.invalidate(getConnector);
              key.currentState!.save();
              String userName = await ref.watch(UserName);
              if (await ref.watch(getDatabaseUserNames(userName).future)) {
                if (await ref.watch(signUpUser.future)) {
                  SnackbarGoster.snackBarGoster(
                      "Kayıt Olundu Giriş Yapabilirsiniz!", context);

                  ClassNavigator.pushReplacementClass(context, NewLoginPage());
                } else {
                  SnackbarGoster.snackBarGoster(
                      "Bir Şeyler Ters Gitti!", context);
                }
              } else {
                SnackbarGoster.snackBarGoster(
                    "Bu Kullanıcı Adı Zaten Kayıtlı!", context);
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
