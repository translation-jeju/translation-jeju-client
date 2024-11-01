import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translation/data/repository/MyWordRepository.dart';

import '../../riverpod/word_provider.dart';

Future<void> postBookmark(String appLanguage, String jeju, WidgetRef ref) async {
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
    if(response.statusCode == 200) {
      await getBookmark();
      ref.refresh(bookmarkProvider);
    }

  } catch (e) {
    print(e);
  }
}