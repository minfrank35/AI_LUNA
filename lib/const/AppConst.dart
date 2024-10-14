import 'dart:collection';

import 'package:ai_fortune_teller/const/ImageConst.dart';
import 'package:ai_fortune_teller/dto/tarot_item.dart';

class TarotTabConst {
  static const List<String> APP_BANNER_LIST = [ImageConst.BANNER_COUPLE, ImageConst.BANNER_LUNA, ImageConst.BANNER_MONEY];
  static final LinkedHashMap<String, String> TAROT_MENU_LIST = LinkedHashMap<String, String>.from(
      {
        "인기 타로": ImageConst.STAR_LINEAR,
        "재물 · 사업" : ImageConst.MONEY_LINEAR,
        "연인" : ImageConst.HEART_LINEAR,
      }
  );
}
