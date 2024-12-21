import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitap_tanitim_app/constants/constants.dart';
import 'package:kitap_tanitim_app/constants/renkler.dart';
import 'package:kitap_tanitim_app/startWidgets/login_screen_picture.dart';
import 'package:kitap_tanitim_app/startWidgets/sign_up_button.dart';
import 'package:kitap_tanitim_app/startWidgets/sign_up_inputs.dart';
import 'package:kitap_tanitim_app/startWidgets/signup_text.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginScreenPicture(),
              SignUpText(),
              SignUpInputs(),
              SignUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}
