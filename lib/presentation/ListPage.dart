import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translation/designsystem/component/CustomListTile.dart';
import 'package:translation/designsystem/style/ColorStyles.dart';
import 'package:flutter_tts/flutter_tts.dart';

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
                    title: const Text(
                      '인사말',
                      style: FontStyles.smallBody,
                    ),
                    children: [
                      CustomListTile(
                        appWord: AppLocalizations.of(context)?.hello ?? 'Hello',
                        jejuWord: '펜안 하우꽈?',
                        sound: () => _speakText('펜안 하우꽈?'),
                        bookmark: () {},
                      ),
                      CustomListTile(
                        appWord: AppLocalizations.of(context)?.hello ?? 'Hello',
                        jejuWord: '혼저 옵서예',
                        sound: () => _speakText('혼저 옵서예'),
                        bookmark: () {},
                      ),
                      CustomListTile(
                        appWord: AppLocalizations.of(context)?.hello ?? 'Hello',
                        jejuWord: '폭삭 속암수다',
                        sound: () => _speakText('폭삭 속암수다'),
                        bookmark: () {},
                      ),
                      CustomListTile(
                        appWord: AppLocalizations.of(context)?.hello ?? 'Hello',
                        jejuWord: '도르멍 하영 가쿠다',
                        sound: () => _speakText('도르멍 하영 가쿠다'),
                        bookmark: () {},
                      ),
                      CustomListTile(
                        appWord: AppLocalizations.of(context)?.hello ?? 'Hello',
                        jejuWord: '어디서 옵데가?',
                        sound: () => _speakText('어디서 옵데가?'),
                        bookmark: () {},
                      ),
                      CustomListTile(
                        appWord: AppLocalizations.of(context)?.hello ?? 'Hello',
                        jejuWord: '게로마씸',
                        sound: () => _speakText('게로마씸'),
                        bookmark: () {},
                      ),
                    ],
                  ),
                  ExpansionTile(
                    backgroundColor: AppColors.subColor,
                    collapsedBackgroundColor: AppColors.subColor,
                    title: const Text(
                      '생활/업무',
                      style: FontStyles.smallBody,
                    ),
                    children: [
                      CustomListTile(
                        appWord: AppLocalizations.of(context)?.hello ?? 'Hello',
                        jejuWord: '감저 저곡 해놨수다',
                        sound: () => _speakText('감저 저곡 해놨수다'),
                        bookmark: () {},
                      ),
                      CustomListTile(
                        appWord: AppLocalizations.of(context)?.hello ?? 'Hello',
                        jejuWord: '감결 딸라감쪄',
                        sound: () => _speakText('감결 딸라감쪄'),
                        bookmark: () {},
                      ),
                      CustomListTile(
                        appWord: AppLocalizations.of(context)?.hello ?? 'Hello',
                        jejuWord: '호꼼 씹서 해보난 좋수다',
                        sound: () => _speakText('호꼼 씹서 해보난 좋수다'),
                        bookmark: () {},
                      ),
                      CustomListTile(
                        appWord: AppLocalizations.of(context)?.hello ?? 'Hello',
                        jejuWord: '고다시 가수다',
                        sound: () => _speakText('고다시 가수다'),
                        bookmark: () {},
                      ),
                      CustomListTile(
                        appWord: AppLocalizations.of(context)?.hello ?? 'Hello',
                        jejuWord: '생이 갈라줘',
                        sound: () => _speakText('생이 갈라줘'),
                        bookmark: () {},
                      ),
                      CustomListTile(
                        appWord: AppLocalizations.of(context)?.hello ?? 'Hello',
                        jejuWord: '혼저혼저 오라게',
                        sound: () => _speakText('혼저혼저 오라게'),
                        bookmark: () {},
                      ),
                    ],
                  ),
                  ExpansionTile(
                    backgroundColor: AppColors.subColor,
                    collapsedBackgroundColor: AppColors.subColor,
                    title: const Text(
                      '쇼핑',
                      style: FontStyles.smallBody,
                    ),
                    children: [
                      CustomListTile(
                        appWord: AppLocalizations.of(context)?.hello ?? 'Hello',
                        jejuWord: '왕방갑서',
                        sound: () => _speakText('왕방갑서'),
                        bookmark: () {},
                      ),
                      CustomListTile(
                        appWord: AppLocalizations.of(context)?.hello ?? 'Hello',
                        jejuWord: '몽케지 마랑 혼저 오라게',
                        sound: () => _speakText('몽케지 마랑 혼저 오라게'),
                        bookmark: () {},
                      ),
                      CustomListTile(
                        appWord: AppLocalizations.of(context)?.hello ?? 'Hello',
                        jejuWord: '매기 우다',
                        sound: () => _speakText('매기 우다'),
                        bookmark: () {},
                      ),
                      CustomListTile(
                        appWord: AppLocalizations.of(context)?.hello ?? 'Hello',
                        jejuWord: '무신거 촞암수과',
                        sound: () => _speakText('무신거 촞암수과'),
                        bookmark: () {},
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
