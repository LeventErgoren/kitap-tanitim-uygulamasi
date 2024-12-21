import 'package:flutter/material.dart';
import 'package:kitap_tanitim_app/new_signup_widgets/new_signup_inputs.dart';
import 'package:kitap_tanitim_app/new_signup_widgets/new_signup_login_texts.dart';
import 'package:kitap_tanitim_app/new_signup_widgets/new_signup_radio.dart';
import 'package:kitap_tanitim_app/new_signup_widgets/new_signup_signup_button.dart';
import 'package:kitap_tanitim_app/new_signup_widgets/new_signup_texts.dart';

class NewKayitPage extends StatelessWidget {
  const NewKayitPage({super.key});

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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NewSignupTexts(),
                    NewSignupInputs(),
                    NewSignupRadio(),
                    NewSignupSignupButton(),
                    SizedBox(
                      height: 30,
                    ),
                    NewSignupLoginTexts(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
