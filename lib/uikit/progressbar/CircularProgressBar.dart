import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularProgressBar extends StatelessWidget {
  final double percentage;
  final double size;
  final double backGroundLineWidth;
  final double progressLineWidth;
  final Color progressColor;
  final Color progressBlurColor;
  final Color backgroundColor;

  CircularProgressBar({
    required this.percentage,
    this.size = 300, // 반지름 150dp이므로, 사이즈는 300dp
    this.backGroundLineWidth = 2.0,
    this.progressLineWidth = 8.0,
    this.progressColor = Colors.white,
    this.progressBlurColor = const Color(0xFF11DCE8),
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: Stack(
        children: [
          // 배경 원
          CustomPaint(
            size: Size(size, size),
            painter: CircleProgressPainter(
              percentage: 100, // 전체 배경
              lineWidth: backGroundLineWidth,
              progressColor: backgroundColor,
            ),
          ),

          // 진행도 블러 원
          CustomPaint(
            size: Size(size, size),
            painter: CircleProgressBlurPainter(
              percentage: percentage,
              lineWidth: progressLineWidth + 3,
              progressColor: progressBlurColor,
            ),
          ),

          // 진행도 원
          CustomPaint(
            size: Size(size, size),
            painter: CircleProgressPainter(
              percentage: percentage,
              lineWidth: progressLineWidth,
              progressColor: progressColor,
            ),
          ),

          // 중앙 텍스트
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'LUNA',
                  style: TextStyle(
                    fontFamily: 'Faustina', // Faustina 폰트 적용
                    fontWeight: FontWeight.normal, // Regular 폰트 사용
                    fontSize: 50, // 텍스트 크기 50dp
                    height: 63 / 50, // 행간을 63으로 설정
                    color: Colors.white, // 텍스트 색상 흰색
                  ),
                )
                ,
                Text(
                  'AI Fortune Teller',
                  style: TextStyle(
                    fontFamily: 'Faustina', // Faustina 폰트 적용
                    fontWeight: FontWeight.normal, // Regular 폰트 사용
                    fontSize: 13, // 텍스트 크기 13
                    height: 16 / 13, // 행간을 16으로 설정
                    color: Colors.white, // 텍스트 색상 흰색
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CircleProgressPainter extends CustomPainter {
  final double percentage;
  final double lineWidth;
  final Color progressColor;

  CircleProgressPainter({
    required this.percentage,
    required this.lineWidth,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = progressColor
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // 반지름은 사이즈에서 계산하여 적용
    double radius = 150 - lineWidth / 2; // 반지름 150dp
    Offset center = Offset(size.width / 2, size.height / 2);
    double startAngle = -pi / 2;
    double sweepAngle = 2 * pi * (percentage / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CircleProgressBlurPainter extends CustomPainter {
  final double percentage;
  final double lineWidth;
  final Color progressColor;

  CircleProgressBlurPainter({
    required this.percentage,
    required this.lineWidth,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = progressColor
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(10)); // 블러 효과 적용

    // 반지름 150dp 적용
    double radius = 150 - lineWidth / 2; // 반지름 150dp
    Offset center = Offset(size.width / 2, size.height / 2);
    double startAngle = -pi / 2;
    double sweepAngle = 2 * pi * (percentage / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  // 블러 강도를 조절하는 함수
  double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }
}
