import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommDecoration {
  static BoxDecoration COMM_BOX_DECORATION = BoxDecoration(
    color: Color(0xB3091522), // 진한 배경색 설정
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.5), // Semi-transparent black shadow
        blurRadius: 16, // Spread of the shadow
        offset: Offset(0, -4), // Position of the shadow (moved below)
        spreadRadius: 0, // Expansion of the shadow
      ),
    ],
  );
}
