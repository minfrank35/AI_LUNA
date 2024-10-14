import 'package:ai_fortune_teller/const/ImageConst.dart';
import 'package:ai_fortune_teller/screen/home/H1_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: AppTitle(
    type: AppTitleType.TYPE_1,
    data: Type1TitleData(titleText: "Luna", isAlarmOn: true),
  )
  ));
}

enum AppTitleType {
  TYPE_1, //텍스트, 이미지
  TYPE_2, //
}

class Type1TitleData {
  final String titleText;
  final bool isAlarmOn;

  Type1TitleData({required this.titleText, required this.isAlarmOn});
}

class Type2TitleData {
  final IconData icon;

  Type2TitleData({required this.icon});
}

class AppTitle extends StatelessWidget {
  final AppTitleType type;
  final dynamic data; // 타입에 따라 데이터를 동적으로 받음

  const AppTitle({
    Key? key,
    required this.type,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AppTitleType.TYPE_1:
        final Type1TitleData type1Data = data as Type1TitleData;
        return _Type1Title(
            titleText: type1Data.titleText, isAlarmOn: type1Data.isAlarmOn);
      case AppTitleType.TYPE_2:
        final Type2TitleData type2Data = data as Type2TitleData;
        return _Type2Title();
      default:
        return Container(); // 기본값 처리
    }
  }
}

class _Type1Title extends StatefulWidget {
  final String? titleText;
  final bool isAlarmOn;

  const _Type1Title({Key? key, this.titleText, required this.isAlarmOn})
      : super(key: key);

  @override
  _Type1TitleState createState() => _Type1TitleState();
}

class _Type1TitleState extends State<_Type1Title> {
  late bool _isAlarmOn;

  @override
  void initState() {
    super.initState();
    // 초기 상태를 부모에서 받은 값으로 설정
    _isAlarmOn = widget.isAlarmOn;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      padding: EdgeInsets.only(left: 24, right: 24, top : 13, bottom: 13),
      child: Row(
        children: [
          H1Title(titleText: widget.titleText ?? "Luna"),
          // 기본값으로 Luna
          Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                _isAlarmOn = !_isAlarmOn; // 알람 상태를 토글
              });
            },
            child: Container(
              margin : EdgeInsets.all(5),
              child: Image.asset(
                (_isAlarmOn) ? ImageConst.ALARM_ON : ImageConst.ALARM_OFF,
                height: 19,
                width: 19,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Type2Title extends StatelessWidget {
  const _Type2Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Icon(Icons.image), // 이미지를 대신 렌더링
    );
  }
}
