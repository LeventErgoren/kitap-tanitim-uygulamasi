import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitap_tanitim_app/constants/constants.dart';
import 'package:kitap_tanitim_app/startWidgets/login_button.dart';
import 'package:kitap_tanitim_app/startWidgets/login_screen_picture.dart';
import 'package:kitap_tanitim_app/startWidgets/login_text.dart';
import 'package:kitap_tanitim_app/startWidgets/login_inputs.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/pictures/resim.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              LoginScreenPicture(),
              LoginText(),
              Container(
                margin: Constants.standartPadding,
                width: MediaQuery.of(context).size.width,
                height: 230,
                decoration: BoxDecoration(
                  borderRadius: Constants.standartRadius,
                ),
                child: LoginInputs(),
              ),
              LoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}
