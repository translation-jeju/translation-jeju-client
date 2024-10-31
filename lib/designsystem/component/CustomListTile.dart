import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  final String word;
  final Function() bookmark;
  final Function() sound;

  const CustomListTile(
      {super.key,
        required this.word,
        required this.bookmark,
        required this.sound});

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    final isLongWord = widget.word.length > 10;

    return GestureDetector(
      onTap: () {
        if(isLongWord) {

        }
      },
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.word,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: false,
                ),
              ),
              Spacer(),
              GestureDetector(onTap: widget.bookmark, child: Icon(Icons.delete)),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: GestureDetector(onTap: widget.sound, child: Icon(Icons.delete)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
