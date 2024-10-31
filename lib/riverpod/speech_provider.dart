import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

// 음성 인식 상태를 관리하는 Provider
class SpeechNotifier extends ChangeNotifier {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = '버튼을 누르고 말하세요...';

  bool get isListening => _isListening;
  String get text => _text;

  // 음성 인식 초기화
  Future<void> initialize() async {
    _isListening = await _speech.initialize(); // 초기화 상태를 설정
    notifyListeners();
  }

  // 음성 인식 시작
  void startListening() async {
    if (!_isListening) {
      _isListening = true;
      _text = ''; // 초기화
      notifyListeners();

      await _speech.listen(onResult: (SpeechRecognitionResult result) {
        print("result: $result");
        _text = result.recognizedWords;
        print("Recognized: $_text");
        notifyListeners();
      });
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
