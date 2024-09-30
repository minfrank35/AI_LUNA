import 'package:ai_fortune_teller/const/ImageConst.dart';

enum HomeTab {
  TAROT("Tarot", 0,
      ImageConst.TAROT_TINT,
      ImageConst.TAROT_GRAY),

  CHAT("Chat", 1,
      ImageConst.CHAT_TINT,
      ImageConst.CHAT_GRAY),

  MORE("More", 2,
      ImageConst.MORE_TINT,
      ImageConst.MORE_GRAY);

  final String tabBarItemLabel; // 탭바 아이템의 제목
  final int tabLocNum; // 탭 아이템 위치 (0이 제일 왼쪽)
  final String selectedImagePath; // 활성화된 이미지 경로
  final String unselectedImagePath; // 비활성화된 이미지 경로

  const HomeTab(this.tabBarItemLabel, this.tabLocNum, this.selectedImagePath, this.unselectedImagePath);
}
