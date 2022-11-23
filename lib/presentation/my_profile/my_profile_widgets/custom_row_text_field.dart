import 'package:flutter/material.dart';
import 'package:hires/core/utils/color_constant.dart';

customColumn({
  final title,
  final hint,
  required,
  var height,
  var width,
  var controller,
  var keyboardType,
  var maxLines,
}) {

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Colors.grey.shade300,
              offset: Offset(3,3)
            )
          ]
        ) ,
        child: TextFormField(
          style: TextStyle(color: Colors.black),
          maxLines: maxLines,
          keyboardType: keyboardType,
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
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
    ],
  );
}
customRow({
  final title1,
  final title2,
  final controller1,
  final hint1,
  final hint2,
  final controller2}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      customColumn(
          title: title1,
          height: 50.0,
          width: 150.0,
          hint: hint1,
          controller: controller1,
          maxLines: 1,
          keyboardType: TextInputType.text
      ),
      customColumn(
        title: title2,
        height: 50.0,
        width: 150.0,
        hint: hint2,
        controller: controller2,
        maxLines: 1,
        keyboardType: TextInputType.text,
      ),
    ],
  );

}