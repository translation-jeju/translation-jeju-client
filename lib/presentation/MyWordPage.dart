import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:translation/data/repository/MyWordRepository.dart';
import 'package:translation/designsystem/component/CustomCard.dart';

import '../designsystem/style/ColorStyles.dart';
import '../riverpod/word_provider.dart';


class MyWordPage extends ConsumerWidget {
  const MyWordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // FlipCard에 들어갈 데이터 리스트
    //AsyncValue<List<Map<String, String>>> cards = ref.watch(cardsProvider);
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
                      itemCount: cards.length,
                      itemBuilder: (context, index) {
                        return FlipCard(
                          fill: Fill.fillBack,
                          direction: FlipDirection.HORIZONTAL,
                          side: CardSide.FRONT,
                          front: BookmarkCard(text: cards[index]['front']!, order: '${index + 1}/${cards.length}',),
                          back: BookmarkCard(text: cards[index]['back']!, order: '${index + 1}/${cards.length}'),
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
                          },
                          child: SvgPicture.asset('assets/images/ic_volume_black.svg',
                            colorFilter: ColorFilter.mode(AppColors.mainColor, BlendMode.srcIn),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        InkWell(
                          onTap: () async {
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
          }, error: (Object error, StackTrace stackTrace) { Text(error.toString()); },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          )
        ),
      ),
    );
  }
}
