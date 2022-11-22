 
 
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


loadingDialog(BuildContext context){
  showDialog(context: context, builder: (c){
    return Dialog(child:
      Column(mainAxisSize: MainAxisSize.min,children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Container(width: 50,height: 50,padding: EdgeInsets.all(10),child: CircularProgressIndicator(),),
        )
      ],),);
  });

}