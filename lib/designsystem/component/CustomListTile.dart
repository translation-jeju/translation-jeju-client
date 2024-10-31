import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String appWord;
  final String jejuWord;
  final Function() bookmark;
  final Function() sound;

  const CustomListTile({
    super.key,
    required this.appWord,
    required this.jejuWord,
    required this.bookmark,
    required this.sound,
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
                  ),
                ),
                const Spacer(),
                GestureDetector(
                    onTap: bookmark, child: Icon(Icons.delete)),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: GestureDetector(
                      onTap: sound, child: Icon(Icons.delete)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
