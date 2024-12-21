import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitap_tanitim_app/riverpod/providers.dart';

class NewSignupRadio extends ConsumerStatefulWidget {
  const NewSignupRadio({super.key});

  @override
  ConsumerState<NewSignupRadio> createState() => _NewSignupRadioState();
}

class _NewSignupRadioState extends ConsumerState<NewSignupRadio> {
  @override
  Widget build(BuildContext context) {
    String cinsiyet = ref.watch(Cinsiyet);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Text(
                  "Erkek",
                  style: GoogleFonts.beVietnamPro(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Radio(
                  value: "Erkek",
                  groupValue: cinsiyet,
                  onChanged: (value) {
                    ref.read(Cinsiyet.notifier).state = "Erkek";
                    setState(
                      () {
                        cinsiyet = value!;
                      },
                    );
                  },
                  activeColor: Colors.blue.shade300,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Kadın",
                  style: GoogleFonts.beVietnamPro(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Radio(
                  value: "Kadın",
                  groupValue: cinsiyet,
                  onChanged: (value) {
                    ref.read(Cinsiyet.notifier).state = "Kadın";
                    setState(
                      () {
                        cinsiyet = value!;
                      },
                    );
                  },
                  activeColor: Colors.pink.shade300,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
