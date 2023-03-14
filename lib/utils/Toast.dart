import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastFlutter {
  static void toastFn(message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
