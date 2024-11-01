import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translation/data/repository/ListRepository.dart';
import 'package:translation/designsystem/component/CustomListTile.dart';
import 'package:translation/designsystem/style/ColorStyles.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translation/utils/ShowMessage.dart';

import '../designsystem/style/FontStyles.dart';

class ListPage extends ConsumerStatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ListPage> createState() => _ListPageState();
}

class _ListPageState extends ConsumerState<ListPage> {
  final FlutterTts tts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _initTTS();
  }

  Future<void> _initTTS() async {
    try {
      await tts.setLanguage("ko-KR");
      await tts.setSpeechRate(0.5);
      print("TTS 초기화 성공");
    } catch (e) {
      print("TTS 초기화 중 오류 발생: $e");
    }
  }

  @override
  void dispose() {
    tts.stop(); // 현재 진행 중인 TTS 발음을 중지
    super.dispose();
  }

  Future<void> _speakText(String text) async {
    try {
      await tts.speak(text);
      print("TTS 발음 호출 성공: $text");
    } catch (e) {
      print("TTS 발음 중 오류 발생: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ExpansionTile(
                    backgroundColor: AppColors.subColor,
                    collapsedBackgroundColor: AppColors.subColor,
                    title: Text(
                      AppLocalizations.of(context)?.greetings ?? '인사말',
                      style: FontStyles.smallBody,
                    ),
                    children: [
                      CustomListTile(
                        appWord:
                            AppLocalizations.of(context)?.welcome ?? 'Welcome',
                        jejuWord: '혼저 옵서예',
                        sound: () => _speakText('혼저 옵서예'),
                        bookmark: () async {
                          await postBookmark(
                              AppLocalizations.of(context)!.welcome.toString(),
                              '혼저 옵서예', ref);
                          showToast('저장되었습니다');
                        },
                      ),
                      CustomListTile(
                        appWord: AppLocalizations.of(context)?.great_job ??
                            'Great job',
                        jejuWord: '폭삭 속암수다',
                        sound: () => _speakText('폭삭 속암수다'),
                        bookmark: () async {
                          await postBookmark(
                              AppLocalizations.of(context)!.great_job.toString(),
                              '폭삭 속암수다', ref);
                          showToast('저장되었습니다');
                        },
                      ),
                      CustomListTile(
                        appWord: AppLocalizations.of(context)?.enjoy_meal ??
                            'Enjoy your meal',
                        jejuWord: '도르멍 하영 가쿠다',
                        sound: () => _speakText('도르멍 하영 가쿠다'),
                        bookmark: () async {
                          await postBookmark(
                              AppLocalizations.of(context)!.enjoy_meal.toString(),
                              '도르멍 하영 가쿠다', ref);
                          showToast('저장되었습니다');
                        },
                      ),
                      CustomListTile(
                        appWord: AppLocalizations.of(context)?.where_from ??
                            'Where are you from?',
                        jejuWord: '어디서 옵데가?',
                        sound: () => _speakText('어디서 옵데가?'),
                        bookmark: () async {
                          await postBookmark(
                              AppLocalizations.of(context)!.where_from.toString(),
                              '어디서 옵데가?', ref);
                          showToast('저장되었습니다');
                        },
                      ),
                      CustomListTile(
                        appWord:
                            AppLocalizations.of(context)?.goodbye ?? 'Goodbye',
                        jejuWord: '게로마씸',
                        sound: () => _speakText('게로마씸'),
                        bookmark: () async {
                          await postBookmark(
                              AppLocalizations.of(context)!.goodbye.toString(),
                              '게로마씸', ref);
                          showToast('저장되었습니다');
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    backgroundColor: AppColors.subColor,
                    collapsedBackgroundColor: AppColors.subColor,
                    title: Text(
                      AppLocalizations.of(context)?.daily_life_work ?? '생활/업무',
                      style: FontStyles.smallBody,
                    ),
                    children: [
                      CustomListTile(
                        appWord:
                            AppLocalizations.of(context)?.potatoes_stacked ??
                                'The potatoes are stacked well',
                        jejuWord: '감저 저곡 해놨수다',
                        sound: () => _speakText('감저 저곡 해놨수다'),
                        bookmark: () async {
                          await postBookmark(
                              AppLocalizations.of(context)!.potatoes_stacked.toString(),
                              '감저 저곡 해놨수다', ref);
                          showToast('저장되었습니다');
                        },
                      ),
                      CustomListTile(
                        appWord:
                            AppLocalizations.of(context)?.let_us_pick_citrus ??
                                'Let us go pick citrus.',
                        jejuWord: '감결 딸라감쪄',
                        sound: () => _speakText('감결 딸라감쪄'),
                        bookmark: () async {
                          await postBookmark(
                              AppLocalizations.of(context)!.let_us_pick_citrus.toString(),
                              '감결 딸라감쪄', ref);
                          showToast('저장되었습니다');
                        },
                      ),
                      CustomListTile(
                        appWord: AppLocalizations.of(context)?.try_gradually ??
                            'It is good to try gradually',
                        jejuWord: '호꼼 씹서 해보난 좋수다',
                        sound: () => _speakText('호꼼 씹서 해보난 좋수다'),
                        bookmark: () async {
                          await postBookmark(
                              AppLocalizations.of(context)!.try_gradually.toString(),
                              '호꼼 씹서 해보난 좋수다', ref);
                          showToast('저장되었습니다');
                        },
                      ),
                      CustomListTile(
                        appWord: AppLocalizations.of(context)?.try_again ??
                            'Try again',
                        jejuWord: '고다시 가수다',
                        sound: () => _speakText('고다시 가수다'),
                        bookmark: () async {
                          await postBookmark(
                              AppLocalizations.of(context)!.try_again.toString(),
                              '고다시 가수다', ref);
                          showToast('저장되었습니다');
                        },
                      ),
                      CustomListTile(
                        appWord: AppLocalizations.of(context)?.classify_fish ??
                            'Classify the fish',
                        jejuWord: '생이 갈라줘',
                        sound: () => _speakText('생이 갈라줘'),
                        bookmark: () async {
                          await postBookmark(
                              AppLocalizations.of(context)!.classify_fish.toString(),
                              '생이 갈라줘', ref);
                          showToast('저장되었습니다');
                        },
                      ),
                      CustomListTile(
                        appWord: AppLocalizations.of(context)?.hurry_up ??
                            'Hurry up',
                        jejuWord: '혼저혼저 오라게',
                        sound: () => _speakText('혼저혼저 오라게'),
                        bookmark: () async {
                          await postBookmark(
                              AppLocalizations.of(context)!.hurry_up.toString(),
                              '혼저혼저 오라게', ref);
                          showToast('저장되었습니다');
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    backgroundColor: AppColors.subColor,
                    collapsedBackgroundColor: AppColors.subColor,
                    title: Text(
                      AppLocalizations.of(context)?.shopping ?? '쇼핑',
                      style: FontStyles.smallBody,
                    ),
                    children: [
                      CustomListTile(
                        appWord: AppLocalizations.of(context)?.come_see ??
                            'Come and see',
                        jejuWord: '왕방갑서',
                        sound: () => _speakText('왕방갑서'),
                        bookmark: () async {
                          await postBookmark(
                              AppLocalizations.of(context)!.come_see.toString(),
                              '왕방갑서', ref);
                          showToast('저장되었습니다');
                        },
                      ),
                      CustomListTile(
                        appWord:
                            AppLocalizations.of(context)?.hurry_up_and_come ??
                                'Hurry up and come',
                        jejuWord: '몽케지 마랑 혼저 오라게',
                        sound: () => _speakText('몽케지 마랑 혼저 오라게'),
                        bookmark: () async {
                          await postBookmark(
                              AppLocalizations.of(context)!.hurry_up_and_come.toString(),
                              '몽케지 마랑 혼저 오라게', ref);
                          showToast('저장되었습니다');
                        },
                      ),
                      CustomListTile(
                        appWord:
                            AppLocalizations.of(context)?.last_one_remaining ??
                                'There is one last one remaining',
                        jejuWord: '매기 우다',
                        sound: () => _speakText('매기 우다'),
                        bookmark: () async {
                          await postBookmark(
                              AppLocalizations.of(context)!.last_one_remaining.toString(),
                              '매기 우다', ref);
                          showToast('저장되었습니다');
                        },
                      ),
                      CustomListTile(
                        appWord: AppLocalizations.of(context)
                                ?.what_are_you_looking_for ??
                            'What are you looking for?',
                        jejuWord: '무신거 촞암수과',
                        sound: () => _speakText('무신거 촞암수과'),
                        bookmark: () async {
                          await postBookmark(
                              AppLocalizations.of(context)!.what_are_you_looking_for.toString(),
                              '무신거 촞암수과', ref);
                          showToast('저장되었습니다');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
