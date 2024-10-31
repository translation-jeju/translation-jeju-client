import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TranslationPage extends ConsumerWidget {
  const TranslationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: null,
        body: Column(
          children: [
            Text('translationpage'),
          ],
        ),
      ),
    );
  }
}
