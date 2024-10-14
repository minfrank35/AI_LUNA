import 'package:ai_fortune_teller/const/AppConst.dart';
import 'package:ai_fortune_teller/const/ImageConst.dart';
import 'package:ai_fortune_teller/uikit/decoration/CommDecoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(SpreadBanner());
}

class SpreadBanner extends StatefulWidget {
  const SpreadBanner({super.key});

  @override
  State<SpreadBanner> createState() => _SpreadBannerState();
}

class _SpreadBannerState extends State<SpreadBanner> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: PageView.builder(

          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          controller: PageController(viewportFraction: 0.8),
          itemCount: 3,
          itemBuilder: (context, index) {
            var banner = TarotTabConst.APP_BANNER_LIST;
            var _scale = _selectedIndex == index ? 1.0 : 0.875;

            return TweenAnimationBuilder(
              duration: const Duration(milliseconds: 350),
              tween: Tween<double>(begin: _scale, end: _scale),
              curve: Curves.ease,
              builder: (BuildContext context, double value, Widget? child) {
                return Transform.scale(
                  scale: value,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 350),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                            image: AssetImage(banner[index]),
                            fit: BoxFit.contain),
                        ),
                  ),
                );
              },
            );
          }),
    );
  }
}

