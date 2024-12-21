import 'package:flutter/material.dart';
import 'package:kitap_tanitim_app/new_login_widgets/new_login_down_texts.dart';
import 'package:kitap_tanitim_app/new_login_widgets/new_login_inputs.dart';
import 'package:kitap_tanitim_app/new_login_widgets/new_login_login_button.dart';
import 'package:kitap_tanitim_app/new_login_widgets/new_login_signup_texts.dart';
import 'package:kitap_tanitim_app/new_login_widgets/new_login_texts.dart';

class NewLoginPage extends StatelessWidget {
  const NewLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/pictures/deneme.gif'),
                fit: BoxFit.cover),
          ),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NewLoginTexts(),
                  NewLoginInputs(),
                  NewLoginDownTexts(),
                  NewLoginLoginButton(),
                  SizedBox(
                    height: 50,
                  ),
                  NewLoginSignupTexts(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
