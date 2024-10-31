import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translation/riverpod/language_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectLanguageView extends ConsumerWidget {
  const SelectLanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLanguage = ref.watch(languageProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.hello ?? 'Hello'),
        backgroundColor: Colors.teal[800],
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
                  fontSize: 24,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            LanguageButton(
              language: Language.korean,
              text: 'Korean',
              icon: Icons.park,
              isSelected: selectedLanguage == Language.korean,
              onSelect: () =>
                  ref.read(languageProvider.notifier).state = Language.korean,
              color: Colors.teal[300]!,
            ),
            LanguageButton(
              language: Language.english,
              text: 'English',
              icon: Icons.waves,
              isSelected: selectedLanguage == Language.english,
              onSelect: () =>
                  ref.read(languageProvider.notifier).state = Language.english,
              color: Colors.blue[300]!,
            ),
            LanguageButton(
              language: Language.nepali,
              text: 'Nepali',
              icon: Icons.landscape,
              isSelected: selectedLanguage == Language.nepali,
              onSelect: () =>
                  ref.read(languageProvider.notifier).state = Language.nepali,
              color: Colors.orange[300]!,
            ),
            LanguageButton(
              language: Language.indonesian,
              text: 'Indonesian',
              icon: Icons.sunny,
              isSelected: selectedLanguage == Language.indonesian,
              onSelect: () => ref.read(languageProvider.notifier).state =
                  Language.indonesian,
              color: Colors.yellow[300]!,
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageButton extends StatelessWidget {
  final Language language;
  final String text;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onSelect;
  final Color color;

  const LanguageButton({
    Key? key,
    required this.language,
    required this.text,
    required this.icon,
    required this.isSelected,
    required this.onSelect,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? color : Colors.grey[200],
          foregroundColor: isSelected ? Colors.white : Colors.black87,
          minimumSize: const Size.fromHeight(50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // 둥근 모서리
          ),
          shadowColor: Colors.teal.withOpacity(0.5), // 제주스러운 그림자
          elevation: isSelected ? 10 : 2, // 선택된 버튼의 그림자를 강조
        ),
        onPressed: onSelect,
        icon: Icon(icon, color: isSelected ? Colors.white : Colors.teal[800]),
        label: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
