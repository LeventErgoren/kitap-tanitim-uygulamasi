import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitap_tanitim_app/constants/constants.dart';
import 'package:kitap_tanitim_app/constants/decoration.dart';
import 'package:kitap_tanitim_app/constants/texts.dart';
import 'package:kitap_tanitim_app/riverpod/providers.dart';

class SignUpInputs extends ConsumerStatefulWidget {
  const SignUpInputs({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InputsState();
}

class _InputsState extends ConsumerState<SignUpInputs> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    String _cinsiyet = ref.watch(Cinsiyet);
    final _formKey = ref.watch(SignUpKey);
    return Padding(
      padding: Constants.lurPadding,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: Decorations.inputsBorderRadius,
                ),
                label: Text("Kullanıcı Adı"),
                hintText: 'Kullanıcı Adı',
                hintStyle: Decorations.hintTextStye,
                suffixIcon: Icon(Icons.person_2_outlined),
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
            SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: showPassword,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: Decorations.inputsBorderRadius,
                ),
                label: Text("Şifre"),
                hintText: 'Şifre',
                hintStyle: Decorations.hintTextStye,
                suffixIcon: IconButton(
                  icon: Icon(
                    showPassword ? Icons.visibility_off : Icons.visibility,
                    size: 20,
                  ),
                  onPressed: () {
                    showPassword = !showPassword;
                    setState(() {});
                  },
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
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: Decorations.inputsBorderRadius,
                ),
                label: Text("İsim"),
                hintText: 'İsim',
                hintStyle: Decorations.hintTextStye,
                suffixIcon: Icon(Icons.person_2_outlined),
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
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: Decorations.inputsBorderRadius,
                ),
                label: Text("Soyisim"),
                hintText: 'Soyisim',
                hintStyle: Decorations.hintTextStye,
                suffixIcon: Icon(Icons.person_2_outlined),
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
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        "Erkek",
                        style: Texts.signUpRadioTextStyle,
                      ),
                      Radio(
                        value: 'Erkek',
                        groupValue: _cinsiyet,
                        onChanged: (value) {
                          ref.read(Cinsiyet.notifier).state = "Erkek";
                          setState(
                            () {
                              _cinsiyet = value!;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Text(
                        "Kadın",
                        style: Texts.signUpRadioTextStyle,
                      ),
                      Radio(
                        value: 'Kadın',
                        groupValue: _cinsiyet,
                        onChanged: (value) {
                          ref.read(Cinsiyet.notifier).state = "Kadın";
                          setState(
                            () {
                              _cinsiyet = value!;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
