import 'package:ai_fortune_teller/const/Strings.dart';
import 'package:ai_fortune_teller/screen/home/H1_title.dart';
import 'package:ai_fortune_teller/screen/home/HorGridItem.dart';
import 'package:ai_fortune_teller/screen/home/TarotCardWidget.dart';
import 'package:ai_fortune_teller/uikit/banner/BannerCarousel.dart';
import 'package:ai_fortune_teller/uikit/banner/BannerItem.dart';
import 'package:flutter/cupertino.dart';

class TodayfortuneTab extends StatefulWidget {
  const TodayfortuneTab({super.key});

  @override
  State<TodayfortuneTab> createState() => _TodayfortuneTabState();
}

class _TodayfortuneTabState extends State<TodayfortuneTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 배너와 하단 곡선
        Container(
          height: 303,
          child: BannerCarousel(
            bannerItems: [
              BannerItem(
                imagePath: 'assets/banner1.png',
                bannerText: '배너 1 텍스트',
              ),
              BannerItem(
                imagePath: 'assets/banner2.png',
                bannerText: '배너 2 텍스트',
              ),
              BannerItem(
                imagePath: 'assets/banner3.png',
                bannerText: '배너 3 텍스트',
              ),
            ],
          ),
        ),

        Container(
          padding: EdgeInsets.only(left: 24, right: 24, top: 15, bottom: 17),
          child: Column(
            crossAxisAlignment : CrossAxisAlignment.start,
            children: [
              H1Title(titleText: Strings.LUNA_DAILY_TAROT),
              SizedBox(height: 15),
              TarotCardWidget(
                imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/24/Cups09',
              ),
              SizedBox(height: 15),
              H1Title(titleText: Strings.TODAY_FORTUNE),
              SizedBox(height: 15),
              HorgridItem(text: "재물", imageAssetPath: "")
            ],
          ),
        ),
      ],
    );
  }
}
