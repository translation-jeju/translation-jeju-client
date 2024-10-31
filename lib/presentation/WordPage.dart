import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WordPage extends ConsumerWidget {
  const WordPage({super.key});

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
              Expanded(
                child: PageView.builder(
                  itemCount: cards.length,
                  itemBuilder: (context, index) {
                    return FlipCard(
                      fill: Fill.fillBack,
                      direction: FlipDirection.HORIZONTAL,
                      side: CardSide.FRONT,
                      front: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        elevation: 2,
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(cards[index]['front']!),
                          ),
                        ),
                      ),
                      back: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        elevation: 2,
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(cards[index]['back']!),
                          ),
                        ),
                      ),
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
