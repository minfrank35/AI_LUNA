import 'package:ai_fortune_teller/const/FontConst.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class H1Title extends StatefulWidget {

  final String titleText;

  const H1Title({required this.titleText});
  @override
  State<H1Title> createState() => _H1TitleState();
}

class _H1TitleState extends State<H1Title> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        widget.titleText,
        style: TextStyle(
          fontSize: 25,
          fontFamily: FontConst.FAUSTINA,
          height: 32 / 25,
          color: Colors.white,
          backgroundColor: Colors.transparent
        ),
      ),
    );
  }
}
