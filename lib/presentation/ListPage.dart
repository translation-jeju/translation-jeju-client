import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translation/designsystem/component/CustomListTile.dart';
import 'package:translation/designsystem/style/ColorStyles.dart';

import '../designsystem/style/FontStyles.dart';

class ListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Expanded(
          child: ListView(
            children: [
              ExpansionTile(
                backgroundColor: AppColors.subColor,
                collapsedBackgroundColor: AppColors.subColor,
                title: const Text(
                  '기본 표현',
                  style: FontStyles.smallBody,
                ),
                children: [
                  CustomListTile(
                      appWord: 'sdf',
                      jejuWord: '펜안 하우꽈? 제주도엔 오난 어떵 하우꽈?',
                      bookmark: () {},
                      sound: () {}),
                ],
              ),
              ExpansionTile(
                backgroundColor: AppColors.subColor,
                collapsedBackgroundColor: AppColors.subColor,
                title: Text(
                  AppLocalizations.of(context)?.restaurant ?? 'Restaurant',
                  style: FontStyles.smallBody,
                ),
                children: [],
              ),
              ExpansionTile(
                backgroundColor: AppColors.subColor,
                collapsedBackgroundColor: AppColors.subColor,
                title: Text(
                  '불편사항',
                  style: FontStyles.smallBody,
                ),
                children: [],
              ),
              ExpansionTile(
                backgroundColor: AppColors.subColor,
                collapsedBackgroundColor: AppColors.subColor,
                title: const Text(
                  '쇼핑',
                  style: FontStyles.smallBody,
                ),
                children: [],
              ),
              ExpansionTile(
                backgroundColor: AppColors.subColor,
                collapsedBackgroundColor: AppColors.subColor,
                title: const Text(
                  '교통',
                  style: FontStyles.smallBody,
                ),
                children: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
