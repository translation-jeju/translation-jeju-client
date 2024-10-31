import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translation/designsystem/component/CustomCard.dart';

class MyWordPage extends ConsumerWidget {
  const MyWordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // FlipCard에 들어갈 데이터 리스트
    final List<Map<String, String>> cards = [
      {'front': 'Front 1', 'back': 'Back 1'},
      {'front': 'Front 2', 'back': 'Back 2'},
      {'front': 'Front 3', 'back': 'Back 3'},
      // 필요한 만큼 더 추가
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: null,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              Expanded(
                child: PageView.builder(
                  itemCount: cards.length,
                  itemBuilder: (context, index) {
                    return FlipCard(
                      fill: Fill.fillBack,
                      direction: FlipDirection.HORIZONTAL,
                      side: CardSide.FRONT,
                      front: FrontCard(text: cards[index]['front']!),
                      back: BackCard(text: cards[index]['back']!),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
