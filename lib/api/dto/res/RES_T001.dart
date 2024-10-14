import 'package:ai_fortune_teller/dto/tarot_item.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:http/http.dart' as http;

// Tarot API에서 받은 응답을 처리할 DTO
class RES_T001 {
  final String type;
  final List<RES_DATA_T001> list;

  RES_T001({required this.type, required this.list});

  factory RES_T001.fromJson(Map<String, dynamic> json) {
    var list = (json['list'] as List)
        .map((item) => RES_DATA_T001.fromJson(item))
        .toList();
    return RES_T001(
      type: json['type'],
      list: list,
    );
  }
}

// DTO 내 개별 데이터 클래스
class RES_DATA_T001 {
  final String title;
  final String star;
  final String view;
  final String imageUrl;

  RES_DATA_T001({
    required this.title,
    required this.star,
    required this.view,
    required this.imageUrl,
  });

  factory RES_DATA_T001.fromJson(Map<String, dynamic> json) {
    return RES_DATA_T001(
      title: json['title'],
      star: json['star'],
      view: json['view'],
      imageUrl: json['imageUrl'],
    );
  }
}