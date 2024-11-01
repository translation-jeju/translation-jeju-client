import 'package:flutter/material.dart';

import '../style/ColorStyles.dart';
import '../style/FontStyles.dart';

class BookmarkCard extends StatelessWidget {
  final String text;
  final String order;

  const BookmarkCard({super.key, required this.text, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 2,
      color: AppColors.mainColor,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Spacer(),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  text,
                  style: FontStyles.largeTitle.copyWith(color: Colors.white),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(order, style: FontStyles.smallTitle.copyWith(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}
