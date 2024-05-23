import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> showToast(msg) {
  return Fluttertoast.showToast(
    backgroundColor: Colors.amber,
    toastLength: Toast.LENGTH_LONG,
    msg: msg,
  );
}
