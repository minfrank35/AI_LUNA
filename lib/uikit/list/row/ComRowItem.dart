import 'package:ai_fortune_teller/const/FontConst.dart';
import 'package:ai_fortune_teller/const/ImageConst.dart';
import 'package:ai_fortune_teller/uikit/decoration/CommDecoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// void main () {
//   runApp(ComRowItem(text: "오늘의 운세", imageAssetPath: ))
// }
class ComRowItem extends StatelessWidget {
  final String text;
  final String imageAssetPath;

  ComRowItem({required this.text, required this.imageAssetPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      child: Row(
        children: [
          Image.asset(imageAssetPath, width: 24, height: 24),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: FontConst.GOWUN_DODUM,
              height: 25 / 15,
            ),
          ),
        ],
      ),
    );;
  }
}
