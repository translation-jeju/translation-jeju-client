import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:translation/data/repository/TranslationRepository.dart';
import 'package:translation/riverpod/language_provider.dart';

class SpeechNotifier extends ChangeNotifier {
  final stt.SpeechToText _speech = stt.SpeechToText();
  final FlutterTts _tts = FlutterTts(); // TTS 인스턴스 생성
  bool _isListening = false;
  String _text = 'Press the button and speak'; // 기본값
  String _translatedText = ''; // 번역된 텍스트 저장

  bool get isListening => _isListening;
  String get text => _text;
  String get translatedText => _translatedText;

  // 번역 메서드
  Future<void> translateText(String originalText) async {
    _translatedText = await postTranslation(originalText);
    notifyListeners(); // UI 업데이트
  }

  // TTS 초기화 및 설정
  Future<void> initializeTTS() async {
    await _tts.setLanguage("ko-KR"); // 기본 언어 설정
    await _tts.setSpeechRate(0.5); // 발음 속도 설정
    await _tts.setVolume(1.0); // 볼륨 설정
    await _tts.setPitch(1.0); // 피치 설정
  }

  // 번역된 텍스트 음성 출력 메서드
  Future<void> speakTranslatedText() async {
    if (_translatedText.isNotEmpty) {
      await _tts.speak(_translatedText); // TTS 발음 호출
    } else {
      print("번역된 텍스트가 없습니다."); // 번역된 텍스트가 없는 경우 로그 출력
    }
  }

  // 번역된 텍스트 음성 출력 메서드
  Future<void> speakText() async {
    if (_text.isNotEmpty) {
      await _tts.speak(_text); // TTS 발음 호출
    } else {
      print("말씀해주세요"); // 번역된 텍스트가 없는 경우 로그 출력
    }
  }

  // 음성 인식 초기화
  Future<void> initialize(BuildContext context) async {
    _isListening = await _speech.initialize();
    await initializeTTS(); // TTS 초기화 추가
    _text = AppLocalizations.of(context)?.press_the_button_and_speak ??
        'Press the button and speak';
    notifyListeners();
  }

  // 선택된 언어의 localeId를 반환
  String _getLocaleIdFromLanguage(Language? language) {
    switch (language) {
      case Language.korean:
        return 'ko_KR';
      case Language.english:
        return 'en_US';
      case Language.chinese:
        return 'zh_CN';
      case Language.indonesian:
        return 'id_ID';
      default:
        return 'en_US'; // 기본값 설정
    }
  }

  // 음성 인식 시작
  Future<void> startListening(WidgetRef ref) async {
    final selectedLanguage = ref.read(languageProvider) ?? Language.english;
    final localeId = _getLocaleIdFromLanguage(selectedLanguage);

    if (!_isListening) {
      _isListening = true;
      _text = ''; // 텍스트 초기화
      notifyListeners();

      await _speech.listen(
        onResult: (SpeechRecognitionResult result) async {
          _text = result.recognizedWords;
          notifyListeners();

          // 번역 요청
          await translateText(_text);
        },
        localeId: localeId,
      );
    }
  }

  // 음성 인식 중지
  Future<void> stopListening() async {
    if (_isListening) {
      await _speech.stop();
      _isListening = false;
      notifyListeners();
    }
  }
}

// Provider 인스턴스
final speechProvider = ChangeNotifierProvider((ref) => SpeechNotifier());
