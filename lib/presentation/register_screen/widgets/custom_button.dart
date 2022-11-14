import 'package:flutter/material.dart';
import 'package:hires/core/utils/color_constant.dart';

customButton({
  required String title,
  required Function onPressed,
  required bool isSelected,
  required Icon icon,
}) {
  return SizedBox(
      height: 50,
      width: 155,
      child: ElevatedButton.icon(
          onPressed: (){
            onPressed();
          },
          style: isSelected == true
              ? ElevatedButton.styleFrom(
              backgroundColor: ColorConstant.teal600,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(color: ColorConstant.teal600)
              )
          )
              : ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFE1F1E4),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(color: Color(0xFFE1F1E4))
              )
          ) ,
          icon: icon,
          label: Text(
            title,
            style: TextStyle(
                color: isSelected != false ? ColorConstant.whiteA700 : ColorConstant.teal600,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500
            ),
          )
      )
  );
}