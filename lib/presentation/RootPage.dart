import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translation/presentation/ListPage.dart';
import 'package:translation/presentation/SelectLanguagePage.dart';
import 'package:translation/presentation/SettingPage.dart';
import 'package:translation/presentation/TranslationPage.dart';

import 'WordPage.dart';

var indexProvider = StateProvider((ref) => 0);

class RootPage extends ConsumerWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('무사허우꽈'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SelectLanguagePage()),
                );
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: IndexedStack(
        index: ref.watch(indexProvider),
        children: [
          TranslationPage(),
          ListPage(),
          WordPage(),
        ],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: (index) {
            ref.read(indexProvider.notifier).state = index;
          },
          currentIndex: ref.watch(indexProvider),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home_filled),
              label: '번역',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wordpress),
              activeIcon: Icon(Icons.wordpress_outlined),
              label: '상황별 리스트',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.translate),
              activeIcon: Icon(Icons.translate_outlined),
              label: '즐겨찾기',
            ),
          ],
        ),
      ),
    );
  }
}
