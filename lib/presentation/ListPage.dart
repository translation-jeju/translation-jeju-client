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
                      '기본 표현',
                      style: FontStyles.smallBody,
                    ),
                    children: [
                      CustomListTile(
                        appWord: AppLocalizations.of(context)?.hello ?? 'Hello',
                        jejuWord: '펜안 하우꽈?',
                        sound: () => _speakText('펜안 하우꽈?'),
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
