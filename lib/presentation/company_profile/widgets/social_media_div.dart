import 'package:flutter/material.dart';
import 'package:hires/presentation/my_profile/my_profile_widgets/custom_row_text_field.dart';

customSocialMediaDiv({
  required final txtSkype,
  required final txtFacebook,
  required final txtTwitter,
  required final txtInstagram,
  required final txtLinkedin,
  required final txtGoogle
}) {
  return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
              blurRadius: 5.0,
              color: Colors.grey,
              offset: Offset(
                  3,3
              )
          ),
        ],
      ),
      child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Social Media",
                      style: TextStyle(
                          fontSize: 18
                      ),
                    )
                ),
                SizedBox(height: 30,),
                customRow(
                    title1: "Skype",
                    title2: "Facebook",
                    controller1: txtSkype,
                    controller2: txtFacebook
                ),
                SizedBox(height: 20,),
                customRow(
                    title1: "Twitter",
                    title2: "Instagram",
                    controller1: txtTwitter,
                    controller2: txtInstagram
                ),
                SizedBox(height: 20,),
                customRow(
                    title1: "Linkedin",
                    title2: "Google",
                    controller1: txtLinkedin,
                    controller2: txtGoogle
                ),
              ]
          )
      )
  );
}