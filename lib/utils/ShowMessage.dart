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



