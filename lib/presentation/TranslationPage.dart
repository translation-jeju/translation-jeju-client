import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:translation/designsystem/style/ColorStyles.dart';
import 'package:translation/riverpod/language_provider.dart';
import 'package:translation/riverpod/speech_provider.dart';

import '../data/repository/ListRepository.dart';
import '../designsystem/style/FontStyles.dart';

class TranslationPage extends ConsumerStatefulWidget {
  const TranslationPage({super.key});

  @override
  ConsumerState<TranslationPage> createState() => _TranslationPageState();
}

class _TranslationPageState extends ConsumerState<TranslationPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(speechProvider).initialize(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final speechNotifier = ref.watch(speechProvider);
    final selectedLanguage = ref.watch(languageProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Recognized text display box
              _buildTextDisplayBox(context, speechNotifier, selectedLanguage),
              const SizedBox(height: 20),
              // Translated text display box
              _buildTranslatedTextBox(context, speechNotifier),
            ],
          ),
        ),
      ),
    );
  }

  // 텍스트 디스플레이 박스
  Widget _buildTextDisplayBox(
      BuildContext context, var speechNotifier, Language? selectedLanguage) {
    String languageLabel;

    switch (selectedLanguage) {
      case Language.korean:
        languageLabel = AppLocalizations.of(context)?.korean ?? 'Korean';
        break;
      case Language.english:
        languageLabel = AppLocalizations.of(context)?.english ?? 'English';
        break;
      case Language.chinese:
        languageLabel = AppLocalizations.of(context)?.chinese ?? 'Chinese';
        break;
      case Language.indonesian:
        languageLabel =
            AppLocalizations.of(context)?.indonesian ?? 'Indonesian';
        break;
      default:
        languageLabel = 'Unknown';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 25),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.line2),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text(speechNotifier.text, style: FontStyles.largeTitle)),
              InkWell(
                onTap: () async {
                  await postBookmark(
                      speechNotifier.text,
                      speechNotifier.translatedText, ref);
                },
                child: const Icon(
                  Icons.bookmark_border_outlined,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 38),
          Row(
            children: [
              InkWell(
                onTap: () {
                  speechNotifier.speakText();
                },
                child: SvgPicture.asset('assets/images/ic_volume_black.svg'),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: GestureDetector(
                  onTap: () => _showLanguageSelectionModal(context, ref),
                  child: Row(
                    children: [
                      Text(
                        languageLabel,
                        style: FontStyles.mediumBody,
                      ),
                      const Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  if (!speechNotifier.isListening) {
                    print(2);
                    await speechNotifier.startListening(ref);
                  } else {
                    print(1);
                    await speechNotifier.stopListening();
                  }
                },
                child: Icon(
                  speechNotifier.isListening ? Icons.mic : Icons.mic_off,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 번역된 텍스트 박스
  Widget _buildTranslatedTextBox(BuildContext context, var speechNotifier) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 25),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: AppColors.mainColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            speechNotifier.translatedText.isNotEmpty
                ? speechNotifier.translatedText
                : '번역된 텍스트가 여기에 표시됩니다.', // 기본값 설정
            style: FontStyles.largeTitle
                .copyWith(color: Colors.white, fontFamily: 'PretendardMedium'),
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              InkWell(
                onTap: () async {
                  print(speechNotifier.translatedText);
                  speechNotifier.speakTranslatedText();
                },
                child: SvgPicture.asset(
                  'assets/images/ic_volume_black.svg',
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  AppLocalizations.of(context)?.jeju_language ??
                      'Jeju language',
                  style: FontStyles.mediumBody.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showLanguageSelectionModal(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(right: 25.0, left: 25.0, top: 25.0),
                child: Text(
                  AppLocalizations.of(context)?.all_language ?? 'All languages',
                  style: FontStyles.smallTitle,
                ),
              ),
              const Divider(thickness: 1, color: AppColors.line1),
              _buildLanguageOption(context, ref, Language.korean, 'Korean'),
              const Divider(
                  thickness: 1,
                  color: AppColors.line1,
                  indent: 25,
                  endIndent: 25),
              _buildLanguageOption(context, ref, Language.english, 'English'),
              const Divider(
                  thickness: 1,
                  color: AppColors.line1,
                  indent: 25,
                  endIndent: 25),
              _buildLanguageOption(context, ref, Language.chinese, 'Chinese'),
              const Divider(
                  thickness: 1,
                  color: AppColors.line1,
                  indent: 25,
                  endIndent: 25),
              _buildLanguageOption(
                  context, ref, Language.indonesian, 'Indonesian'),
            ],
          ),
        );
      },
    );
  }

  // 언어 선택 옵션 위젯
  Widget _buildLanguageOption(
      BuildContext context, WidgetRef ref, Language language, String label) {
    return InkWell(
      onTap: () {
        ref.read(languageProvider.notifier).state = language;
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
        child: Text(label, style: FontStyles.smallBody),
      ),
    );
  }
}
