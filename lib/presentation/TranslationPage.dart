import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translation/designsystem/style/ColorStyles.dart';
import 'package:translation/riverpod/language_provider.dart';
import 'package:translation/riverpod/speech_provider.dart';

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
      ref.read(speechProvider).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    final speechNotifier = ref.watch(speechProvider);
    final languageNotifier = ref.watch(languageProvider);

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
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 38.0),
                      child: Text(
                        '한국어표기',
                        style: FontStyles.mediumBody,
                      ),
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
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            right: 25.0, left: 25, top: 25),
                                        child: Text(
                                          "모든 언어",
                                          style: FontStyles.smallTitle,
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        color: AppColors.line1,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const SizedBox(
                                          width: double.infinity,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 25),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "인도네시아어",
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
                            child: const Row(
                              children: [
                                Text(
                                  "인도네시아어",
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
                              speechNotifier.startListening();
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
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 38.0),
                      child: Text(
                        '어서오세요',
                        style: FontStyles.mediumBody.copyWith(
                            color: Colors.white,
                            fontFamily: 'PretendardMedium'),
                      ),
                    ),
                    // 음성 인식 시작/정지 버튼
                    Row(
                      children: [
                        InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.speaker,
                              color: Colors.white,
                            )),
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
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            right: 25.0, left: 25, top: 25),
                                        child: Text(
                                          "모든 언어",
                                          style: FontStyles.smallTitle,
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        color: AppColors.line1,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const SizedBox(
                                          width: double.infinity,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 25),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "인도네시아어",
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
                            child: Text(
                              "제주어/표준어",
                              style: FontStyles.mediumBody
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (speechNotifier.isListening) {
                              speechNotifier.stopListening();
                            } else {
                              speechNotifier.startListening();
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
