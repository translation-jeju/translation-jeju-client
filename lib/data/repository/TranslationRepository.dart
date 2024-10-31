import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<String> postTranslation(String question) async {
  try {
    Dio dio = Dio();
    dio.options.baseUrl = dotenv.get("BASE_URL");
    dio.options.validateStatus = (status) {
      return status! < 500;
    };
    late Response response;

    response = await dio.post(
      "/api/chat-bot/talk",
      data: {"question": question, "lang_code": 'ko'},
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
