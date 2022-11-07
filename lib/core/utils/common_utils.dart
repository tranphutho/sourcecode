 
 
 import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

getToastMessage(String message , color) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 14.0,);
  }