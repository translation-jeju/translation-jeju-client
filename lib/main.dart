import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translation/presentation/SelectLanguagePage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:translation/riverpod/language_provider.dart';

void main() async {
  //await dotenv.load(fileName: 'assets/config/.env');

  runApp(const ProviderScope(child: TranslationApp()));
}

class TranslationApp extends ConsumerWidget {
  const TranslationApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLanguage = ref.watch(languageProvider);
    final locale = getLocaleFromLanguage(selectedLanguage ?? Language.korean);

    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
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
      locale: locale,
      debugShowCheckedModeBanner: false,
      title: '무사허우꽈',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SelectLanguagePage(),
    );
  }
}
