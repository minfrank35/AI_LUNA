import 'package:ai_fortune_teller/const/FontConst.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailText extends StatefulWidget {
  final String detailText;
  const DetailText({required this.detailText});
  @override
  State<DetailText> createState() => _DetailTextState();
}

class _DetailTextState extends State<DetailText> {


  @override
  Widget build(BuildContext context) {
    return Text(
      widget.detailText,
      style: TextStyle(
          fontFamily: FontConst.GOWUN_BATANG,
          fontSize: 12,
          height: 17 / 12,
          color: Colors.white
      ),
    );
  }
}