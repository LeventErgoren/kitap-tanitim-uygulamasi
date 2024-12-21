import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitap_tanitim_app/constants/start_constants.dart';
import 'package:kitap_tanitim_app/riverpod/providers.dart';

class NewLoginInputs extends ConsumerStatefulWidget {
  const NewLoginInputs({super.key});

  @override
  ConsumerState<NewLoginInputs> createState() => _NewLoginInputsState();
}

class _NewLoginInputsState extends ConsumerState<NewLoginInputs> {
  @override
  Widget build(BuildContext context) {
    final formKey = ref.watch(LoginKey);
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(55, 25, 55, 25),
            child: TextFormField(
              initialValue: "Test",
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                fillColor: Colors.white,
                filled: true,
                hintText: 'Kullanıcı Adı',
                hintStyle: StartConstants.inputsTextStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                errorStyle: GoogleFonts.beVietnamPro(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              validator: (value) {
                if (value!.length > 0 == false) {
                  return 'Kullanıcı Adınızı Giriniz!';
                } else {
                  return null;
                }
              },
              onSaved: (newValue) {
                ref.read(LoginUserName.notifier).state = newValue!;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 55, right: 55, top: 0, bottom: 15),
            child: TextFormField(
              obscureText: true,
              initialValue: "1234",
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Image.asset(
                    'assets/pictures/sifre.png',
                    height: 20,
                    width: 20,
                    color: Colors.grey.shade800,
                  ),
                ),
                hintText: 'Şifre',
                hintStyle: StartConstants.inputsTextStyle,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                errorStyle: GoogleFonts.beVietnamPro(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              validator: (value) {
                if (value!.length > 0 == false) {
                  return 'Şifrenizi Giriniz!';
                }
                return null;
              },
              onSaved: (newValue) {
                ref.read(LoginPassword.notifier).state = newValue!;
              },
            ),
          ),
        ],
      ),
    );
  }
}
