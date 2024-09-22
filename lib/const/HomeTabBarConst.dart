enum HomeTab {
  TODAY_FORTUNE("Today Fortune", 0,
      "assets/tab_today_fortune.png",
      "assets/tab_today_fortune_unclicked.png"),

  AR_TAROT("Ar Tarot", 1,
      "assets/tab_tarot.png",
      "assets/tab_tarot_unclicked.png"),

  PROFILE("Profile", 2,
      "assets/tab_profile.png",
      "assets/tab_profile_unclicked.png");

  final String tabBarItemLabel; // 탭바 아이템의 제목
  final int tabLocNum; // 탭 아이템 위치 (0이 제일 왼쪽)
  final String selectedImagePath; // 활성화된 이미지 경로
  final String unselectedImagePath; // 비활성화된 이미지 경로

  const HomeTab(this.tabBarItemLabel, this.tabLocNum, this.selectedImagePath, this.unselectedImagePath);
}
