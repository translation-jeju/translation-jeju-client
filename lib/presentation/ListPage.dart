import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'SettingPage.dart';

class ListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLanguage = ref.watch(languageProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: null,
        body: Column(
          children: [
            Text(selectedLanguage),
          ],
        ),
      ),
    );
  }
}
