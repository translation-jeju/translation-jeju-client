import 'package:flutter/material.dart';

import '../style/ColorStyles.dart';
import '../style/FontStyles.dart';

class FrontCard extends StatelessWidget {
  final String text;

  const FrontCard({super.key, required this.text});

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

class BackCard extends StatelessWidget {
  final String text;

  const BackCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 2,
      color: AppColors.mainColor,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              text,
              style: FontStyles.largeTitle.copyWith(color: Colors.white),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 38.0, bottom: 31),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.speaker,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.bookmark,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
