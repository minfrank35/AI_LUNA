import 'package:ai_fortune_teller/const/AppColors.dart';
import 'package:ai_fortune_teller/const/FontConst.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class H2Title extends StatefulWidget {
  final String title;

  const H2Title({required this.title});

  @override
  State<H2Title> createState() => _H2TitleState();
}

class _H2TitleState extends State<H2Title> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      style: TextStyle(
        fontSize: 16,
        fontFamily: FontConst.FIGTREE,
        fontWeight: FontConst.EXTRA_BOLD,
        height: 18 / 16,
        color: AppColors.TAB_TEAL_CLICKED,
      ),
    );
  }
}
