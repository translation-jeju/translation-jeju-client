import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.BOTTOM,
    //backgroundColor: AppColors.g6.withOpacity(0.7),
    textColor: Colors.white,
    fontSize: 18,
    toastLength: Toast.LENGTH_SHORT,
  );
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFFECECEC),
        content: Text(message),
        duration: const Duration(seconds: 1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        action: SnackBarAction(
          label: "확인",
          textColor: const Color(0xFF404040),
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
}

