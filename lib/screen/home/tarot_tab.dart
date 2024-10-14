import 'package:ai_fortune_teller/api/TarotApiService.dart';
import 'package:ai_fortune_teller/const/AppColors.dart';
import 'package:ai_fortune_teller/const/AppConst.dart';
import 'package:ai_fortune_teller/const/FontConst.dart';
import 'package:ai_fortune_teller/const/ImageConst.dart';
import 'package:ai_fortune_teller/const/Strings.dart';
import 'package:ai_fortune_teller/dto/tarot_item.dart';
import 'package:ai_fortune_teller/screen/home/H1_title.dart';
import 'package:ai_fortune_teller/screen/home/TarotCardWidget.dart';
import 'package:ai_fortune_teller/screen/home/app_title.dart';
import 'package:ai_fortune_teller/uikit/banner/BannerCarousel.dart';
import 'package:ai_fortune_teller/uikit/banner/BannerItem.dart';
import 'package:ai_fortune_teller/uikit/banner/SpreadBanner/spread_banner.dart';
import 'package:ai_fortune_teller/uikit/decoration/CommDecoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tarot extends StatefulWidget {
  const Tarot({super.key});

  @override
  State<Tarot> createState() => _TarotState();
}

class _TarotState extends State<Tarot> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTitle(
          type: AppTitleType.TYPE_1,
          data: Type1TitleData(titleText: "Luna", isAlarmOn: true),
        ),
        Align(
            alignment: AlignmentDirectional.centerStart,
            child: SpreadBanner()),
        Align(
            alignment: AlignmentDirectional.centerStart,
            child: TarotContent()),
      ],
    );
  }
}

class TarotContent extends StatefulWidget {
  const TarotContent({super.key});

  @override
  State<TarotContent> createState() => _TarotContentState();
}

class _TarotContentState extends State<TarotContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 9),
      padding: EdgeInsets.only(left: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 15),
              child: H1Title(titleText: 'Tarot')),
          Container(margin: EdgeInsets.only(bottom: 21), child: CommLazyRow()),
          TarotListView()
        ],
      ),
    );
  }
}

class CommLazyRow extends StatefulWidget {
  const CommLazyRow({super.key});

  @override
  State<CommLazyRow> createState() => _CommLazyRowState();
}

class _CommLazyRowState extends State<CommLazyRow> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: TarotTabConst.TAROT_MENU_LIST.length,
        itemBuilder: (context, index) {
          return CommLazyRowItem(
            text: TarotTabConst.TAROT_MENU_LIST.keys.toList()[index],
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            isSelected: _selectedIndex == index,
            imagePath: TarotTabConst.TAROT_MENU_LIST.values.toList()[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 12);
        },
      ),
    );
  }
}

class CommLazyRowItem extends StatelessWidget {
  final String text;
  final String imagePath;
  final void Function() onTap;
  final bool isSelected;

  const CommLazyRowItem({required this.text,
    required this.onTap,
    required this.isSelected,
    required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 11.5, bottom: 11.5),
        margin: EdgeInsets.only(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePath),
            SizedBox(
              width: 8,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: FontConst.GOWUN_DODUM,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            boxShadow: [CommDecoration.COMM_BOX_SHADOW],
            color: (isSelected)
                ? AppColors.DARK_YELLOW
                : AppColors.COMM_BACK_COLOR),
      ),
    );
  }
}

class TarotListView extends StatefulWidget {
  @override
  _TarotListViewState createState() => _TarotListViewState();
}

class _TarotListViewState extends State<TarotListView> {
  late Future<List<TarotItem>> tarotList;

  @override
  void initState() {
    super.initState();
    tarotList = TarotApiService().fetchTarotList(); // API 호출
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TarotItem>>(
      future: tarotList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator()); // 로딩 중
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}')); // 에러 처리
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No data found')); // 데이터 없을 때 처리
        } else {
          return Container(
            height: 200,
            child: ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return TarotListViewItem(tarotItem: snapshot.data![index]);
              },
              separatorBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  child: Divider(color: AppColors.DIVIDER, height: 1),
                );
              },
            ),
          );
        }
      },
    );
  }
}

class TarotListViewItem extends StatefulWidget {
  final TarotItem tarotItem;

  TarotListViewItem({required this.tarotItem});

  @override
  State<TarotListViewItem> createState() => _TarotListViewItemState();
}

class _TarotListViewItemState extends State<TarotListViewItem> {
  late TarotItem _tarotItem;

  @override
  void initState() {
    super.initState();
    _tarotItem = widget.tarotItem;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(_tarotItem.imagePath),
        SizedBox(width: 16,),
        Column(
          children: [
            Text(
              _tarotItem.title,
              style: TextStyle(
                color: AppColors.TAB_TEAL_CLICKED,
                fontSize: 13,
                fontFamily: FontConst.GOWUN_DODUM,
                fontWeight: FontWeight.normal,
                height: 18 / 13
              ),
            ),
            Row(
              children: [
                Image.asset(ImageConst.STAR_YELLOW),
                Text("${_tarotItem.star} · 조회수 ${_tarotItem.viewCount} +",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: FontConst.GOWUN_DODUM,
                  fontWeight: FontWeight.normal,
                  fontSize: 9,
                  height: 12 / 9
                ),)
              ],
            )
          ],
        )
      ],
    );
  }
}


