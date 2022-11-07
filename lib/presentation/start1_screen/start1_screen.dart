import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hires/core/app_export.dart';
import 'package:hires/models/user_model.dart';
import 'package:hires/presentation/home_screen/home_screen.dart';
import 'package:hires/presentation/set_b1_screen/set_b1_screen.dart';
import 'package:provider/provider.dart';

class Start1Screen extends StatefulWidget {
  static String id = "Start1Screen";

  @override
  State<Start1Screen> createState() => _Start1ScreenState();
}

class _Start1ScreenState extends State<Start1Screen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () async {
      await context.read<UserProvider>().getData();
      if (context.read<UserProvider>().userApp == null)
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => SetB1Screen()));
      else
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.teal600,
      body: Container(
        width: size.width,
        child: Container(
          decoration: BoxDecoration(
            color: ColorConstant.teal600,
          ),
          child: Center(
            child: Image.asset(
              "assets/images/logo.png",
              height: getSize(300),
              width: getSize(300),
            ),
            // child: Text(
            //   "${Constants.appName} 12345",
            //   overflow: TextOverflow.ellipsis,
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //     color: ColorConstant.whiteA700,
            //     fontSize: getFontSize(
            //       40,
            //     ),
            //     fontFamily: 'Poppins',
            //     fontWeight: FontWeight.w600,
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
