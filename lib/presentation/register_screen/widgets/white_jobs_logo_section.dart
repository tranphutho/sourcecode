import 'package:flutter/material.dart';
import 'package:hires/core/utils/math_utils.dart';

logoSection() {
  return Align(
    alignment: Alignment.topLeft,
    child: Padding(
        padding: EdgeInsets.only(
          left: getHorizontalSize(
            13.00,
          ),
        ),
        child: SizedBox(
          height: 80,
          width: 250,
          child: Image.asset(
              "assets/images/white_jobs_logo.png"
          ),
        )
    ),
  );
}