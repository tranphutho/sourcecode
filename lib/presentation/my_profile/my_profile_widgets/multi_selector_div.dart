import 'package:flutter/material.dart';
import 'package:hires/core/app_export.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';

multiSelectorDiv({
  required final title,
  required final itemsList,
}) {
  return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: Colors.grey.shade300)
      ),
      child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 18
                    ),
                  )
                ),
                SizedBox(height: 30,),
                MultiSelectDialogField(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3,3),
                        blurRadius: 7,
                        color: Colors.grey.shade300
                      )
                    ],
                    color: ColorConstant.gray100,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  items: itemsList,
                  onConfirm: (values) {

                  }
                )
              ]
          )
      )
  );
}