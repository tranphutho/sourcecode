import 'package:flutter/material.dart';
import 'package:hires/models/applicant_detail_model.dart';

import '../../../core/utils/color_constant.dart';

class ExperienceItemWidget extends StatelessWidget {
  final ExperienceModel experience;
  const ExperienceItemWidget({Key? key,required this.experience}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0,0,0,10),
      child: Container(
        decoration: BoxDecoration(
            color: ColorConstant.gray100,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 7,
                  offset: Offset(3,3)
              )
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 180,
                    child: RichText(
                      text: TextSpan(
                          text: 'Start Date: ',
                          style: TextStyle(
                              color: Colors.blueAccent, fontSize: 17
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "${experience.from}",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black
                              ),
                            )
                          ]
                      ),
                    ),
                  ),
                  Container(
                    width: 120,
                    child: RichText(
                      text: TextSpan(
                          text: 'End date: ',
                          style: TextStyle(
                              color: Colors.blueAccent, fontSize: 17
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "${experience.to}",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black
                              ),
                            )
                          ]
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 180,
                    child: RichText(
                      text: TextSpan(
                          text: 'Location: ',
                          style: TextStyle(
                              color: Colors.blueAccent, fontSize: 17
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: experience.location,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black
                              ),
                            )
                          ]
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.delete_outline, color: Colors.blueAccent,),
                    onPressed: () {
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
