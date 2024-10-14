import 'package:ai_fortune_teller/const/FontConst.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class H1Title extends StatelessWidget {
  final String titleText;

  const H1Title({required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: TextStyle(
        fontSize: 25,
        fontFamily: FontConst.FAUSTINA,
        height: 32 / 25,
        color: Colors.white,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

