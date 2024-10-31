import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var languageProvider = StateProvider((ref) => "ko");

class SettingPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLanguage = ref.watch(languageProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Column(
          children: [
            Text("언어 선택", style: TextStyle(fontSize: 13)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Please choose your language"),
            Text("당신의 언어를 선택해주세요"),
            SizedBox(height: 20),
            // RadioListTile 사용
            RadioListTile<String>(
              title: Text('한국어'),
              value: 'ko',
              groupValue: selectedLanguage,
              onChanged: (String? value) {
                ref.read(languageProvider.notifier).state = value!;
              },
            ),
            RadioListTile<String>(
              title: Text('English'),
              value: 'en',
              groupValue: selectedLanguage,
              onChanged: (String? value) {
                ref.read(languageProvider.notifier).state = value!;
              },
            ),
            RadioListTile<String>(
              title: Text('Bahasa Indonesia'),
              value: 'id',
              groupValue: selectedLanguage,
              onChanged: (String? value) {
                ref.read(languageProvider.notifier).state = value!;
              },
            ),
            RadioListTile<String>(
              title: Text('नेपाली'),
              value: 'ne',
              groupValue: selectedLanguage,
              onChanged: (String? value) {
                ref.read(languageProvider.notifier).state = value!;
              },
            ),
          ],
        ),
      ),
    );
  }
}
