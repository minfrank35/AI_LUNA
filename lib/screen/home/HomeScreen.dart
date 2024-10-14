import 'package:ai_fortune_teller/const/AppColors.dart';
import 'package:ai_fortune_teller/const/HomeTabBarConst.dart';
import 'package:ai_fortune_teller/const/ImageConst.dart';
import 'package:ai_fortune_teller/screen/IntroScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tarot_tab.dart';
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
          _tabItem = Tarot();
        }
      case 1:
        {
          _tabItem = IntroScreen();
        }
      case 2:
        {
          _tabItem = Tarot();
        }
      default :
        _tabItem = Tarot();
    }

    return Material(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageConst.BACK_GROUND),
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
                    imageAsset: HomeTab.TAROT.selectedImagePath,
                    imageAssetUnclicked:
                        HomeTab.TAROT.unselectedImagePath,
                    label: HomeTab.TAROT.tabBarItemLabel,
                    isActivate:
                        _currentTabNum == HomeTab.TAROT.tabLocNum,
                    onTap : () {
                      setState(() {
                        _currentTabNum = 0;
                      });
                    }
                  )),
                  Expanded(
                      child: TabBarItem(
                    imageAsset: HomeTab.CHAT.selectedImagePath,
                    imageAssetUnclicked: HomeTab.CHAT.unselectedImagePath,
                    label: HomeTab.CHAT.tabBarItemLabel,
                    isActivate: _currentTabNum == HomeTab.CHAT.tabLocNum,
                    onTap : () {
                      setState(() {
                        _currentTabNum = 1;
                      });
                    }
                  )),
                  Expanded(
                      child: TabBarItem(
                    imageAsset: HomeTab.MORE.selectedImagePath,
                    imageAssetUnclicked: HomeTab.MORE.unselectedImagePath,
                    label: HomeTab.MORE.tabBarItemLabel,
                    isActivate: _currentTabNum == HomeTab.MORE.tabLocNum,
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
          Container(
            height: 24,
            width: 24,
            child: Image.asset(
                widget.isActivate ? widget.imageAsset : widget.imageAssetUnclicked),
          ),
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
