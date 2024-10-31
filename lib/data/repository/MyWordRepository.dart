import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

// Future<String> getBookmark() async {
//   try {
//     Dio dio = Dio();
//     dio.options.baseUrl = dotenv.get("BASE_URL");
//     dio.options.validateStatus = (status) {
//       return status! < 500;
//     };
//     late Response response;
//
//     response = await dio.get(
//       "/api/store/find-all",
//     );
//
//     print('getBookmark 상태 확인');
//     print(response.statusCode);
//     print(response.data.toString());
//
//
//     if (response.statusCode == 200) {
//       return response.data.toString(); // 원하는 형태로 변환 가능
//     } else {
//       return '다시 시도해주세요.';
//     }
//   } catch (e) {
//     print(e);
//     return '다시 시도해주세요.';
//   }
// }

class BookmarkServices {
  Future<List<Map<String, String>>> getBookmark() async {
    final baseUrl = dotenv.get("BASE_URL");
    final url = Uri.parse('${baseUrl}/api/store/find-all');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      // JSON 배열을 List<dynamic>으로 디코드
      final List<dynamic> jsonData = jsonDecode(response.body);

      // List<Map<String, String>>로 변환
      final List<Map<String, String>> result = List<Map<String, String>>.from(
          jsonData.map((item) => Map<String, String>.from(item))
      );

      print(result);
      return result;
    } else {
      throw Exception('다시 시도해주세요');
    }
  }
}


final bookmarkProvider = Provider((ref) => BookmarkServices());