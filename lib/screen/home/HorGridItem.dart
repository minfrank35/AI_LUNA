import 'package:ai_fortune_teller/const/FontConst.dart';
import 'package:ai_fortune_teller/const/ImageConst.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorgridItem extends StatefulWidget {
  final String text;
  final String imageAssetPath;

  const HorgridItem({required this.text, required this.imageAssetPath});

  @override
  State<HorgridItem> createState() => _HorgridItemState();
}

class _HorgridItemState extends State<HorgridItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Color(0xCC091422),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1),
          borderRadius: BorderRadius.circular(28),
        ),
        shadows: [
          BoxShadow(
            color: Color(0xFF000000),
            blurRadius: 16,
            offset: Offset(0, -4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 8),
          Text(
            '재물',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'Gowun Dodum',
              fontWeight: FontWeight.w400,
              height: 0.11,
            ),
          ),
        ],
      ),
    );
  }
}
