import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitap_tanitim_app/constants/start_constants.dart';
import 'package:kitap_tanitim_app/riverpod/providers.dart';

class NewSignupInputs extends ConsumerWidget {
  const NewSignupInputs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = ref.watch(SignUpKey);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(55, 25, 55, 25),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Image.asset(
                    'assets/pictures/name.png',
                    height: 20,
                    width: 20,
                    color: Colors.grey.shade800,
                  ),
                ),
                hintText: 'İsim',
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
                if (value!.length > 1 && value!.length < 30) {
                  return null;
                } else if (value!.length <= 1) {
                  return 'İsim En Az 2 Karakter Olmalıdır';
                } else {
                  return 'İsim 30 Karakterden Az olmalıdır';
                }
              },
              onSaved: (newValue) {
                ref.watch(Name.notifier).state = newValue!;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 55,
              right: 55,
              top: 0,
              bottom: 15,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Image.asset(
                    'assets/pictures/name.png',
                    height: 20,
                    width: 20,
                    color: Colors.grey.shade800,
                  ),
                ),
                hintText: 'Soyisim',
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
                if (value!.length > 1 && value!.length < 30) {
                  return null;
                } else if (value!.length <= 1) {
                  return 'Soyisim En Az 2 Karakter Olmalıdır';
                } else {
                  return 'Soyisim 30 Karakterden Az olmalıdır';
                }
              },
              onSaved: (newValue) {
                ref.watch(LastName.notifier).state = newValue!;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 55,
              right: 55,
              top: 10,
              bottom: 15,
            ),
            child: TextFormField(
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
              validator: (String? value) {
                if (value!.length < 30 && value!.length > 2) {
                  return null;
                } else if (value!.length <= 2) {
                  return 'Kullanıcı Adı En Az 3 Karakter Olmalıdır';
                } else {
                  return 'Kullanıcı Adı 30 Karakterden Az olmalıdır';
                }
              },
              onSaved: (newValue) {
                ref.watch(UserName.notifier).state = newValue!;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 55, right: 55, top: 10, bottom: 15),
            child: TextFormField(
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
                if (value!.length > 3 && value!.length < 30) {
                  return null;
                } else if (value!.length <= 3) {
                  return 'Şifre En Az 4 Karakter Olmalıdır';
                } else {
                  return 'Şifre 30 Karakterden Az olmalıdır';
                }
              },
              onSaved: (newValue) {
                ref.watch(Password.notifier).state = newValue!;
              },
            ),
          ),
        ],
      ),
    );
  }
}
