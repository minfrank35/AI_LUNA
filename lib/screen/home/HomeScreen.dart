import 'package:ai_fortune_teller/const/AppColors.dart';
import 'package:ai_fortune_teller/const/HomeTabBarConst.dart';
import 'package:ai_fortune_teller/const/ImageConst.dart';
import 'package:ai_fortune_teller/screen/IntroScreen.dart';
import 'package:ai_fortune_teller/screen/home/TodayFortuneTab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _currentTabNum = 0;

  @override
  void initState() {
    super.initState();

    // 탭 변경 시 활성화된 탭의 인덱스 업데이트
  }

  @override
  Widget build(BuildContext context) {
    Widget _tabItem;

    switch (_currentTabNum) {
      case 0:
        {
          _tabItem = TodayfortuneTab();
        }
      case 1:
        {
          _tabItem = IntroScreen();
        }
      case 2:
        {
          _tabItem = TodayfortuneTab();
        }
      default :
        _tabItem = TodayfortuneTab();
    }

    return Material(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageConst.COMM_BACK_IMAGE),
                  fit: BoxFit.cover),
            ),
          ),
          Column(
            children: [
              Expanded(child: _tabItem),
              Container(
                height: 74,
                decoration: BoxDecoration(
                    color: AppColors.COMM_BACK_COLOR,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 7,
                          offset: Offset(0, 3))
                    ]),
                child: Row(children: [
                  Expanded(
                      child: TabBarItem(
                    imageAsset: HomeTab.TODAY_FORTUNE.selectedImagePath,
                    imageAssetUnclicked:
                        HomeTab.TODAY_FORTUNE.unselectedImagePath,
                    label: HomeTab.TODAY_FORTUNE.tabBarItemLabel,
                    isActivate:
                        _currentTabNum == HomeTab.TODAY_FORTUNE.tabLocNum,
                    onTap : () {
                      setState(() {
                        _currentTabNum = 0;
                      });
                    }
                  )),
                  Expanded(
                      child: TabBarItem(
                    imageAsset: HomeTab.AR_TAROT.selectedImagePath,
                    imageAssetUnclicked: HomeTab.AR_TAROT.unselectedImagePath,
                    label: HomeTab.AR_TAROT.tabBarItemLabel,
                    isActivate: _currentTabNum == HomeTab.AR_TAROT.tabLocNum,
                    onTap : () {
                      setState(() {
                        _currentTabNum = 1;
                      });
                    }
                  )),
                  Expanded(
                      child: TabBarItem(
                    imageAsset: HomeTab.PROFILE.selectedImagePath,
                    imageAssetUnclicked: HomeTab.PROFILE.unselectedImagePath,
                    label: HomeTab.PROFILE.tabBarItemLabel,
                    isActivate: _currentTabNum == HomeTab.PROFILE.tabLocNum,
                    onTap : () {
                      setState(() {
                        _currentTabNum = 2;
                      });
                    },
                  ))
                ]),
              )
            ],
          )
        ],
      ),
    );
  }
}

class TabBarItem extends StatefulWidget {
  final String imageAsset;
  final String imageAssetUnclicked;
  final String label;
  final bool isActivate;
  final VoidCallback onTap;

  const TabBarItem({
    required this.imageAsset,
    required this.imageAssetUnclicked,
    required this.label,
    required this.isActivate,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  _TabBarItemState createState() => _TabBarItemState();
}

class _TabBarItemState extends State<TabBarItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("클릭한 탭" + widget.label);
        widget.onTap();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 활성화 상태에 따라 다른 이미지 표시
          Image.asset(
              widget.isActivate ? widget.imageAsset : widget.imageAssetUnclicked),
          SizedBox(height: 8),
          Text(
            widget.label, // widget. 으로 접근
            style: TextStyle(
              fontFamily: "figtree",
              fontSize: 10,
              fontWeight: FontWeight.w600,
              height: 12 / 10,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
