import 'package:flutter/material.dart';

class TarotCardWidget extends StatelessWidget {
  final String imageUrl;

  const TarotCardWidget({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 142,
      decoration: BoxDecoration(
        color: Colors.transparent, // 투명한 배경
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5), // 그림자 색상 (불투명 검은색)
            blurRadius: 16, // 그림자가 퍼지는 정도
            offset: Offset(0, -4), // 그림자 위치 (아래쪽으로 이동)
            spreadRadius: 0, // 그림자의 확산 정도
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16), // 테두리 둥글게 설정
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xB3091522), // 진한 배경색 설정
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
