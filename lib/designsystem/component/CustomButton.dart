import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Color color;
  final Color textColor;
  final Function() onPressed;

  const CustomButton(
      {super.key,
      required this.label,
      required this.color,
      required this.onPressed,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: color,
      ),
      child: Text(
        label,
        style: TextStyle(
            fontSize: 18,
            fontFamily: "PretendardSemi",
            color: textColor),
      ),
    );
  }
}
