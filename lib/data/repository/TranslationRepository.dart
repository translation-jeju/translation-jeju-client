import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TranslationRepository {
  final Dio _dio = Dio();

  TranslationRepository() {
    _dio.options.baseUrl = dotenv.get("BASE_URL");
    _dio.options.validateStatus = (status) {
      return status! < 500;
    };
  }

  Future<void> postTranslation(String question) async {
    try {
      final response = await _dio.post(
        "/api/chat-bot/talk",
        data: {
          "question": question,
        },
      );

      print('postTranslation 상태 확인');
      print(response.statusCode);

      if (response.statusCode == 200) {
        print('postTranslation 오류 확인');
        print(response.data);
      } else {
        // 서버에서 오류 응답을 받은 경우 처리
        throw Exception(
            'Failed to load postTranslation: ${response.statusCode}');
      }
    } catch (e) {
      // 네트워크 오류 또는 기타 오류 처리
      throw Exception('Error occurred: $e');
    }
  }
}

Future<String> postTranslation(String question, String language) async {
  try {
    Dio dio = Dio();
    dio.options.baseUrl = dotenv.get("BASE_URL");
    dio.options.validateStatus = (status) {
      return status! < 500;
    };
    late Response response;

    response = await dio.post(
      "/api/chat-bot/talk",
      data: {
        "question": question,
        "lang_code": language
      },
    );

    print('postTranslation 상태 확인');
    print(response.statusCode);
    print(response.data.toString());

    if (response.statusCode == 200) {
      return response.data.toString(); // 원하는 형태로 변환 가능
    } else {
      return '다시 시도해주세요.';
    }
  } catch (e) {
    print(e);
    return '다시 시도해주세요.';
  }
}
