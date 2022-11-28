import 'package:flutter/material.dart';
import 'package:hires/models/user_model.dart';
import 'package:hires/presentation/my_profile/my_profile_widgets/custom_row_text_field.dart';

skillsCard({
  String? title,
UserModel? usePrv
}) {
  return Container(
    width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: Colors.grey.shade300)
      ),
      child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [



                Text(title!,style: TextStyle(fontSize: 20),),
                SizedBox(height: 10,),
                Wrap(
                  spacing: 5,
                  children: usePrv!.candidate!.skills!
                      .map<Widget>((e) => Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(e.name!,style: TextStyle(color: Colors.white),)))
                      .toList(),
                ),
              ]
          )
      )
  );
}