import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> postBookmark(String appLanguage, String jeju) async {
  try {
    Dio dio = Dio();
    dio.options.baseUrl = dotenv.get("BASE_URL");
    dio.options.validateStatus = (status) {
      return status! < 500;
    };
    late Response response;

    response = await dio.post(
      "/api/store/language",
      data: {
        "st1": appLanguage,
        "st2": jeju
      },
    );

    print('postBookmark  상태 확인');
    print(response.statusCode);
    print(response.data.toString());


  } catch (e) {
    print(e);
  }
}