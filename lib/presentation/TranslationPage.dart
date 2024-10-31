import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translation/data/repository/TranslationRepository.dart';
import 'package:translation/designsystem/style/ColorStyles.dart';
import 'package:translation/riverpod/language_provider.dart';
import 'package:translation/riverpod/speech_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
      ref.read(speechProvider).initialize(context); // context를 전달합니다.
    });
  }

  @override
  Widget build(BuildContext context) {
    final speechNotifier = ref.watch(speechProvider);
    final selectedLanguage = ref.watch(languageProvider);
    final languageName = selectedLanguage?.name ?? 'Unknown'; // 사용자가 선택한 언어이름

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: null,
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 인식된 텍스트를 표시하는 텍스트 상자
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 23.0, vertical: 25),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.line2),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      speechNotifier.text,
                      style: FontStyles.largeTitle,
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    // 음성 인식 시작/정지 버튼
                    Row(
                      children: [
                        InkWell(onTap: () {}, child: Icon(Icons.speaker)),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.white,
                                builder: (BuildContext context) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 25.0, left: 25, top: 25),
                                        child: Text(
                                          AppLocalizations.of(context)
                                                  ?.all_language ??
                                              'All language',
                                          style: FontStyles.smallTitle,
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        color: AppColors.line1,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 25),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  AppLocalizations.of(context)
                                                          ?.indonesian ??
                                                      'Indonesian',
                                                  style: FontStyles.smallBody,
                                                ),
                                                Divider(
                                                  thickness: 1,
                                                  color: AppColors.line1,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)?.indonesian ??
                                      'Indonesian',
                                  style: FontStyles.mediumBody,
                                ),
                                Icon(Icons.keyboard_arrow_down)
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (speechNotifier.isListening) {
                              speechNotifier.stopListening();
                            } else {
                              speechNotifier.startListening(ref);
                            }
                          },
                          child: Icon(speechNotifier.isListening
                              ? Icons.mic_off
                              : Icons.mic),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              //번역된 상태를 표시하는 텍스트 상자
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 23.0, vertical: 25),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: AppColors.mainColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '혼자옵서예',
                      style: FontStyles.largeTitle.copyWith(
                          color: Colors.white, fontFamily: 'PretendardMedium'),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    // 음성 인식 시작/정지 버튼
                    Row(
                      children: [
                        InkWell(
                          onTap: () async {
                            await postTranslation(speechNotifier.text,
                                selectedLanguage.toString());
                          },
                          child: const Icon(
                            Icons.speaker,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Text(
                            AppLocalizations.of(context)?.jeju_language ??
                                'Jeju language',
                            style: FontStyles.mediumBody,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (speechNotifier.isListening) {
                              speechNotifier.stopListening();
                            } else {
                              speechNotifier.startListening(ref);
                            }
                          },
                          child: Icon(
                            speechNotifier.isListening
                                ? Icons.mic_off
                                : Icons.mic,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
