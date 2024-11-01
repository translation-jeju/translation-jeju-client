import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translation/data/repository/MyWordRepository.dart';
import 'package:translation/designsystem/component/CustomCard.dart';

import '../designsystem/style/ColorStyles.dart';
import '../riverpod/word_provider.dart';

class MyWordPage extends ConsumerStatefulWidget {
  const MyWordPage({super.key});

  @override
  ConsumerState<MyWordPage> createState() => _MyWordPageState();
}

class _MyWordPageState extends ConsumerState<MyWordPage> {
  final FlutterTts _tts = FlutterTts();
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    initializeTTS();
    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page!.round();
      });
    });
  }

  // TTS 초기화 및 설정
  Future<void> initializeTTS() async {
    await _tts.setLanguage("ko-KR");
    await _tts.setSpeechRate(0.5);
    await _tts.setVolume(1.0);
    await _tts.setPitch(1.0);
    // // 기기에서 사용할 수 있는 음성 목록 가져오기
    // List<dynamic> voices = await _tts.getVoices;
    // print("Available voices: $voices"); // 디버깅을 위해 사용 가능한 음성 목록을 출력

    // // 특정 음성을 설정
    // if (voices.isNotEmpty) {
    //   await _tts
    //       .setVoice({"name": voices[0]['name'], "locale": voices[0]['locale']});
    // }
  }

  @override
  Widget build(BuildContext context) {
    final cards = ref.watch(cardsProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: null,
        body: cards.when(
          data: (cards) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: cards.length,
                      itemBuilder: (context, index) {
                        return FlipCard(
                          fill: Fill.fillBack,
                          direction: FlipDirection.HORIZONTAL,
                          side: CardSide.FRONT,
                          front: BookmarkCard(
                            text: cards[index]['front']!,
                            order: '${index + 1}/${cards.length}',
                          ),
                          back: BookmarkCard(
                            text: cards[index]['back']!,
                            order: '${index + 1}/${cards.length}',
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            _tts.speak(cards[_currentIndex]['back']!);
                          },
                          child: SvgPicture.asset(
                            'assets/images/ic_volume_black.svg',
                            colorFilter: ColorFilter.mode(
                              AppColors.mainColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        InkWell(
                          onTap: () async {
                            // 북마크 추가 기능
                          },
                          child: const Icon(
                            Icons.bookmark,
                            color: AppColors.mainColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          error: (error, stackTrace) => Center(child: Text(error.toString())),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
