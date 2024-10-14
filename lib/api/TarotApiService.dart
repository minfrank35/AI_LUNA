import 'dart:convert';
import 'package:ai_fortune_teller/api/dto/res/RES_T001.dart';
import 'package:ai_fortune_teller/dto/tarot_item.dart';
import 'package:http/http.dart' as http;

// Tarot API 호출 서비스
class TarotApiService {
  final String apiUrl = 'https://render-host-vpsf.onrender.com/api/tarot/list/popular'; // 실제 API 주소로 변경

  // API에서 TarotItem 리스트를 가져오는 함수
  Future<List<TarotItem>> fetchTarotList() async {
    final http.Response response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // 응답을 RES_T001 DTO로 변환
      final jsonResponse = jsonDecode(response.body);
      final resT001 = RES_T001.fromJson(jsonResponse);

      // RES_T001에서 TarotItem 리스트로 변환
      return resT001.list.map((item) => TarotItem.fromResData(item)).toList();
    } else {
      throw Exception('Failed to load tarot list');
    }
  }
}