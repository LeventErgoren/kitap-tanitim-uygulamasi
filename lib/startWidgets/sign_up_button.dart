import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitap_tanitim_app/constants/constants.dart';
import 'package:kitap_tanitim_app/constants/decoration.dart';
import 'package:kitap_tanitim_app/constants/navigator.dart';
import 'package:kitap_tanitim_app/constants/renkler.dart';
import 'package:kitap_tanitim_app/constants/snackbar.dart';
import 'package:kitap_tanitim_app/constants/texts.dart';
import 'package:kitap_tanitim_app/pages/login_screen.dart';
import 'package:kitap_tanitim_app/riverpod/providers.dart';
import 'package:kitap_tanitim_app/services/databaseConnect.dart';
import 'package:kitap_tanitim_app/services/databaseSignUp.dart';

class SignUpButton extends ConsumerStatefulWidget {
  const SignUpButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpButtonState();
}

class _SignUpButtonState extends ConsumerState<SignUpButton> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> key = ref.watch(SignUpKey);
    return Padding(
      padding: Constants.standartPadding,
      child: InkWell(
        onTap: () async {
          if (key.currentState!.validate() == false) {
          } else {
            ref.invalidate(getConnector);
            key.currentState!.save();
            String userName = await ref.watch(UserName);
            if (await ref.watch(getDatabaseUserNames(userName).future)) {
              if (await ref.watch(signUpUser.future)) {
                SnackbarGoster.snackBarGoster(
                    "Kayıt Olundu Giriş Yapabilirsiniz!", context);

                ClassNavigator.pushReplacementClass(context, LoginScreen());
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
        child: Container(
          width: 180,
          height: 50,
          decoration: BoxDecoration(
              color: Renkler.loginButtonContainerColor,
              borderRadius: Decorations.loginButtonRadius),
          child: Center(
            child: Text(
              "Kayıt Ol",
              style: Texts.loginButtonTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
