import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

enum Language { korean, english, chinese, indonesian }

final languageProvider = StateProvider<Language?>((ref) => null);

Locale getLocaleFromLanguage(Language language) {
  switch (language) {
    case Language.korean:
      return const Locale('ko');
    case Language.english:
      return const Locale('en');
    case Language.chinese:
      return const Locale('zh');
    case Language.indonesian:
      return const Locale('id');
    default:
      return const Locale('ko');
  }
}
