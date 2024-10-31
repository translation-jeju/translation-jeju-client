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
            children: [
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextField(
                  maxLines: 4,
                  maxLength: 3000,
                  decoration: const InputDecoration(
                    hintText: '번역할 내용을 입력하세요',
                    border: InputBorder.none,
                    counterText: '',
                  ),
                  onChanged: (text) {
                    // Handle text input
                  },
                ),
              ),

              const SizedBox(height: 10),

              // Input Text Area for Translation
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextField(
                  maxLines: 4,
                  maxLength: 3000,
                  decoration: const InputDecoration(
                    hintText: '번역할 내용을 입력하세요',
                    border: InputBorder.none,
                    counterText: '',
                  ),
                  onChanged: (text) {
                    // Handle text input
                  },
                ),
              ),
              const SizedBox(height: 10),

              // Translate Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle translation
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text("번역하기"),
                ),
              ),
              const SizedBox(height: 10),

              // Translated Text Display
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  "번역된 텍스트가 여기에 표시됩니다.",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Additional Controls (Speaker, Copy, Favorite, Share)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.volume_up),
                    onPressed: () {
                      // Handle text-to-speech
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: () {
                      // Handle copy text
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.star_border),
                    onPressed: () {
                      // Handle favorite
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {
                      // Handle share
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Speech Recognition Button
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
