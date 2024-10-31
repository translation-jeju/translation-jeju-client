import 'package:flutter/material.dart';

import '../style/ColorStyles.dart';
import '../style/FontStyles.dart';

class BookmarkCard extends StatelessWidget {
  final String text;

  const BookmarkCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 2,
      color: AppColors.mainColor,
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: FontStyles.largeTitle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
