import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translation/presentation/selectlanguage_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

void main() async {
  //await dotenv.load(fileName: 'assets/config/.env');

  runApp(const ProviderScope(child: TranslationApp()));
}

class TranslationApp extends StatelessWidget {
  const TranslationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        // 다언어 설정
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        // 다언어 설정
        Locale('ko', ''), //한국어
        Locale('en', ''), //영어
        Locale('ne', ''), //네팔어
        Locale('id', ''), //인도네시아어
      ],
      debugShowCheckedModeBanner: false,
      title: '무사허우꽈',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SelectLanguageView(),
    );
  }
}
