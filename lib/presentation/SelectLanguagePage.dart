import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translation/designsystem/component/CustomButton.dart';
import 'package:translation/designsystem/style/ColorStyles.dart';
import 'package:translation/riverpod/language_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'RootPage.dart';

class SelectLanguagePage extends ConsumerWidget {
  const SelectLanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLanguage = ref.watch(languageProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF00a991),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            AppLocalizations.of(context)?.select_language ?? 'Select Language'),
        backgroundColor: const Color(0xFF00a991),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Please choose your language.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Korean Button
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedLanguage == Language.korean
                      ? Colors.black
                      : Colors.grey[200],
                  foregroundColor: selectedLanguage == Language.korean
                      ? Colors.white
                      : Colors.black87,
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadowColor: Colors.teal.withOpacity(0.5),
                  elevation: selectedLanguage == Language.korean ? 10 : 2,
                ),
                onPressed: () =>
                    ref.read(languageProvider.notifier).state = Language.korean,
                child: const Text(
                  'Korean',
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
                      ? Colors.black
                      : Colors.grey[200],
                  foregroundColor: selectedLanguage == Language.english
                      ? Colors.white
                      : Colors.black87,
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadowColor: Colors.teal.withOpacity(0.5),
                  elevation: selectedLanguage == Language.english ? 10 : 2,
                ),
                onPressed: () => ref.read(languageProvider.notifier).state =
                    Language.english,
                child: const Text(
                  'English',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Nepali Button
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedLanguage == Language.nepali
                      ? Colors.black
                      : Colors.grey[200],
                  foregroundColor: selectedLanguage == Language.nepali
                      ? Colors.white
                      : Colors.black87,
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadowColor: Colors.teal.withOpacity(0.5),
                  elevation: selectedLanguage == Language.nepali ? 10 : 2,
                ),
                onPressed: () =>
                    ref.read(languageProvider.notifier).state = Language.nepali,
                child: const Text(
                  'Nepali',
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
                      ? Colors.black
                      : Colors.grey[200],
                  foregroundColor: selectedLanguage == Language.indonesian
                      ? Colors.white
                      : Colors.black87,
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadowColor: Colors.teal.withOpacity(0.5),
                  elevation: selectedLanguage == Language.indonesian ? 10 : 2,
                ),
                onPressed: () => ref.read(languageProvider.notifier).state =
                    Language.indonesian,
                child: const Text(
                  'Indonesian',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            CustomButton(
                label: '다음',
                color: AppColors.mainColor,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RootPage()),
                  );
                })
          ],
        ),
      ),
    );
  }
}
