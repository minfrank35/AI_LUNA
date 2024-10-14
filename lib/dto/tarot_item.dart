// TarotItem 모델 (UI에서 사용할 데이터)
import 'package:ai_fortune_teller/api/dto/res/RES_T001.dart';

class TarotItem {
  final String title;
  final String star;
  final String viewCount;
  final String imagePath;

  TarotItem({
    required this.title,
    required this.star,
    required this.viewCount,
    required this.imagePath,
  });

  // Factory method to convert from DTO to TarotItem
  factory TarotItem.fromResData(RES_DATA_T001 data) {
    return TarotItem(
      title: data.title,
      star: data.star,
      viewCount: data.view,
      imagePath: "asset/" + data.imageUrl, // 이미지 경로 설정
    );
  }
}