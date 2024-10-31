import 'package:flutter/material.dart';
import 'package:translation/designsystem/style/FontStyles.dart';

class CustomListTile extends StatelessWidget {
  final String appWord;
  final String jejuWord;
  final Function() bookmark;
  final Function() sound;

  const CustomListTile({
    super.key,
    required this.appWord,
    required this.jejuWord,
    required this.sound,
    required this.bookmark,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                appWord,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
                style: FontStyles.smallBody,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    jejuWord,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                    style: FontStyles.smallBody,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                    onTap: sound, child: Icon(Icons.speaker)),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: GestureDetector(
                      onTap: bookmark, child: Icon(Icons.bookmark)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
