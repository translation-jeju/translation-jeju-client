import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translation/designsystem/component/CustomButton.dart';
import 'package:translation/designsystem/style/ColorStyles.dart';
import 'package:translation/riverpod/language_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../designsystem/style/FontStyles.dart';
import 'RootPage.dart';

class SelectLanguagePage extends ConsumerWidget {
  const SelectLanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLanguage = ref.watch(languageProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '언어선택',
          style: FontStyles.largeTitle,
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Spacer(),
          const Text(
            '사용하실 언어를 골라주세요.',
            style: TextStyle(
              fontSize: 25,
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 48,
          ),
          // Korean Button
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedLanguage == Language.korean
                    ? AppColors.subColor
                    : Colors.grey[200],
                foregroundColor: selectedLanguage == Language.korean
                    ? AppColors.darkText
                    : Colors.black87,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                shadowColor: Colors.teal.withOpacity(0.5),
                elevation: selectedLanguage == Language.korean ? 10 : 2,
              ),
              onPressed: () =>
                  ref.read(languageProvider.notifier).state = Language.korean,
              child: const Text(
                '한국어',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // English Button
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedLanguage == Language.english
                    ? AppColors.subColor
                    : Colors.grey[200],
                foregroundColor: selectedLanguage == Language.english
                    ? AppColors.darkText
                    : Colors.black87,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                shadowColor: Colors.teal.withOpacity(0.5),
                elevation: selectedLanguage == Language.english ? 10 : 2,
              ),
              onPressed: () =>
                  ref.read(languageProvider.notifier).state = Language.english,
              child: const Text(
                'English',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Chinese Button
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedLanguage == Language.chinese
                    ? AppColors.subColor
                    : Colors.grey[200],
                foregroundColor: selectedLanguage == Language.chinese
                    ? AppColors.darkText
                    : Colors.black87,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                shadowColor: Colors.teal.withOpacity(0.5),
                elevation: selectedLanguage == Language.chinese ? 10 : 2,
              ),
              onPressed: () =>
                  ref.read(languageProvider.notifier).state = Language.chinese,
              child: const Text(
                '普通话',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Indonesian Button
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedLanguage == Language.indonesian
                    ? AppColors.subColor
                    : Colors.grey[200],
                foregroundColor: selectedLanguage == Language.indonesian
                    ? AppColors.darkText
                    : Colors.black87,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                shadowColor: Colors.teal.withOpacity(0.5),
                elevation: selectedLanguage == Language.indonesian ? 10 : 2,
              ),
              onPressed: () => ref.read(languageProvider.notifier).state =
                  Language.indonesian,
              child: const Text(
                'Indonesia',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 48,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: CustomButton(
                label: AppLocalizations.of(context)?.done ?? 'Done',
                color: AppColors.mainColor,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RootPage()),
                  );
                }),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
