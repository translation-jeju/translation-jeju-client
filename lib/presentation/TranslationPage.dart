import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translation/riverpod/speech_provider.dart';

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

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF00a991),
        appBar: null,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 인식된 텍스트를 표시하는 텍스트 상자
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  speechNotifier.text,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 20),
              // 음성 인식 시작/정지 버튼
              FloatingActionButton(
                onPressed: () {
                  if (speechNotifier.isListening) {
                    speechNotifier.stopListening();
                  } else {
                    speechNotifier.startListening();
                  }
                },
                child: Icon(
                    speechNotifier.isListening ? Icons.mic_off : Icons.mic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
