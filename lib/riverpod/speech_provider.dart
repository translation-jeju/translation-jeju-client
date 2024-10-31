import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:translation/riverpod/language_provider.dart';

// 음성 인식 상태를 관리하는 Provider
class SpeechNotifier extends ChangeNotifier {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = 'Press the button and speak'; // 기본 값

  bool get isListening => _isListening;
  String get text => _text;

  // 음성 인식 초기화
  Future<void> initialize(BuildContext context) async {
    _isListening = await _speech.initialize(); // 초기화 상태를 설정
    _text = AppLocalizations.of(context)?.press_the_button_and_speak ??
        'Press the button and speak';
    notifyListeners();
  }

  // 선택된 언어에 맞는 localeId를 반환
  String _getLocaleIdFromLanguage(Language? language) {
    switch (language) {
      case Language.korean:
        return 'ko_KR';
      case Language.english:
        return 'en_US';
      case Language.nepali:
        return 'ne_NP';
      case Language.indonesian:
        return 'id_ID';
      default:
        return 'en_US'; // 기본값을 영어로 설정
    }
  }

  // 음성 인식 시작
  void startListening(WidgetRef ref) async {
    // 선택된 언어가 null일 경우 기본값을 설정합니다.
    final selectedLanguage = ref.watch(languageProvider) ?? Language.english;
    final localeId = _getLocaleIdFromLanguage(selectedLanguage);

    if (!_isListening) {
      _isListening = true;
      _text = ''; // 초기화
      notifyListeners();

      await _speech.listen(
        onResult: (SpeechRecognitionResult result) {
          print("result: $result");
          _text = result.recognizedWords;
          print("Recognized: $_text");
          notifyListeners();
        },
        localeId: localeId, // 선택된 언어의 localeId로 설정
      );
    }
  }

  // 음성 인식 중지
  void stopListening() async {
    if (_isListening) {
      await _speech.stop();
      _isListening = false;
      notifyListeners();
    }
  }
}

// Provider 인스턴스
final speechProvider = ChangeNotifierProvider((ref) => SpeechNotifier());
