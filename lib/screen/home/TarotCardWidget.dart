import 'package:ai_fortune_teller/const/AppColors.dart';
import 'package:ai_fortune_teller/const/FontConst.dart';
import 'package:ai_fortune_teller/const/ImageConst.dart';
import 'package:ai_fortune_teller/uikit/comm_text/DetailText.dart';
import 'package:ai_fortune_teller/uikit/comm_title/H2_title.dart';
import 'package:ai_fortune_teller/uikit/decoration/CommDecoration.dart';
import 'package:flutter/material.dart';

class TarotCardWidget extends StatelessWidget {
  final String imageUrl;

  const TarotCardWidget({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        print("안녕")
      },
      child: Container(
        width: double.infinity,
        height: 142,
        decoration: CommDecoration.COMM_BOX_DECORATION,
        child: Container(
          padding: EdgeInsets.all(19),
          child: Row(
            children: [
              Container(
                width: 61,
                height: 104,
                margin: EdgeInsets.only(right: 19),
                child: Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/4/42/Pents03.jpg"),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    H2Title(title: "The High Preiestess"),
                    SizedBox(height: 8),
                    DetailText(detailText: "ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅇㅎㅇㅎㅇㅎㅇㅎ"),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(),
                          DetailText(detailText: "자세히보기"),
                          SizedBox(width: 4),
                          Icon(
                            Icons.chevron_right,
                            color: AppColors.TAB_TEAL_CLICKED,
                            size: 22,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
