import 'package:flutter/material.dart';

customContactUsTextField({
  var controller,
  var hintText,
  var keyboardType,
  var height
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 30),
    child: Container(
      height: height,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: Offset(3,3),
              blurRadius: 7,
            )
          ]
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: null,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    ),
  );
}