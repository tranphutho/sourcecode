import 'package:flutter/material.dart';
import 'package:hires/core/utils/color_constant.dart';

customAddItemRow({
  required String mainTitle,
  var height,
  var width,
  var maxLines,
  required String errorText,
  var keyboardType,
  required var controller,
  var hint,

}) {
  return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              mainTitle,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height,
              width: width,
              child: TextFormField(
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return errorText;
                  }
                  return null;
                },
                style: TextStyle(color: Colors.black),
                maxLines: maxLines,
                keyboardType: keyboardType,
                controller: controller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  fillColor: ColorConstant.gray100,
                  contentPadding: EdgeInsets.all(18),
                  hintText: hint,
                  hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )
          ]
      )
  );
}