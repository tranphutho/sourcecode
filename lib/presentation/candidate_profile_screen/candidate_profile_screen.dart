import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hires/core/utils/color_constant.dart';
import 'package:hires/models/candidates_model.dart';
import 'package:hires/models/user_model.dart';
import 'package:hires/presentation/employer_profile_screen/widgets/custom_contact_us_textfield.dart';
import 'package:provider/provider.dart';

class CandidateProfileScreen extends StatefulWidget {
  static String id = "candidateProfileScreen";
  const CandidateProfileScreen({Key? key}) : super(key: key);

  @override
  State<CandidateProfileScreen> createState() => _CandidateProfileScreenState();
}

class _CandidateProfileScreenState extends State<CandidateProfileScreen> {
  Cadidate? candidate;
  TextEditingController? contactNameController;
  TextEditingController? contactEmailController;
  TextEditingController? contactMessageController;

  @override
  void initState() {
    contactNameController = TextEditingController();
    contactEmailController = TextEditingController();
    contactMessageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    contactNameController!.dispose();
    contactEmailController!.dispose();
    contactMessageController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    candidate = ModalRoute.of(context)?.settings.arguments as Cadidate;
    UserModel usePrv = Provider.of<UserProvider>(
      context,
    ).userApp!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Container(
                height: screenWidth / 1.3,
                width: screenWidth,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: -20.0,
                        blurRadius: 20.0,
                      ),
                    ],
                    color: ColorConstant.gray100,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)
                    )
                ),
                child:
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: screenWidth / 10,),
                      Text(
                        candidate!.user?.name ?? "not available",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.grey.shade500,
                                size: 20,
                              ),
                              SizedBox(width: 5,),
                              SizedBox(
                                width: 60,
                                child: Text(
                                  candidate!.location?.name ?? "not available",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.clock,
                                color: Colors.grey.shade500,
                                size: 20,
                              ),
                              SizedBox(width: 5,),
                              SizedBox(
                                width: 80,
                                child: Text(
                                  candidate!.createdAt != null
                                      ? "Member since ${candidate!.createdAt}"
                                      :"not available",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300
                                  ),
                                ),
                              )
                            ],
                          ),

                        ],
                      ),
                      Container(
                        height: 40,
                        width: 125,
                        decoration: BoxDecoration(
                            color: Color(0xFFd4e2f4),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Center(
                          child: Text(
                            "Fresher",
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ),
                      ),
                      SizedBox(height: screenWidth / 10,),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: screenWidth / 6,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorConstant.gray100,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Candidates About",
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(height: screenWidth / 7,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CONTACT",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4451a4)
                            ),
                          ),
                          SizedBox(width: screenWidth / 6,),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.person_alt,
                                    color: Color(0xFF4451a4),
                                    size: 18,
                                  ),
                                  SizedBox(width: 5,),
                                  SizedBox(
                                    width: 140,
                                    child: Text(
                                      candidate!.user?.name ?? "not available",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF4451a4)
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: screenWidth / 20,),
                              Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.at,
                                    color: Color(0xFF4451a4),
                                    size: 18,
                                  ),
                                  SizedBox(width: 5,),
                                  SizedBox(
                                    width: 140,
                                    child: Text(
                                      candidate!.user?.email ?? "not available",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: screenWidth / 20,),
                              Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    color: Color(0xFF4451a4),
                                    size: 18,
                                  ),
                                  SizedBox(width: 5,),
                                  SizedBox(
                                    width: 140,
                                    child: Text(
                                      candidate?.user?.phone ?? "not available",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: screenWidth / 20,),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Color(0xFF4451a4),
                                    size: 18,
                                  ),
                                  SizedBox(width: 5,),
                                  SizedBox(
                                    width: 140,
                                    child: Text(
                                      candidate!.location?.name ?? "not available",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: screenWidth / 10,),
                      Divider(color: Color(0xFF4451a4), thickness: 1,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "OBJECTIVE",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4451a4)
                            ),
                          ),
                          SizedBox(width: screenWidth / 6,),
                          Column(
                            children: [
                              SizedBox(height: screenWidth / 12,),
                              candidate?.bio != null
                                  ? Html(data: candidate!.bio,)
                                  : Text("not available")
                            ],
                          )
                        ]
                      ),
                      SizedBox(height: screenWidth / 10,),
                      Divider(color: Color(0xFF4451a4), thickness: 1,),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "EXPERIENCE",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF4451a4)
                                  ),
                                ),
                                Text(
                                  candidate?.experience?.first.location ?? "",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF4451a4)
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: screenWidth / 7.5,),
                            Column(
                              children: [
                                SizedBox(height: screenWidth / 12,),

                                candidate?.experience?.first.from != null ?
                                  Html(data: candidate!.experience?.first.from,)
                                    : Text("not available")
                              ],
                            )
                          ]
                      ),
                      SizedBox(height: screenWidth / 10,),
                      Divider(color: Color(0xFF4451a4), thickness: 1,),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "EDUCATION",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF4451a4)
                              ),
                            ),
                            SizedBox(width: screenWidth / 6,),
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: candidate?.education?.length,
                                itemBuilder: (context, index) {
                                  return candidate?.education?[index].from != null ?
                                  Html(data: candidate!.education?[index].location,)
                                      : Text("not available");
                                },

                              ),
                            )
                          ]
                      ),
                      SizedBox(height: screenWidth / 10,),
                      Divider(color: Color(0xFF4451a4), thickness: 1,),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "SKILLS",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF4451a4)
                                  ),
                                ),
                                SizedBox(height: screenWidth / 20,),
                                // SizedBox(
                                //   width: screenWidth / 3,
                                //   child: Text(
                                //     "Passing year - ${candidate!.skills?.first.createdAt?.year.toString() ?? "not available"}",
                                //     style: TextStyle(
                                //         fontSize: 16,
                                //         fontWeight: FontWeight.w400,
                                //         color: Color(0xFF4451a4)
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                            SizedBox(width: screenWidth / 4,),
                            Column(
                              children: [
                                SizedBox(height: screenWidth / 12,),
                                SizedBox(
                                  width: screenWidth / 3,
                                  child: candidate!.skills!.isNotEmpty
                                    ? Html(data: candidate!.skills?.first.name,)
                                    : Text("not available"),
                                ),
                              ],
                            )
                          ]
                      ),
                      SizedBox(height: screenWidth / 10,),
                      Divider(color: Color(0xFF4451a4), thickness: 1,),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "INTERESTS",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF4451a4)
                                  ),
                                ),
                                SizedBox(height: screenWidth / 20,),
                              ],
                            ),
                            SizedBox(width: screenWidth / 5,),
                            Column(
                              children: [
                                SizedBox(height: screenWidth / 12,),
                                SizedBox(
                                  width: screenWidth / 3,
                                  child: candidate?.skills != null ?
                                  Text("not available") : Text("not available")
                                ),
                              ],
                            )
                          ]
                      ),
                      SizedBox(height: screenWidth / 10,),
                      Divider(color: Color(0xFF4451a4), thickness: 1,),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "LANGUAGES",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF4451a4)
                                  ),
                                ),
                                SizedBox(height: screenWidth / 20,),
                              ],
                            ),
                            SizedBox(width: screenWidth / 8,),
                            Column(
                              children: [
                                SizedBox(height: screenWidth / 12,),
                                SizedBox(
                                  width: screenWidth / 3,
                                  child: candidate?.languages != null ?
                                  Html(data: candidate!.languages,)
                                      : Text("not available"),
                                ),
                              ],
                            )
                          ]
                      ),
                      SizedBox(height: screenWidth / 10,),
                      Divider(color: Color(0xFF4451a4), thickness: 1,),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: screenWidth / 3,
                                  child: Text(
                                    "PERSONAL DETAILS",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF4451a4)
                                    ),
                                  ),
                                ),
                                SizedBox(height: screenWidth / 20,),
                              ],
                            ),
                            SizedBox(width: screenWidth / 12,),
                            Column(
                              children: [
                                SizedBox(height: screenWidth / 6,),
                                SizedBox(
                                  width: screenWidth / 2.5,
                                  child: candidate?.user?.birthday != null ?
                                  Text("Date of Birth: ${candidate!.user!.birthday.toString()}")
                                      : Text("not available"),
                                ),
                                SizedBox(height: screenWidth / 20,),
                                SizedBox(
                                  width: screenWidth / 2.5,
                                  child: candidate?.user?.phone != "" ?
                                  Text("Phone: ${candidate!.user!.phone.toString()}")
                                      : Text("not available"),
                                ),
                              ],
                            )
                          ]
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: screenWidth / 6,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorConstant.gray100,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      candidate?.user?.birthday != null
                        ? Padding(
                              padding: EdgeInsets.only(bottom: screenWidth / 10),
                              child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.hourglass_bottomhalf_fill,
                                  size: 40,
                                  color: Color(0xFF4451a4),
                                ),
                                SizedBox(width: screenWidth / 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Birthday:",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    SizedBox(height:screenWidth / 30,),
                                    Text(
                                      candidate?.user?.birthday != null
                                          ? "${candidate?.user?.birthday?.year}/${candidate?.user?.birthday?.month}/${candidate?.user?.birthday?.day}"
                                          : "not available",
                                      style: TextStyle(
                                          fontSize: 16,

                                      ),
                                    )
                                  ],
                                )
                              ],
                          ),
                        )
                        : Container(),
                      candidate?.gender != null
                        ? Padding(
                        padding: EdgeInsets.only(bottom: screenWidth / 10),
                        child: Row(
                          children: [
                            Icon(
                              CupertinoIcons.person,
                              size: 40,
                              color: Color(0xFF4451a4),
                            ),
                            SizedBox(width: screenWidth / 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Gender:",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                SizedBox(height:screenWidth / 30,),
                                Text(
                                  candidate?.gender != null
                                      ? candidate!.gender.toString()
                                      : "not available",
                                  style: TextStyle(
                                    fontSize: 16,

                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                        : Container(),
                      candidate?.languages != null
                        ? Padding(
                          padding: EdgeInsets.only(bottom: screenWidth / 10),
                          child: Row(
                          children: [
                            Icon(
                              Icons.language_outlined,
                              size: 40,
                              color: Color(0xFF4451a4),
                            ),
                            SizedBox(width: screenWidth / 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Language:",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                SizedBox(height:screenWidth / 30,),
                                SizedBox(
                                  width: screenWidth / 2,
                                  child: Text(
                                    candidate?.languages != null
                                        ? candidate!.languages.toString()
                                        : "not available",
                                    style: TextStyle(
                                      fontSize: 16,

                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                      ),
                      )
                      : Container(),
                      candidate?.educationLevel != null
                        ? Padding(
                          padding: EdgeInsets.only(bottom: screenWidth / 10),
                          child: Row(
                          children: [
                            Icon(
                              Icons.reduce_capacity_outlined,
                              size: 40,
                              color: Color(0xFF4451a4),
                            ),
                            SizedBox(width: screenWidth / 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Education Level:",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                SizedBox(height:screenWidth / 30,),
                                Text(
                                  candidate?.educationLevel != null
                                      ? candidate!.educationLevel.toString()
                                      : "not available",
                                  style: TextStyle(
                                    fontSize: 16,

                                  ),
                                )
                              ],
                            )
                          ],
                      ),
                        )
                        : Container(),
                      candidate?.expectedSalary != null
                          ? Padding(
                        padding: EdgeInsets.only(bottom: screenWidth / 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.money_outlined,
                              size: 40,
                              color: Color(0xFF4451a4),
                            ),
                            SizedBox(width: screenWidth / 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Expected Salary:",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                SizedBox(height:screenWidth / 30,),
                                Text(
                                  candidate?.expectedSalary != null
                                      ? candidate!.expectedSalary.toString()
                                      : "not available",
                                  style: TextStyle(
                                    fontSize: 16,

                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                          : Container(),
                      candidate?.experienceYear != null
                          ? Padding(
                        padding: EdgeInsets.only(bottom: screenWidth / 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              size: 40,
                              color: Color(0xFF4451a4),
                            ),
                            SizedBox(width: screenWidth / 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Experience:",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                SizedBox(height:screenWidth / 30,),
                                Text(
                                  candidate?.experienceYear != null
                                      ? candidate!.experienceYear.toString()
                                      : "not available",
                                  style: TextStyle(
                                    fontSize: 16,

                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                          : Container(),
                    ]
                  )
                )
              )
            ),
            SizedBox(height: screenWidth / 6,),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: ColorConstant.gray100,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Social Media",
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            candidate?.socialMedia?.skype != null
                              ? Padding(
                              padding: EdgeInsets.only(bottom: screenWidth / 10),
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.skype,
                                    size: 40,
                                    color: Color(0xFF4451a4),
                                  ),
                                  SizedBox(width: screenWidth / 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Skype:",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                      SizedBox(height:screenWidth / 30,),
                                      Text(
                                        candidate?.socialMedia?.skype != null
                                            ? candidate?.socialMedia?.skype
                                            : "not available",
                                        style: TextStyle(
                                          fontSize: 16,

                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                              : Container(),
                            candidate?.socialMedia?.facebook != null
                              ? Padding(
                              padding: EdgeInsets.only(bottom: screenWidth / 10),
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.facebook,
                                    size: 40,
                                    color: Color(0xFF4451a4),
                                  ),
                                  SizedBox(width: screenWidth / 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Facebook:",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                      SizedBox(height:screenWidth / 30,),
                                      Text(
                                        candidate?.socialMedia?.facebook != null
                                            ? candidate?.socialMedia?.facebook
                                            : "not available",
                                        style: TextStyle(
                                          fontSize: 16,

                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                              : Container(),
                            candidate?.socialMedia?.google != null
                              ? Padding(
                              padding: EdgeInsets.only(bottom: screenWidth / 10),
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.google,
                                    size: 40,
                                    color: Color(0xFF4451a4),
                                  ),
                                  SizedBox(width: screenWidth / 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Google:",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                      SizedBox(height:screenWidth / 30,),
                                      Text(
                                        candidate?.socialMedia?.google != null
                                            ? candidate?.socialMedia?.google
                                            : "not available",
                                        style: TextStyle(
                                          fontSize: 16,

                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                              : Container(),
                            candidate?.socialMedia?.linkedin != null
                              ? Padding(
                            padding: EdgeInsets.only(bottom: screenWidth / 10),
                            child: Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.linkedin,
                                  size: 40,
                                  color: Color(0xFF4451a4),
                                ),
                                SizedBox(width: screenWidth / 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Linkedin:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    SizedBox(height:screenWidth / 30,),
                                    Text(
                                      candidate?.socialMedia?.linkedin != null
                                          ? candidate?.socialMedia?.linkedin
                                          : "not available",
                                      style: TextStyle(
                                        fontSize: 16,

                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                              : Container(),
                            candidate?.socialMedia?.instagram != null
                              ? Padding(
                              padding: EdgeInsets.only(bottom: screenWidth / 10),
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.instagram,
                                    size: 40,
                                    color: Color(0xFF4451a4),
                                  ),
                                  SizedBox(width: screenWidth / 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Instagram:",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                      SizedBox(height:screenWidth / 30,),
                                      Text(
                                        candidate?.socialMedia?.instagram != null
                                            ? candidate?.socialMedia?.instagram
                                            : "not available",
                                        style: TextStyle(
                                          fontSize: 16,

                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                              : Container(),
                            candidate?.socialMedia?.twitter != null
                              ? Padding(
                              padding: EdgeInsets.only(bottom: screenWidth / 10),
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.twitter,
                                    size: 40,
                                    color: Color(0xFF4451a4),
                                  ),
                                  SizedBox(width: screenWidth / 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Twitter:",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                      SizedBox(height:screenWidth / 30,),
                                      Text(
                                        candidate?.socialMedia?.twitter != null
                                            ? candidate?.socialMedia?.twitter
                                            : "not available",
                                        style: TextStyle(
                                          fontSize: 16,

                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                              : Container(),
                          ]
                        )
                    )
                )
            ),
            SizedBox(height: screenWidth / 6,),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: ColorConstant.gray100,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Professional Skills",
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              SizedBox(height: screenWidth / 10),
                              candidate?.skills != null
                                  ? SizedBox(
                                    height: 50,
                                    width: 300,
                                    child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: candidate!.skills!.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(right: screenWidth / 20),
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.white
                                            ),
                                            child: Center(child: Text(candidate?.skills![index].name ?? "")),
                                          ),
                                        );
                                      }
                                    ),
                                  )
                                  : Container()
                            ]
                        )
                    )
                )
            ),
            SizedBox(height: screenWidth / 6,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: ColorConstant.gray100,
                    borderRadius: BorderRadius.circular(15)
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contact us",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(height: 30,),
                    customContactUsTextField(
                        controller: contactNameController,
                        hintText: "Your Name",
                        keyboardType: TextInputType.name,
                        height: 50.0
                    ),
                    customContactUsTextField(
                        controller: contactEmailController,
                        hintText: "Email Address",
                        keyboardType: TextInputType.emailAddress,
                        height: 50.0

                    ),
                    customContactUsTextField(
                      controller: contactMessageController,
                      hintText: "Message",
                      keyboardType: TextInputType.multiline,
                    ),
                    ElevatedButton(

                        onPressed: () {},
                        child: Center(child: Text("Send Message"),)
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: screenWidth / 10,),

          ],
        ),
      ),
    );
  }
}
