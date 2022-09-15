import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photos_fake/src/utils/responsive.dart';

class TitleMenu extends StatelessWidget {
  const TitleMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Row(children: <Widget>[
      _LetterGoogle(
        letter: 'G',
        color: Colors.blue,
      ),
      _LetterGoogle(
        letter: 'o',
        color: Colors.red,
      ),
      _LetterGoogle(
        letter: 'o',
        color: Colors.yellow,
      ),
      _LetterGoogle(
        letter: 'g',
        color: Colors.blue,
      ),
      _LetterGoogle(
        letter: 'l',
        color: Colors.green,
      ),
      _LetterGoogle(
        letter: 'e',
        color: Colors.red,
      ),
      SizedBox(width: responsive.widthResponsive(1)),
      const Text(
        'PhotosFake',
        style: TextStyle(
          color: Colors.black54,
          fontSize: 25,
        ),
      )
    ]);
  }
}

class _LetterGoogle extends StatelessWidget {
  String letter;
  Color color;
  _LetterGoogle({required this.color, required this.letter, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      letter,
      style: GoogleFonts.roboto(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    );
  }
}
