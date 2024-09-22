import 'package:ai_fortune_teller/const/ImageConst.dart';
import 'package:ai_fortune_teller/screen/home/HomeScreen.dart';
import 'package:ai_fortune_teller/uikit/progressbar/CircularProgressBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // AnimationController 설정: 4초 동안 애니메이션이 진행되도록 설정
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // 4초 동안 애니메이션 실행
    );

    // Tween을 사용해 0에서 100까지 부드럽게 증가하는 애니메이션을 설정
    _animation = Tween<double>(begin: 0, end: 100).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    )..addListener(() {
      setState(() {
        // 애니메이션이 끝나면 HomeScreen으로 이동 (슬라이드 애니메이션)
        if (_animation.value >= 99.9) {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => Homescreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0); // 오른쪽에서 왼쪽으로 이동
                const end = Offset.zero;

                const curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            ),
          );
        }
      });
    });

    // 애니메이션 시작
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(ImageConst.COMM_BACK_IMAGE), // 배경 이미지
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, // 배경을 투명하게 설정
        body: Center(
          child: CircularProgressBar(
            size: 150,
            percentage: _animation.value, // 애니메이션된 진행률 사용
            backgroundColor: Colors.grey[800]!,
          ),
        ),
      ),
    );
  }
}
