import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translation/designsystem/style/ColorStyles.dart';
import 'package:translation/presentation/ListPage.dart';
import 'package:translation/presentation/SelectLanguagePage.dart';
import 'package:translation/presentation/TranslationPage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

import '../designsystem/style/FontStyles.dart';
import 'MyWordPage.dart';

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
        title: const Text(
          '무사허우꽈?',
          style: FontStyles.largeTitle,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SelectLanguagePage()),
              );
            },
            icon: const Icon(
              Icons.settings_outlined,
              color: AppColors.darkText,
            ),
          )
        ],
      ),
      body: IndexedStack(
        index: ref.watch(indexProvider),
        children: [
          ListPage(),
          TranslationPage(),
          MyWordPage(),
        ],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.mainColor,
          unselectedLabelStyle:
              FontStyles.smallBody.copyWith(color: AppColors.subText),
          backgroundColor: Colors.white,
          onTap: (index) {
            ref.read(indexProvider.notifier).state = index;
          },
          currentIndex: ref.watch(indexProvider),
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/ic_list_unfill.svg'),
              activeIcon: SvgPicture.asset('assets/images/ic_list_fill.svg'),
              label:
                  AppLocalizations.of(context)?.conversation ?? 'Conversation',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/ic_translate_unfill.svg'),
              activeIcon:
                  SvgPicture.asset('assets/images/ic_translate_fill.svg'),
              label: AppLocalizations.of(context)?.translation ?? 'Translation',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/ic_my_word_unfill.svg'),
              activeIcon: SvgPicture.asset('assets/images/ic_my_word_fill.svg'),
              label: AppLocalizations.of(context)?.vocabulary ?? 'Vocabulary',
            ),
          ],
        ),
      ),
    );
  }
}
