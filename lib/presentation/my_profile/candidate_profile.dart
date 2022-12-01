import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hires/core/utils/color_constant.dart';
import 'package:hires/core/utils/math_utils.dart';

import 'package:hires/models/applicant_detail_model.dart';
import 'package:hires/models/user_model.dart';
import 'package:hires/presentation/add_education_screen/add_education_screen.dart';
import 'package:hires/presentation/add_experience_screen/add_experience_screen.dart';
import 'package:hires/presentation/company_profile/widgets/social_media_div.dart';
import 'package:hires/presentation/my_profile/my_profile_widgets/categories_card.dart';
import 'package:hires/presentation/my_profile/my_profile_widgets/custom_image_upload.dart';
import 'package:hires/presentation/my_profile/my_profile_widgets/custom_list_view_div.dart';
import 'package:hires/presentation/my_profile/my_profile_widgets/custom_row_text_field.dart';
import 'package:hires/presentation/my_profile/my_profile_widgets/experience_item_widget.dart';
import 'package:hires/presentation/my_profile/my_profile_widgets/multi_selector_div.dart';
import 'package:hires/presentation/my_profile/my_profile_widgets/skill_card.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider/provider.dart';

import 'my_profile_widgets/education_item_widget.dart';

class CandidateProfile extends StatefulWidget {
  static String id = "candidateProfile";

  const CandidateProfile({Key? key}) : super(key: key);

  @override
  State<CandidateProfile> createState() => _CandidateProfileState();
}

class _CandidateProfileState extends State<CandidateProfile> {
  late TextEditingController txtEmail;
  late TextEditingController txtFirstName;
  late TextEditingController txtLastName;
  late TextEditingController txtPhoneNum;
  late TextEditingController txtBirthday;
  late TextEditingController txtBiographical;
  late TextEditingController txtWebsite;
  late TextEditingController txtSalary;
  late TextEditingController txtExperience;
  late TextEditingController txtLanguage;
  late TextEditingController txtUrl;
  late TextEditingController txtLatitude;
  late TextEditingController txtLongitude;
  late TextEditingController txtMapZoom;
  late TextEditingController txtCity;
  late TextEditingController txtAddressLine;
  late TextEditingController txtSkype;
  late TextEditingController txtFacebook;
  late TextEditingController txtTwitter;
  late TextEditingController txtInstagram;
  late TextEditingController txtLinkedin;
  late TextEditingController txtGoogle;

  String genderDWValue = "Male";
  String salaryDWValue = "/hourly";
  String educationDWValue = "Bachelor's";
  String nearestCityDWValue = "Delhi";
  String countryDWValue = "Nepal";

  int? isDefault = 1;
  File? imageFile;

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFiles;

  List<ApplicantDetailModel> candidateEducationList = [
    ApplicantDetailModel(education: [
      EducationModel(
        from: "London Metropolitan University",
        to: "Bachelor's",
        location: "London",
        reward: "Upper Second class",
      ),
      EducationModel(
        from: "Tribhuwan University",
        to: "Masters",
        location: "Kathmandu",
        reward: "A",
      )
    ]),
  ];

  static List<Categories> _categoriesList = [
    Categories(id: 1, jobCategory: "Accounting"),
    Categories(id: 2, jobCategory: "Marketing"),
    Categories(id: 3, jobCategory: "Design"),
    Categories(id: 4, jobCategory: "Development"),
    Categories(id: 5, jobCategory: "Human Resource"),
    Categories(id: 6, jobCategory: "Project Management"),
    Categories(id: 7, jobCategory: "Customer Care"),
    Categories(id: 8, jobCategory: "Health and Care"),
    Categories(id: 8, jobCategory: "Automotive Jobs"),
  ];

  final _categories = _categoriesList
      .map((category) =>
          MultiSelectItem<Categories>(category, category.jobCategory))
      .toList();

  static List<JobSkills> _jobSkillsList = [
    JobSkills(id: 1, jobTitle: "App"),
    JobSkills(id: 2, jobTitle: "Administrative"),
    JobSkills(id: 3, jobTitle: "android"),
    JobSkills(id: 4, jobTitle: "wordpress"),
    JobSkills(id: 5, jobTitle: "design"),
    JobSkills(id: 6, jobTitle: "react"),
    JobSkills(id: 7, jobTitle: "javascript"),
    JobSkills(id: 8, jobTitle: "html"),
  ];
  final _jobSkills = _jobSkillsList
      .map(
          (jobSkill) => MultiSelectItem<JobSkills>(jobSkill, jobSkill.jobTitle))
      .toList();

  List<ApplicantDetailModel> candidateExperienceList = [
    ApplicantDetailModel(experience: [
      ExperienceModel(
          from: "Matin Softech",
          location: "Biratnagar",
          position: "Flutter Developer",
          information: "Worked as a junior flutter developer"),
      ExperienceModel(
        from: "Learngaroo Learning",
        location: "Kathmandu",
        position: "Flutter Intern",
        information: "Worked as a flutter intern",
      )
    ]),
  ];

  List<UserModel> userModel = [];

  List<DropdownMenuItem<dynamic>>? genderList = [
    DropdownMenuItem(
      child: Text(
        "Male",
        style: TextStyle(color: Colors.black),
      ),
      value: "Male",
    ),
    DropdownMenuItem(
        child: Text(
          "Female",
          style: TextStyle(color: Colors.black),
        ),
        value: "Female"),
    DropdownMenuItem(
      child: Text(
        "Others",
        style: TextStyle(color: Colors.black),
      ),
      value: "Others",
    ),
  ];

  List<DropdownMenuItem<dynamic>>? countryList = [
    DropdownMenuItem(
      child: Text(
        "Nepal",
        style: TextStyle(color: Colors.black),
      ),
      value: "Nepal",
    ),
    DropdownMenuItem(
        child: Text(
          "India",
          style: TextStyle(color: Colors.black),
        ),
        value: "India"),
    DropdownMenuItem(
      child: Text(
        "Pakistan",
        style: TextStyle(color: Colors.black),
      ),
      value: "Pakistan",
    ),
  ];

  List<DropdownMenuItem<dynamic>>? educationList = [
    DropdownMenuItem(
      child: Text(
        "Bachelor's",
        style: TextStyle(color: Colors.black),
      ),
      value: "Bachelor's",
    ),
    DropdownMenuItem(
        child: Text(
          "Masters",
          style: TextStyle(color: Colors.black),
        ),
        value: "Masters"),
    DropdownMenuItem(
      child: Text(
        "Certificate",
        style: TextStyle(color: Colors.black),
      ),
      value: "Certificate",
    ),
    DropdownMenuItem(
      child: Text(
        "Diploma",
        style: TextStyle(color: Colors.black),
      ),
      value: "Diploma",
    ),
    DropdownMenuItem(
      child: Text(
        "Professional",
        style: TextStyle(color: Colors.black),
      ),
      value: "Professional",
    ),
    DropdownMenuItem(
      child: Text(
        "Associate",
        style: TextStyle(color: Colors.black),
      ),
      value: "Associate",
    ),
  ];

  List<DropdownMenuItem<dynamic>>? salaryList = [
    DropdownMenuItem(
      child: Text(
        "/hourly",
        style: TextStyle(color: Colors.black, fontSize: 14),
      ),
      value: "/hourly",
    ),
    DropdownMenuItem(
        child: Text(
          "/weekly",
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        value: "/weekly"),
    DropdownMenuItem(
      child: Text(
        "/monthly",
        style: TextStyle(color: Colors.black, fontSize: 14),
      ),
      value: "/monthly",
    ),
    DropdownMenuItem(
      child: Text(
        "/yearly",
        style: TextStyle(color: Colors.black, fontSize: 14),
      ),
      value: "/yearly",
    ),
  ];

  List<DropdownMenuItem<dynamic>>? nearestCityList = [
    DropdownMenuItem(
      child: Text(
        "Delhi",
        style: TextStyle(color: Colors.black),
      ),
      value: "Delhi",
    ),
    DropdownMenuItem(
        child: Text(
          "Kathmandu",
          style: TextStyle(color: Colors.black),
        ),
        value: "Kathmandu"),
    DropdownMenuItem(
      child: Text(
        "Agra",
        style: TextStyle(color: Colors.black),
      ),
      value: "Agra",
    )
  ];

  @override
  void initState() {
    txtEmail = TextEditingController(text: "");
    txtFirstName = TextEditingController(text: "");
    txtLastName = TextEditingController(text: "");
    txtPhoneNum = TextEditingController(text: "");
    txtBirthday = TextEditingController(text: "");
    txtBiographical = TextEditingController(text: "");
    txtWebsite = TextEditingController(text: "");
    txtSalary = TextEditingController(text: "");
    txtExperience = TextEditingController(text: "");
    txtLanguage = TextEditingController(text: "");
    txtUrl = TextEditingController(text: "");
    txtLatitude = TextEditingController(text: "");
    txtLongitude = TextEditingController(text: "");
    txtMapZoom = TextEditingController(text: "");
    txtCity = TextEditingController(text: "");
    txtAddressLine = TextEditingController(text: "");
    txtTwitter = TextEditingController(text: '');
    txtFacebook = TextEditingController(text: '');
    txtSkype = TextEditingController(text: '');
    txtLinkedin = TextEditingController(text: '');
    txtInstagram = TextEditingController(text: '');
    txtGoogle = TextEditingController(text: '');

    super.initState();
  }

  @override
  void dispose() {
    txtEmail.dispose();
    txtFirstName.dispose();
    txtLastName.dispose();
    txtPhoneNum.dispose();
    txtBirthday.dispose();
    txtBiographical.dispose();
    txtWebsite.dispose();
    txtSalary.dispose();
    txtExperience.dispose();
    txtLanguage.dispose();
    txtUrl.dispose();
    txtLatitude.dispose();
    txtLongitude.dispose();
    txtMapZoom.dispose();
    txtCity.dispose();
    txtAddressLine.dispose();
    txtSkype.dispose();
    txtFacebook.dispose();
    txtTwitter.dispose();
    txtInstagram.dispose();
    txtLinkedin.dispose();
    txtGoogle.dispose();

    super.dispose();
  }

  UserModel? usePrv;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    Completer<GoogleMapController> _controller = Completer();

    usePrv = Provider.of<UserProvider>(context).userApp!;
    txtEmail.text = usePrv!.email ?? "";
    txtFirstName.text = usePrv!.first_name ?? "";
    txtLastName.text = usePrv!.last_name ?? "";
    final f = new DateFormat('dd/MM/yyyy');
    txtBirthday.text = "" + f.format(usePrv!.birthday!).toString();
    txtPhoneNum.text = usePrv!.phone ?? "";
    txtBiographical.text = usePrv!.bio ?? "";
    txtWebsite.text = usePrv!.company?.website ?? "";
    txtCity.text = usePrv!.company?.address ?? "";
    txtLatitude.text = usePrv!.candidate!.location!.mapLat ?? "";
    txtLongitude.text = usePrv!.candidate!.location?.mapLng ?? "";
    txtMapZoom.text = usePrv!.candidate!.location?.mapZoom.toString() ?? "";

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "My Profile",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                SizedBox(
                  height: screenHeight / 30,
                ),
                Container(

                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: Colors.grey.shade300)
                        // boxShadow: [
                        //   BoxShadow(
                        //     blurRadius: 5.0,
                        //     color: Colors.grey,
                        //     offset: Offset(
                        //       3,3
                        //     )
                        //   ),
                        // ],
                        ),
                    child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "User Info",
                                    style: TextStyle(fontSize: 18),
                                  )),
                              SizedBox(
                                height: 30,
                              ),
                              customColumn(
                                  title: "Email",
                                  controller: txtEmail,
                                  maxLines: 1,
                                  keyboardType: TextInputType.emailAddress),
                              SizedBox(
                                height: 20,
                              ),
                              customRow(
                                title1: "First name",
                                title2: "Last name",
                                controller1: txtFirstName,
                                controller2: txtLastName,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: 150,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Birthday",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 50,
                                          width: 150,
                                          decoration: BoxDecoration(boxShadow: [
                                            BoxShadow(
                                                blurRadius: 7,
                                                color: Colors.grey.shade300,
                                                offset: Offset(3, 3))
                                          ]),
                                          child: TextField(
                                            decoration: InputDecoration(
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                fillColor: ColorConstant.gray100,
                                                hintText: "YYYY-MM-DD"),
                                            controller: txtBirthday,
                                            //editing controller of this TextField
                                            readOnly: true,
                                            //set it true, so that user will not able to edit text
                                            onTap: () async {
                                              DateTime? pickedDate =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate: DateTime.now(),
                                                      firstDate: DateTime(2000),
                                                      //DateTime.now() - not to allow to choose before today.
                                                      lastDate: DateTime(2101));
                                              if (pickedDate != null) {
                                                String formattedDate =
                                                    DateFormat('yyyy-MM-dd')
                                                        .format(pickedDate);
                                                setState(() {
                                                  txtBirthday.text =
                                                      formattedDate; //set output date to TextField value.
                                                });
                                              } else {
                                                print("Date is not selected");
                                              }
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 100,
                                    width: 150,
                                    child: customColumn(
                                        height: 50.0,
                                        title: "Phone number",
                                        controller: txtPhoneNum,
                                        maxLines: 1,
                                        keyboardType: TextInputType.number),
                                  )
                                ],
                              ),
                              customColumn(
                                title: "Biographical",
                                controller: txtBiographical,
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                              ),
                            ]))),
                SizedBox(
                  height: screenHeight / 10,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: Colors.grey.shade300)
                        // boxShadow: [
                        //   BoxShadow(
                        //     blurRadius: 5.0,
                        //     color: Colors.grey,
                        //     offset: Offset(
                        //       3,3
                        //     )
                        //   ),
                        // ],
                        ),
                    child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Candidate Info",
                                    style: TextStyle(fontSize: 18),
                                  )),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      height: 100,
                                      width: 150,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 100,
                                              width: 150,
                                              child: customColumn(
                                                height: 50.0,
                                                title: "Website",
                                                controller: txtWebsite,
                                                maxLines: 1,
                                              ),
                                            )
                                          ])),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Gender",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: 160,
                                        child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 7,
                                                    color: Colors.grey.shade300,
                                                    offset: Offset(3, 3))
                                              ],
                                              color: ColorConstant.gray100,
                                              borderRadius: BorderRadius.circular(
                                                  15), //border raiuds of dropdown button
                                            ),
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 30, right: 30),
                                                child: DropdownButton<dynamic>(
                                                  value: genderDWValue,
                                                  items: genderList,
                                                  onChanged: (value) {
                                                    //get value when changed
                                                    setState(() {
                                                      genderDWValue =
                                                          value.toString();
                                                    });
                                                  },
                                                  icon: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 20),
                                                      child: Icon(
                                                          Icons.arrow_drop_down)),
                                                  style: TextStyle(fontSize: 16),

                                                  dropdownColor:
                                                      ColorConstant.gray100,
                                                  //dropdown background color
                                                  underline: Container(),
                                                  //remove underline
                                                  isExpanded:
                                                      true, //make true to make width 100%
                                                ))),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Expected salary",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade300,
                                          blurRadius: 7,
                                          offset: Offset(3, 3))
                                    ]),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      width: 199,
                                      child: Theme(
                                        data: ThemeData(
                                            inputDecorationTheme:
                                                InputDecorationTheme(
                                          filled: true,
                                          fillColor: ColorConstant.gray100,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(12),
                                                bottomLeft: Radius.circular(12)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: ColorConstant.teal600),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(12),
                                                bottomLeft: Radius.circular(12)),
                                          ),
                                        )),
                                        child: TextField(
                                          controller: txtSalary,
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                      width: 139,
                                      child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            color: Color(0xFFD9D9D9),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(12),
                                                bottomRight: Radius.circular(
                                                    12)), //border radius of dropdown button
                                          ),
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 30),
                                              child: DropdownButton<dynamic>(
                                                value: salaryDWValue,
                                                items: salaryList,
                                                onChanged: (value) {
                                                  //get value when changed
                                                  setState(() {
                                                    salaryDWValue =
                                                        value.toString();
                                                  });
                                                },
                                                icon: Icon(
                                                    Icons.arrow_drop_down),
                                                style: TextStyle(fontSize: 16),
                                                dropdownColor: Color(0xFFD9D9D9),
                                                //dropdown background color
                                                underline: Container(),
                                                //remove underline
                                                isExpanded:
                                                    true, //make true to make width 100%
                                              ))),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      height: 100,
                                      width: 150,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 100,
                                              width: 125,
                                              child: customColumn(
                                                keyboardType:
                                                    TextInputType.number,
                                                hint: "Year(s)",
                                                height: 50.0,
                                                title: "Experience",
                                                controller: txtExperience,
                                                maxLines: 1,
                                              ),
                                            )
                                          ])),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Education level",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 50,
                                        width: 188,
                                        decoration: BoxDecoration(boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 7,
                                              offset: Offset(3, 3))
                                        ]),
                                        child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              color: ColorConstant.gray100,
                                              borderRadius: BorderRadius.circular(
                                                  15), //border raiuds of dropdown button
                                            ),
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 30, right: 30),
                                                child: DropdownButton<dynamic>(
                                                  value: educationDWValue,
                                                  items: educationList,
                                                  onChanged: (value) {
                                                    //get value when changed
                                                    setState(() {
                                                      educationDWValue =
                                                          value.toString();
                                                    });
                                                  },
                                                  icon: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 20),
                                                      child: Icon(
                                                          Icons.arrow_drop_down)),
                                                  style: TextStyle(fontSize: 16),

                                                  dropdownColor:
                                                      Color(0xFFD9D9D9),
                                                  //dropdown background color
                                                  underline: Container(),
                                                  //remove underline
                                                  isExpanded:
                                                      true, //make true to make width 100%
                                                ))),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              customRow(
                                  title1: "Language",
                                  title2: "Video url",
                                  controller1: txtLanguage,
                                  controller2: txtUrl),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Video cover image",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  width: 400,
                                  height: 150,
                                  padding: EdgeInsets.all(7.5),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xFFD9D9D9)),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12))),
                                  child: imageFile == null
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                              Container(
                                                height: 150,
                                                width: 200,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/gallery_image.png"),
                                                      fit: BoxFit.contain),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    _getFromGallery();
                                                  },
                                                  child:
                                                      const Text("Upload image"),
                                                ),
                                              )
                                            ])
                                      : GestureDetector(
                                          onTap: () => _getFromGallery(),
                                          child: Image.file(imageFile!))),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Gallery (Recommended size image:1080 x 1920px)",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ElevatedButton.icon(
                                      icon: Icon(Icons.add_circle_outline),
                                      onPressed: () {
                                        openImages();
                                      },
                                      label: Text("Select images"),
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.symmetric(
                                                  horizontal: 16, vertical: 13)),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.teal)),
                                    ),
                                    Divider(),
                                    Text("Selected images:"),
                                    Divider(),
                                    imageFiles != null
                                        ? Wrap(
                                            children: imageFiles!.map((imageOne) {
                                              return Container(
                                                  child: Card(
                                                child: Container(
                                                  height: 100,
                                                  width: 100,
                                                  child: Image.file(
                                                      File(imageOne.path)),
                                                ),
                                              ));
                                            }).toList(),
                                          )
                                        : Container()
                                  ],
                                ),
                              ),
                            ]))),
                SizedBox(
                  height: screenHeight / 10,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: Colors.grey.shade300)
                        // boxShadow: [
                        //   BoxShadow(
                        //     blurRadius: 5.0,
                        //     color: Colors.grey,
                        //     offset: Offset(
                        //       3,3
                        //     )
                        //   ),
                        // ],
                        ),
                    child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Job Location",
                                    style: TextStyle(fontSize: 18),
                                  )),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Country",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(),
                                        height: 50,
                                        width: 175,
                                        child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              color: ColorConstant.gray100,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                                boxShadow: [
                                                  BoxShadow(
                                                      blurRadius: 4,
                                                      color: Colors.grey.shade300,
                                                      offset: Offset(3,3)
                                                  )
                                                ]
                                            ),
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 30, right: 30),
                                                child: DropdownButton<dynamic>(
                                                  value: countryDWValue,
                                                  items: countryList,
                                                  onChanged: (value) {
                                                    //get value when changed
                                                    setState(() {
                                                      countryDWValue =
                                                          value.toString();
                                                    });
                                                  },
                                                  icon: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 20),
                                                      child: Icon(
                                                          Icons.arrow_drop_down)),
                                                  style: TextStyle(fontSize: 16),
                                                  dropdownColor:
                                                      Color(0xFFD9D9D9),
                                                  //dropdown background color
                                                  underline: Container(),
                                                  //remove underline
                                                  isExpanded:
                                                      true, //make true to make width 100%
                                                ))),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      height: 100,
                                      width: 150,
                                      child: Column(children: [
                                        SizedBox(
                                          height: 100,
                                          child: customColumn(
                                            keyboardType: TextInputType.number,
                                            height: 50.0,
                                            title: "City",
                                            controller: txtCity,
                                            maxLines: 1,
                                          ),
                                        )
                                      ])),
                                ],
                              ),
                              customColumn(
                                title: "Address line",
                                controller: txtAddressLine,
                                maxLines: 1,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Nearest city",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              DecoratedBox(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 7,
                                          offset: Offset(3, 3),
                                          color: Colors.grey.shade300)
                                    ],
                                    color: ColorConstant.gray100,
                                    borderRadius: BorderRadius.circular(
                                        15), //border raiuds of dropdown button
                                  ),
                                  child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 30, right: 30),
                                      child: DropdownButton<dynamic>(
                                        value: nearestCityDWValue,
                                        items: nearestCityList,
                                        onChanged: (value) {
                                          //get value when changed
                                          setState(() {
                                            nearestCityDWValue = value.toString();
                                          });
                                        },
                                        icon: Padding(
                                            padding: EdgeInsets.only(left: 20),
                                            child: Icon(Icons.arrow_drop_down)),
                                        style: TextStyle(fontSize: 16),

                                        dropdownColor: Color(0xFFD9D9D9),
                                        //dropdown background color
                                        underline: Container(),
                                        //remove underline
                                        isExpanded:
                                            true, //make true to make width 100%
                                      ))),
                              SizedBox(
                                height: 30,
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "The geographic coordinate",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 150,
                                child: GoogleMap(
                                  mapType: MapType.hybrid,
                                  markers: Set<Marker>.of([
                                    Marker(
                                        markerId: MarkerId("fdsdsfds"),
                                        position: LatLng(
                                            double.parse(usePrv!
                                                .candidate!.location!.mapLat!),
                                            double.parse(usePrv!
                                                .candidate!.location!.mapLng!)))
                                  ]),
                                  initialCameraPosition: CameraPosition(
                                      zoom: 16,
                                      target: LatLng(
                                          double.parse(usePrv!
                                              .candidate!.location!.mapLat!),
                                          double.parse(usePrv!
                                              .candidate!.location!.mapLng!))),
                                  onMapCreated: (GoogleMapController controller) {
                                    _controller.complete(controller);
                                  },
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: ColorConstant.gray100,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(3, 3),
                                          color: Colors.grey.shade300,
                                          blurRadius: 7)
                                    ]),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              customRow(
                                  title1: "Map latitude",
                                  title2: "Map longitude",
                                  controller1: txtLatitude,
                                  controller2: txtLongitude),
                              SizedBox(
                                height: 30,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 150,
                                  height: 100,
                                  child: customColumn(
                                      title: "Map zoom",
                                      controller: txtMapZoom,
                                      height: 50.0),
                                ),
                              ),
                            ]))),
                SizedBox(
                  height: screenHeight / 10,
                ),
                Container(
                    height: 1500,
                    width: screenWidth,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: Colors.grey.shade300)),
                    child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Education - Experience - Award",
                                    style: TextStyle(fontSize: 18),
                                  )),
                              SizedBox(
                                height: 30,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Education",style: TextStyle(fontSize: 20),),
                                    SizedBox(height: 15,),
                                    ListView.builder(
                                      shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) =>
                                            index == usePrv!.candidate!.education!.length - 1
                                                ? Column(
                                                  children: [
                                                    EducationItemWidget(
                                                      education: usePrv!
                                                          .candidate!.education![index],
                                                    ),
                                                    Align(
                                                      alignment: Alignment.topRight,
                                                      child: ElevatedButton.icon(
                                                        icon: Icon(Icons.add_circle_outline),
                                                        onPressed: () {
                                                          Navigator.push(context, MaterialPageRoute(builder: (_) => AddEducationScreen()));
                                                        },
                                                        label: Text("Add education"),
                                                        style: ButtonStyle(
                                                            padding: MaterialStateProperty.all(
                                                                EdgeInsets.symmetric(
                                                                    horizontal: 16, vertical: 13)),
                                                            backgroundColor:
                                                            MaterialStateProperty.all(Colors.teal)),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                                : EducationItemWidget(
                                                  education: usePrv!
                                                      .candidate!.education![index],
                                                ),
                                        itemCount:
                                            usePrv!.candidate!.education!.length),
                                    SizedBox(height: 15,),
                                    Text("Experiences",style: TextStyle(fontSize: 20),),
                                    SizedBox(height: 15,),
                                    ListView.builder(
                                      shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) =>
                                          index == usePrv!.candidate!.experience!.length - 1
                                            ? Column(
                                              children: [
                                                ExperienceItemWidget(
                                                  experience: usePrv!
                                                      .candidate!.experience![index],
                                                ),
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: ElevatedButton.icon(
                                                    icon: Icon(Icons.add_circle_outline),
                                                    onPressed: () {
                                                      Navigator.push(context, MaterialPageRoute(builder: (_) => AddExperienceScreen()));
                                                    },
                                                    label: Text("Add experience"),
                                                    style: ButtonStyle(
                                                        padding: MaterialStateProperty.all(
                                                            EdgeInsets.symmetric(
                                                                horizontal: 16, vertical: 13)),
                                                        backgroundColor:
                                                        MaterialStateProperty.all(Colors.teal)),
                                                  ),
                                                ),
                                              ],
                                            )
                                            : ExperienceItemWidget(
                                              experience: usePrv!
                                                .candidate!.experience![index],
                                            ),
                                        itemCount:
                                            usePrv!.candidate!.education!.length),
                                  ],
                                ),
                              )
                            ]))),
                SizedBox(
                  height: 20,
                ),
                // multiSelectorDiv(
                //     title: "Categories",
                //     itemsList: _categories,
                //     selectedList: []),
                SizedBox(
                  height: screenHeight / 10,
                ),
                // multiSelectorDiv(
                //   title: "Job Skills",
                //   itemsList: _jobSkills,
                //   selectedList: usePrv!.candidate!.skills!.map((e) => JobSkills(id: e.id!, jobTitle: e.name!)).toList(),
                // ),
                categoriesCard(title: "Categories", usePrv: usePrv),
                SizedBox(
                  height: screenHeight / 20,
                ),
                skillsCard(title: "Skills", usePrv: usePrv),

                SizedBox(
                  height: screenHeight / 10,
                ),
                customSocialMediaDiv(
                    txtSkype: txtSkype,
                    txtFacebook: txtFacebook,
                    txtTwitter: txtTwitter,
                    txtInstagram: txtInstagram,
                    txtLinkedin: txtLinkedin,
                    txtGoogle: txtGoogle),
                SizedBox(
                  height: screenHeight / 10,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: Colors.grey.shade300)),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "CV Uploaded",
                                  style: TextStyle(fontSize: 18),
                                )),
                            SizedBox(
                              height: 30,
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: usePrv!.candidate!.cvs!.length,
                                itemBuilder: (context, index) {
                                  var cv = usePrv!.candidate!.cvs![index];
                                  return Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0, 0, 0, screenHeight / 30),
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: ColorConstant.gray100,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey.shade300,
                                                  blurRadius: 7,
                                                  offset: Offset(3, 3))
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 16.0, vertical: 30),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            width: 150,
                                                            child: RichText(
                                                              text: TextSpan(
                                                                  text: 'Name: ',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .blueAccent,
                                                                      fontSize:
                                                                          17),
                                                                  children: <
                                                                      TextSpan>[
                                                                    TextSpan(
                                                                      text: cv
                                                                          .media!
                                                                          .fileName,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color: Colors
                                                                              .black),
                                                                    )
                                                                  ]),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: ListTile(
                                                              contentPadding:
                                                                  EdgeInsets.zero,
                                                              onTap: () {
                                                                setState(() {
                                                                  isDefault = cv
                                                                      .media!.id;
                                                                });
                                                              },
                                                              title: const Text(
                                                                'Default: ',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .blueAccent,
                                                                    fontSize: 17),
                                                              ),
                                                              trailing: Radio(
                                                                value:
                                                                    cv.isDefault ??
                                                                        false,
                                                                onChanged: (_) {},
                                                                groupValue: true,
                                                              ),
                                                            ),
                                                          ),
                                                        ]),
                                                    Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: IconButton(
                                                        icon: Icon(
                                                          Icons.delete_outline,
                                                          color:
                                                              Colors.blueAccent,
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ]))));
                                }),
                            SizedBox(
                              height: screenHeight / 50,
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: ElevatedButton.icon(
                                icon: Icon(Icons.add_circle_outline),
                                onPressed: () {
                                  openImages();
                                },
                                label: Text("Add item"),
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 13)),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.teal)),
                              ),
                            ),
                          ]),
                    )),
                SizedBox(
                  height: screenHeight / 10,
                ),
                customImageUploadDiv(
                    title: "Your Avatar",
                    imageFile: imageFile,
                    getFromGallery: _getFromGallery),
                SizedBox(
                  height: screenHeight / 15,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      alignment: Alignment.center,
                      height: getVerticalSize(
                        56.00,
                      ),
                      width: getHorizontalSize(
                        184.00,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            16.00,
                          ),
                        ),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5.0,
                              color: Colors.grey,
                              offset: Offset(3, 3)),
                        ],
                      ),
                      child: Text(
                        "Save Changes",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorConstant.whiteA700,
                          fontSize: getFontSize(
                            16,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight / 25,
                ),
              ]),
            )));
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 330,
      maxHeight: 300,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  openImages() async {
    try {
      var pickedFiles = await imagePicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (pickedFiles != null) {
        imageFiles = pickedFiles;
        setState(() {});
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }
}

class Categories {
  final int id;
  final String jobCategory;

  Categories({required this.id, required this.jobCategory});
}

class JobSkills {
  final int id;
  final String jobTitle;

  JobSkills({required this.id, required this.jobTitle});
}

class CV {
  final int id;
  String name;

  CV({
    required this.id,
    required this.name,
  });
}
