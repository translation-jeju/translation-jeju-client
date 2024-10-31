import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translation/presentation/selectlanguage_view.dart';

void main() async {
  //await dotenv.load(fileName: 'assets/config/.env');

  runApp(const ProviderScope(child: TranslationApp()));
}

class TranslationApp extends StatelessWidget {
  const TranslationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
