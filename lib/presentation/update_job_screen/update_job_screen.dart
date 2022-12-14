import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hires/core/app_export.dart';
import 'package:hires/models/applicants_model.dart';
import 'package:hires/models/media_model.dart';

import 'package:hires/presentation/my_profile/my_profile_widgets/custom_image_upload.dart';

import 'package:hires/models/job_model.dart';
import 'package:hires/models/resource_model.dart';
import 'package:hires/services/api_urls.dart';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

import '../../models/my_job_model.dart';
import '../../models/user_model.dart';

class modelList {
  String? id;
  String? name;
  modelList({this.id, this.name});
}

class UpdateJobScreen extends StatefulWidget {
  static String id = "UpdateJobScreen";
  const UpdateJobScreen({Key? key}) : super(key: key);

  @override
  State<UpdateJobScreen> createState() => _UpdateJobScreenState();
}

class _UpdateJobScreenState extends State<UpdateJobScreen> {
  late TextEditingController txtTitle;
  late TextEditingController txtContent;
  late TextEditingController txtHours;
  late TextEditingController txtExpirationDate;
  late TextEditingController txtMaxSalary;
  late TextEditingController txtMinSalary;
  late TextEditingController txtExperience;
  late TextEditingController txtRecruitments;
  late TextEditingController txtVideoUrl;
  late TextEditingController txtLatitude;
  late TextEditingController txtLongitude;
  late TextEditingController txtMapZoom;
  MediasModel? mediasModel;

  String hoursDWValue = "day";
  String genderDWValue = "Male";
  String salaryDWValue = "hourly";
  String nearestCityDWValue = "0";
  String categoryDWValue = "0";
  String jobTypeDWValue = "Full Time";
  String applyTypeDWValue = "default";
  String publishDWValue = "publish";

  bool? agreement = true;
  bool? enableUrgent = true;
  bool? _isLoading = false;

  File? imageFile;
  File? imageVideo;

  int idVideo = 0;
  int idImage = 0;

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFiles;
  List<int>? skills;
  MyJob? job;
  ResourceModel? resourceModel;
  List<MediaModel>? mediaModel;
  MediaModel? mediaVideo;
  MediaModel? mediaFile;
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

  List<DropdownMenuItem<dynamic>>? categoryList = [
    DropdownMenuItem(
      child: Text(
        "Marketing",
        style: TextStyle(color: Colors.black),
      ),
      value: "Marketing",
    ),
    DropdownMenuItem(
        child: Text(
          "Development",
          style: TextStyle(color: Colors.black),
        ),
        value: "Development"),
    DropdownMenuItem(
      child: Text(
        "Design",
        style: TextStyle(color: Colors.black),
      ),
      value: "Design",
    ),
    DropdownMenuItem(
      child: Text(
        "Human Resources",
        style: TextStyle(color: Colors.black),
      ),
      value: "Human Resources",
    ),
    DropdownMenuItem(
      child: Text(
        "Project Management",
        style: TextStyle(color: Colors.black),
      ),
      value: "Project Management",
    )
  ];

  List<modelList> applyTypeList = [];
  List<modelList> publishList = [];

  @override
  void initState() {
    //
    txtTitle = TextEditingController(text: "");
    txtContent = TextEditingController(text: "");
    txtHours = TextEditingController(text: "");
    txtExpirationDate = TextEditingController(text: "");
    txtMaxSalary = TextEditingController(text: "");
    txtMinSalary = TextEditingController(text: "");
    txtExperience = TextEditingController(text: "");
    txtRecruitments = TextEditingController(text: "");
    txtVideoUrl = TextEditingController(text: "");
    txtLatitude = TextEditingController(text: "");
    txtLongitude = TextEditingController(text: "");
    txtMapZoom = TextEditingController(text: "3");
    resourceModel = Provider.of<ResourceModelProvider>(context, listen: false)
        .resourceModel!;
    nearestCityDWValue = resourceModel!.locations![0].id.toString();
    categoryDWValue = resourceModel!.categories![0].id.toString();
    jobTypeDWValue = resourceModel!.jobTypes![0].id.toString();

    applyTypeList.add(modelList(id: "default", name: "Default"));
    applyTypeList.add(modelList(id: "email", name: "Send email"));
    applyTypeList.add(modelList(id: "external", name: "External"));
    publishList.add(modelList(id: "publish", name: "Publish"));
    publishList.add(modelList(id: "draft", name: "Draft"));
    // setState(() {
    //   mediaModel = [];
    // });
    // setState(() {
    //   _isLoading = true;
    // });

    super.initState();
  }

  @override
  void dispose() {
    txtTitle.dispose();
    txtContent.dispose();
    txtHours.dispose();
    txtExpirationDate.dispose();
    txtMaxSalary.dispose();
    txtMinSalary.dispose();
    txtExperience.dispose();
    txtRecruitments.dispose();
    txtVideoUrl.dispose();
    txtLatitude.dispose();
    txtLongitude.dispose();
    txtMapZoom.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    job = ModalRoute.of(context)!.settings.arguments as MyJob;
    txtTitle.text = job!.title!;
    txtContent.text = job!.content!;
    txtHours.text = job!.hours!;
    hoursDWValue = job!.hoursType!;
    txtExpirationDate.text = job!.expirationDate!;
    genderDWValue = job!.gender!;
    txtMaxSalary.text = job!.salaryMax!.toString();
    txtMinSalary.text = job!.salaryMin!.toString();
    agreement = job!.wageAgreement! == 1 ? true : false;
    txtExperience.text = job!.experience!.toString();
    txtRecruitments.text = job!.numberRecruitment!.toString();
    txtVideoUrl.text = job!.video!;
    nearestCityDWValue = job!.locationId!.toString();
    txtLatitude.text = job!.mapLat!;
    txtLongitude.text = job!.mapLng!;
    txtMapZoom.text = job!.mapZoom!.toString();
    categoryDWValue = job!.categoryId!.toString();
    jobTypeDWValue = job!.jobTypeId!.toString();
    applyTypeDWValue = job!.applyType!.toString();
    agreement = int.parse(job!.isUrgent!) == 1 ? true : false;
    publishDWValue = job!.status!;

    mediasModel =
        Provider.of<MediaProvider>(context, listen: false).mediasModel!;
    if (job!.videoCoverId != null) {
      // ignore: unrelated_type_equality_checks

      mediaVideo = mediasModel!.data!.singleWhere(
          (element) => element.id == int.parse(job!.videoCoverId!),
          orElse: () => MediaModel());
      idVideo = int.parse(job!.videoCoverId!);
    }

    if (job!.thumbnailId != null) {
      // ignore: unrelated_type_equality_checks
      mediaFile = mediasModel!.data!.singleWhere(
        (element) => element.id == job!.thumbnailId!,
        orElse: () => MediaModel(),
      );
      idImage = job!.thumbnailId!;
    }

    if (job!.gallery != null && mediaModel == null) {
      dynamic idGallery = job!.gallery!.split(',');
      mediaModel = [];
      for (dynamic e in idGallery) {
        MediaModel gallery = mediasModel!.data!.singleWhere(
          (element) => element.id == int.parse(e.trim()),
          orElse: () => MediaModel(),
        );
        if (gallery.fileName != null) mediaModel!.add(gallery);
      }
    }

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Edit Job",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              SizedBox(
                height: 30,
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          color: Colors.grey,
                          offset: Offset(3, 3)),
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
                                  "Job Content",
                                  style: TextStyle(fontSize: 18),
                                )),
                            SizedBox(
                              height: 30,
                            ),
                            customColumn(
                              title: "Title",
                              controller: txtTitle,
                              maxLines: 1,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            customColumn(
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              title: "Content",
                              controller: txtContent,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Hours",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 200,
                                  child: Theme(
                                    data: ThemeData(
                                        inputDecorationTheme:
                                            InputDecorationTheme(
                                      filled: true,
                                      fillColor: Color(0xFFD9D9D9),
                                      border: OutlineInputBorder(
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
                                      controller: txtHours,
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 155,
                                  child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFAAAFB4),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(12),
                                            bottomRight: Radius.circular(
                                                12)), //border radius of dropdown button
                                      ),
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 30, right: 30),
                                          child: DropdownButton(
                                            value: hoursDWValue,
                                            items: [
                                              //add items in the dropdown
                                              DropdownMenuItem(
                                                child: Text(
                                                  "/day",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                ),
                                                value: "day",
                                              ),
                                              DropdownMenuItem(
                                                  child: Text(
                                                    "/week",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14),
                                                  ),
                                                  value: "week"),
                                              DropdownMenuItem(
                                                child: Text(
                                                  "/month",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                ),
                                                value: "month",
                                              ),
                                              DropdownMenuItem(
                                                child: Text(
                                                  "/year",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                ),
                                                value: "year",
                                              ),
                                            ],
                                            onChanged: (value) {
                                              //get value when changed
                                              setState(() {
                                                hoursDWValue = value.toString();
                                              });
                                            },
                                            icon: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20),
                                                child: Icon(
                                                    Icons.arrow_drop_down)),
                                            style: TextStyle(fontSize: 16),
                                            dropdownColor: Color(
                                                0xFFD9D9D9), //dropdown background color
                                            underline:
                                                Container(), //remove underline
                                            isExpanded:
                                                true, //make true to make width 100%
                                          ))),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Expiration date",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 50,
                                      width: 150,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            fillColor: Color(0xFFD9D9D9),
                                            hintText: "YYYY-MM-DD"),
                                        controller:
                                            txtExpirationDate, //editing controller of this TextField
                                        readOnly:
                                            true, //set it true, so that user will not able to edit text
                                        onTap: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(
                                                      2000), //DateTime.now() - not to allow to choose before today.
                                                  lastDate: DateTime(2101));
                                          if (pickedDate != null) {
                                            String formattedDate =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(pickedDate);
                                            setState(() {
                                              txtExpirationDate.text =
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                        alignment: Alignment.topRight,
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
                                      width: 150,
                                      child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            color: Color(0xFFD9D9D9),
                                            borderRadius: BorderRadius.circular(
                                                15), //border raiuds of dropdown button
                                          ),
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 30, right: 30),
                                              child: DropdownButton(
                                                value: genderDWValue,
                                                items: [
                                                  //add items in the dropdown
                                                  DropdownMenuItem(
                                                    child: Text(
                                                      "Male",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    value: "Male",
                                                  ),
                                                  DropdownMenuItem(
                                                      child: Text(
                                                        "Female",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      value: "Female"),
                                                  DropdownMenuItem(
                                                    child: Text(
                                                      "Others",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    value: "Others",
                                                  )
                                                ],
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

                                                dropdownColor: Color(
                                                    0xFFD9D9D9), //dropdown background color
                                                underline:
                                                    Container(), //remove underline
                                                isExpanded:
                                                    true, //make true to make width 100%
                                              ))),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Salary",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 100,
                                  child: Theme(
                                    data: ThemeData(
                                        inputDecorationTheme:
                                            InputDecorationTheme(
                                                filled: true,
                                                fillColor: Color(0xFFD9D9D9),
                                                border: OutlineInputBorder(
                                                  borderSide:
                                                      BorderSide(width: 1),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  12),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  12)),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: ColorConstant
                                                          .teal600),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  12),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  12)),
                                                ))),
                                    child: TextField(
                                      controller: txtMaxSalary,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: "Max",
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 100,
                                  child: Theme(
                                    data: ThemeData(
                                        inputDecorationTheme:
                                            InputDecorationTheme(
                                      filled: true,
                                      fillColor: Color(0xFFD9D9D9),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(width: 1)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorConstant.teal600),
                                      ),
                                    )),
                                    child: TextField(
                                      controller: txtMinSalary,
                                      keyboardType: TextInputType.number,
                                      decoration:
                                          InputDecoration(hintText: "Min"),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 155,
                                  child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFAAAFB4),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(12),
                                            bottomRight: Radius.circular(
                                                12)), //border radius of dropdown button
                                      ),
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 30, right: 30),
                                          child: DropdownButton(
                                            value: salaryDWValue,
                                            items: [
                                              //add items in the dropdown
                                              DropdownMenuItem(
                                                child: Text(
                                                  "/hourly",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                ),
                                                value: "hourly",
                                              ),
                                              DropdownMenuItem(
                                                  child: Text(
                                                    "/weekly",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14),
                                                  ),
                                                  value: "weekly"),
                                              DropdownMenuItem(
                                                child: Text(
                                                  "/monthly",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                ),
                                                value: "monthly",
                                              ),
                                              DropdownMenuItem(
                                                child: Text(
                                                  "/yearly",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                ),
                                                value: "yearly",
                                              ),
                                            ],
                                            onChanged: (value) {
                                              //get value when changed
                                              setState(() {
                                                salaryDWValue =
                                                    value.toString();
                                              });
                                            },
                                            icon: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20),
                                                child: Icon(
                                                    Icons.arrow_drop_down)),
                                            style: TextStyle(fontSize: 16),
                                            dropdownColor: Color(
                                                0xFFD9D9D9), //dropdown background color
                                            underline:
                                                Container(), //remove underline
                                            isExpanded:
                                                true, //make true to make width 100%
                                          ))),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: agreement,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      print(value);
                                      agreement = value!;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Wage agreement",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            customRow(
                                title1: "Experience",
                                hint1: "Year(s)",
                                hint2: "0",
                                title2: "No. of recruitments",
                                controller1: txtExperience,
                                controller2: txtRecruitments,
                                keyboardType1: TextInputType.number,
                                keyboardType2: TextInputType.number),
                            SizedBox(
                              height: 20,
                            ),
                            customColumn(
                                title: "View url",
                                controller: txtVideoUrl,
                                hint: "Youtube video link"),
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
                                width: getHorizontalSize(400),
                                height: getVerticalSize(345),
                                padding: EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xFFD9D9D9)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 210,
                                      width: 210,
                                      child: InkWell(
                                        onTap: () async {
                                          print("B???m v??o ????y");

                                          File file = await _getFromGallery();
                                          if (file != null)
                                            setState(() {
                                              imageVideo = file;
                                            });
                                        },
                                        child: (!_isLoading!)
                                            ? imageVideo != null
                                                ? Image.file(
                                                    imageVideo!,
                                                    fit: BoxFit.fill,
                                                  )
                                                : job!.videoCoverId != null &&
                                                        mediaVideo!.filePath !=
                                                            null
                                                    ? Image.network(
                                                        Api_Url.BASE_URL_IMAGE +
                                                            mediaVideo!
                                                                .filePath!,
                                                        fit: BoxFit.fill,
                                                      )
                                                    : Container(
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: ColorConstant
                                                              .gray100,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            getHorizontalSize(
                                                              12.00,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                            child: Text(
                                                                "Choose Imgage",
                                                                style:
                                                                    TextStyle(
                                                                  color: ColorConstant
                                                                      .teal600,
                                                                  fontSize:
                                                                      getFontSize(
                                                                    20,
                                                                  ),
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ))))
                                            : Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: ColorConstant.gray100,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    getHorizontalSize(
                                                      12.00,
                                                    ),
                                                  ),
                                                ),
                                                child: Center(
                                                    child: Text("Choose Imgage",
                                                        style: TextStyle(
                                                          color: ColorConstant
                                                              .teal600,
                                                          fontSize: getFontSize(
                                                            20,
                                                          ),
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )))),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          // setState(() {
                                          //   imageFile = null;
                                          // });
                                          // rovider.of<UserProvider>(context, listen: false)
                                          idVideo =
                                              (await Provider.of<UserProvider>(
                                                      context,
                                                      listen: false)
                                                  .postMedia(imageVideo!))!;
                                        },
                                        child: const Text("Upload image"),
                                      ),
                                    )
                                  ],
                                )),
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
                                    onPressed: () async {
                                      dynamic result =
                                          await _openMedia(context);
                                      if (result != null)
                                        setState(() {
                                          mediaModel!.addAll(result);
                                        });
                                      //print(result);
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
                                  Builder(builder: (context) {
                                    if (mediaModel == null)
                                      return Container(
                                        height: 150,
                                      );
                                    else
                                      return Container(
                                        height: 150,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: mediaModel!.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                                child: Stack(
                                              children: [
                                                Container(
                                                  height: 150,
                                                  width: 150,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Color(
                                                              0xFFD9D9D9)),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  12))),
                                                  child: Container(
                                                    height: getSize(300),
                                                    width: getSize(300),
                                                    child: Image.network(
                                                        Api_Url.BASE_URL_IMAGE +
                                                            mediaModel![index]
                                                                .filePath!,
                                                        fit: BoxFit.fill),
                                                  ),
                                                ),
                                                Container(
                                                  width: 150,
                                                  alignment: Alignment.topRight,
                                                  child: IconButton(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    icon: Icon(
                                                        CupertinoIcons.delete,
                                                        color: Colors.red),
                                                    onPressed: () {
                                                      setState(() {
                                                        mediaModel!.remove(
                                                            mediaModel![index]);
                                                      });
                                                    },
                                                  ),
                                                )
                                              ],
                                            ));
                                          },
                                        ),
                                      );
                                  }),
                                ],
                              ),
                            ),
                          ]))),
              SizedBox(
                height: 30,
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          color: Colors.grey,
                          offset: Offset(3, 3)),
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
                                  "Job Location",
                                  style: TextStyle(fontSize: 18),
                                )),
                            SizedBox(
                              height: 30,
                            ),
                            dropDownDiv(
                              title: "Nearest city",
                              dropDownVal: nearestCityDWValue,
                              dropDownList: resourceModel!.locations!,
                              name: "name",
                              onChange: (value) {
                                setState(() {
                                  nearestCityDWValue = value.toString();
                                });
                              },
                            ),
                            // Align(
                            //     alignment: Alignment.topLeft,
                            //     child: Text(
                            //       "Nearest city",
                            //       style: TextStyle(
                            //           fontSize: 14,
                            //           fontWeight: FontWeight.bold),
                            //     )),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // DecoratedBox(
                            //     decoration: BoxDecoration(
                            //       color: Color(0xFFD9D9D9),
                            //       borderRadius: BorderRadius.circular(
                            //           15), //border raiuds of dropdown button
                            //     ),
                            //     child: Padding(
                            //         padding:
                            //             EdgeInsets.only(left: 30, right: 30),
                            //         child: //nearestCityDWValue
                            //             DropdownButton<String>(
                            //           value: nearestCityDWValue,
                            //           selectedItemBuilder: (context) =>
                            //               resourceModel!.locations!
                            //                   .map<Widget>((e) => Container(
                            //                       alignment:
                            //                           Alignment.centerLeft,
                            //                       constraints:
                            //                           const BoxConstraints(
                            //                               minWidth: 100),
                            //                       child: Text(
                            //                         e.name!,
                            //                         style: TextStyle(
                            //                           color: Colors.black,
                            //                         ),
                            //                       )))
                            //                   .toList(),
                            //           items: resourceModel!.locations!
                            //               .map<DropdownMenuItem<String>>(
                            //                   (e) => DropdownMenuItem<String>(
                            //                         value: e.id.toString(),
                            //                         child: Text(
                            //                           e.name!,
                            //                           style: TextStyle(
                            //                               color: Colors.black),
                            //                         ),
                            //                       ))
                            //               .toList(),
                            //           // [
                            //           //add items in the dropdown
                            //           // DropdownMenuItem(
                            //           //   child: Text(
                            //           //     "Delhi",
                            //           //     style:
                            //           //         TextStyle(color: Colors.black),
                            //           //   ),
                            //           //   value: "Delhi",
                            //           // ),
                            //           // ],
                            //           onChanged: (value) {
                            //             //get value when changed
                            //             setState(() {
                            //               nearestCityDWValue = value.toString();
                            //             });
                            //           },
                            //           icon: Padding(
                            //               padding: EdgeInsets.only(left: 20),
                            //               child: Icon(Icons.arrow_drop_down)),
                            //           style: TextStyle(fontSize: 16),

                            //           dropdownColor: Color(
                            //               0xFFD9D9D9), //dropdown background color
                            //           underline: Container(), //remove underline
                            //           isExpanded:
                            //               true, //make true to make width 100%
                            //         ))),
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
                              decoration: BoxDecoration(
                                color: Color(0xFFD9D9D9),
                              ),
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
                height: 50,
              ),
              dropDownDiv(
                title: "Category",
                dropDownVal: categoryDWValue,
                dropDownList: resourceModel!.categories!,
                name: "name",
                onChange: (value) {
                  setState(() {
                    categoryDWValue = value.toString();
                  });
                },
              ),
              SizedBox(
                height: 50,
              ),
              // dropDownDiv(
              //   title: "Job Type",
              //   dropDownVal: jobTypeDWValue,
              //   dropDownList: jobTypeList,
              // ),
              dropDownDiv(
                title: "Job Type",
                dropDownVal: jobTypeDWValue,
                dropDownList: resourceModel!.jobTypes!,
                name: "name",
                onChange: (value) {
                  setState(() {
                    jobTypeDWValue = value.toString();
                  });
                },
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          color: Colors.grey,
                          offset: Offset(3, 3)),
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
                                  "Job Skills",
                                  style: TextStyle(fontSize: 18),
                                )),
                            SizedBox(
                              height: 30,
                            ),
                            MultiSelectDialogField(
                                initialValue: job!.jobSkills!,
                                decoration: BoxDecoration(
                                  color: Color(0xFFD9D9D9),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                                items: resourceModel!.skills!
                                    .map((e) =>
                                        MultiSelectItem<int>(e!.id!, e.name!))
                                    .toList(),
                                onConfirm: (values) {
                                  skills = values as List<int>;
                                })
                          ]))),
              SizedBox(
                height: 50,
              ),
              // dropDownDiv(
              //   title: "Apply Type",
              //   dropDownVal: applyTypeDWValue,
              //   dropDownList: applyTypeList,
              // ),
              dropDownDiv(
                title: "Apply Type",
                dropDownVal: applyTypeDWValue,
                dropDownList: applyTypeList,
                name: "name",
                onChange: (value) {
                  setState(() {
                    applyTypeDWValue = value.toString();
                  });
                },
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          color: Colors.grey,
                          offset: Offset(3, 3)),
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
                                  "Availability",
                                  style: TextStyle(fontSize: 18),
                                )),
                            SizedBox(
                              height: 30,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Job urgent",
                                  style: TextStyle(fontSize: 15),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: enableUrgent,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      enableUrgent = value!;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Enable urgent",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                )
                              ],
                            ),
                          ]))),
              SizedBox(
                height: 50,
              ),
              Container(
                  // padding: const EdgeInsets.all(18.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    //   customImageUploadDiv(
                    //       title: "Feature Image",
                    //       imageFile: imageFile,
                    //       getFromGallery: _getFromGallery),
                    // SizedBox(
                    //   height: 50,
                    // ),
                    Container(
                      height: getVerticalSize(
                        380.00,
                      ),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5.0,
                                color: Colors.grey,
                                offset: Offset(3, 3))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Feature Image",
                                    style: TextStyle(fontSize: 18),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 210,
                                width: 210,
                                child: InkWell(
                                  onTap: () async {
                                    print("B???m v??o ????y");
                                    File file = await _getFromGallery();
                                    if (file != null)
                                      setState(() {
                                        imageFile = file;
                                      });
                                  },
                                  child: imageFile != null
                                      ? Image.file(
                                          imageFile!,
                                          fit: BoxFit.fill,
                                        )
                                      : job!.thumbnailId != null &&
                                              mediaFile!.filePath != null
                                          ? Image.network(
                                              Api_Url.BASE_URL_IMAGE +
                                                  mediaFile!.filePath!,
                                              fit: BoxFit.fill,
                                            )
                                          : Container(
                                              // width: 40,
                                              // height: 10,
                                              // color: Colors.amber,
                                              alignment: Alignment.center,
                                              // height: getVerticalSize(
                                              //   90.00,
                                              // ),
                                              // width: getHorizontalSize(
                                              //   263.00,
                                              // ),
                                              decoration: BoxDecoration(
                                                color:
                                                    // isDark
                                                    //     ? ColorConstant.darkbutton
                                                    //     :
                                                    ColorConstant.gray100,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  getHorizontalSize(
                                                    12.00,
                                                  ),
                                                ),
                                              ),
                                              child: Center(
                                                  child: Text("Choose Imgage",
                                                      style: TextStyle(
                                                        color: ColorConstant
                                                            .teal600,
                                                        fontSize: getFontSize(
                                                          20,
                                                        ),
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      )))),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    // setState(() {
                                    //   imageFile = null;
                                    // });
                                    // rovider.of<UserProvider>(context, listen: false)
                                    idImage = (await Provider.of<UserProvider>(
                                            context,
                                            listen: false)
                                        .postMedia(imageFile!))!;
                                  },
                                  child: const Text("Upload image"),
                                ),
                              )
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    // dropDownDiv(
                    //     title: "Publish",
                    //     dropDownVal: publishDWValue,
                    //     dropDownList: publishList),
                    dropDownDiv(
                      title: "Publish",
                      dropDownVal: publishDWValue,
                      dropDownList: publishList,
                      name: "name",
                      onChange: (value) {
                        setState(() {
                          publishDWValue = value.toString();
                        });
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () async {
                        job = new MyJob(
                            id: job!.id!,
                            title: txtTitle.text,
                            content: txtContent.text,
                            thumbnailId: idImage,
                            categoryId: int.parse(categoryDWValue),
                            locationId: int.parse(nearestCityDWValue),
                            jobTypeId: int.parse(jobTypeDWValue),
                            expirationDate: txtExpirationDate.text,
                            hours: txtHours.text,
                            hoursType: hoursDWValue,
                            salaryMin: txtMinSalary.text.length > 0
                                ? int.parse(txtMinSalary.text)
                                : null,
                            salaryMax: txtMaxSalary.text.length > 0
                                ? int.parse(txtMaxSalary.text)
                                : null,
                            salaryType: salaryDWValue,
                            gender: genderDWValue,
                            mapLat: txtLatitude.text,
                            mapLng: txtLongitude.text,
                            mapZoom: txtMapZoom.text.length > 0
                                ? int.parse(txtMapZoom.text)
                                : null,
                            experience: txtExperience.text.length > 0
                                ? int.parse(txtExperience.text)
                                : null,
                            isFeatured: 1,
                            isUrgent: enableUrgent! ? "1" : "0",
                            status: publishDWValue,
                            applyType: applyTypeDWValue,
                            applyLink: "",
                            applyEmail: "",
                            wageAgreement: agreement! ? 1 : 0,
                            gallery: mediaModel != null
                                ? mediaModel!.map((e) {
                                    return "${e.id!.toString()}";
                                  }).toString()
                                : "",
                            video: txtVideoUrl.text,
                            videoCoverId: idVideo.toString(),
                            numberRecruitment: txtRecruitments.text.length > 0
                                ? int.parse(txtRecruitments.text)
                                : null,
                            jobSkills: skills != null ? skills : null
                            // thumbnailId:
                            );
                        print(job);

                        await Provider.of<MyJobProvider>(context, listen: false)
                            .createUpdateJob(job!);
                      },
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
                      height: 20,
                    ),
                  ]))
            ])));
  }

  dropDownDiv(
      {final title,
      final dropDownVal,
      required List<dynamic> dropDownList,
      required String name,
      required ValueChanged onChange}) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
                blurRadius: 5.0, color: Colors.grey, offset: Offset(3, 3)),
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
                        title,
                        style: TextStyle(fontSize: 18),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  DecoratedBox(
                      decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(
                            15), //border raiuds of dropdown button
                      ),
                      child: Padding(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: DropdownButton<String>(
                            value: dropDownVal,
                            //selectedItemBuilder: dropDownList.map((e) => null),
                            selectedItemBuilder: (context) => dropDownList
                                .map<Widget>((e) => Container(
                                      alignment: Alignment.centerLeft,
                                      constraints:
                                          const BoxConstraints(minWidth: 100),
                                      child: Text(
                                        e.name,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ))
                                .toList(),
                            items: dropDownList
                                .map<DropdownMenuItem<String>>(
                                    (e) => DropdownMenuItem<String>(
                                        value: e.id.toString(),
                                        child: Text(
                                          e.name,
                                          style: TextStyle(color: Colors.black),
                                        )))
                                .toList(),
                            // onChanged: (value) {
                            //   //get value when changed
                            //   setState(() {
                            //     categoryDWValue = value.toString();
                            //   });
                            // },
                            onChanged: onChange,
                            icon: Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Icon(Icons.arrow_drop_down)),
                            style: TextStyle(fontSize: 16),
                            dropdownColor:
                                Color(0xFFD9D9D9), //dropdown background color
                            underline: Container(), //remove underline
                            isExpanded: true, //make true to make width 100%
                          ))),
                ])));
  }

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
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: height,
          width: width,
          child: TextFormField(
            style: TextStyle(color: Colors.black),
            maxLines: maxLines,
            keyboardType: keyboardType,
            controller: controller,
            decoration: InputDecoration(
              fillColor: Color(0xFFD9D9D9),
              contentPadding: EdgeInsets.all(18),
              hintText: hint,
              hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.bold),
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
    final controller2,
    final keyboardType1,
    final keyboardType2,
  }) {
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
          keyboardType: keyboardType1,
        ),
        customColumn(
          title: title2,
          height: 50.0,
          width: 150.0,
          hint: hint2,
          controller: controller2,
          maxLines: 1,
          keyboardType: keyboardType2,
        ),
      ],
    );
  }

  Future<File> _getFromGallery() async {
    File? file;
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 330,
      maxHeight: 300,
    );
    if (pickedFile != null) {
      file = File(pickedFile.path);
    }
    return file!;
  }

  Future<dynamic> _openMedia(BuildContext context) async {
    // try {
    //   var pickedfiles = await imagePicker.pickMultiImage();
    //   //you can use ImageCourse.camera for Camera capture
    //   if (pickedfiles != null) {
    //     imageFiles = pickedfiles;
    //     setState(() {});
    //   } else {
    //     print("No image is selected.");
    //   }
    // } catch (e) {
    //   print("error while picking file.");
    // }
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectionScreen()),
    );

    // When a BuildContext is used from a StatefulWidget, the mounted property
    // must be checked after an asynchronous gap.
    if (!mounted) return "";

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    return result;
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result')));
  }
}

class SelectionScreen extends StatefulWidget {
  SelectionScreen({key});
  @override
  _SelectionScreen createState() => _SelectionScreen();
}

class _SelectionScreen extends State<SelectionScreen> {
  // final List<Map<String, String>> anh = [
  //   {"id": "1", "anh": "???nh 1"},
  //   {"id": "2", "anh": "???nh 2"},
  //   {"id": "3", "anh": "???nh 3"},
  //   {"id": "4", "anh": "???nh 4"},
  //   {"id": "5", "anh": "???nh 5"},
  //   {"id": "6", "anh": "???nh 6"},
  //   {"id": "7", "anh": "???nh 7"},
  //   {"id": "8", "anh": "???nh 8"},
  // ];
  late List<MediaModel>? ds = [];
  MediasModel? mediasModel;
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _isLoading = true;
    });
    Provider.of<MediaProvider>(context, listen: false)
        .getMediaImage()
        .then((value) {
      mediasModel =
          Provider.of<MediaProvider>(context, listen: false).mediasModel!;
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose File From Your Gallery'),
      ),
      bottomNavigationBar: BottomAppBar(
          child: ElevatedButton.icon(
        icon: Icon(Icons.add_circle_outline),
        onPressed: () async {
          // dynamic result =
          //     await _openMedia(context);
          // print(result);
          Navigator.pop(context, ds);
        },
        label: Text("Choose File"),
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(horizontal: 16, vertical: 13)),
            backgroundColor: MaterialStateProperty.all(Colors.teal)),
      )),
      body: Builder(builder: (context) {
        if (_isLoading)
          return Center(
            child: CircularProgressIndicator(),
          );
        else
          return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: mediasModel!.data!.length,
                itemBuilder: (context, index) => Container(
                  height: 330,
                  child: InkWell(
                    onTap: () {
                      if (ds!.contains(mediasModel!.data![index])) {
                        setState(() {
                          ds!.remove(mediasModel!.data![index]);
                        });
                      } else {
                        setState(() {
                          ds!.add(mediasModel!.data![index]);
                        });
                      }
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Checkbox(
                            value: ds!.contains(mediasModel!.data![index]),
                            onChanged: (value) {
                              if (value!) {
                                setState(() {
                                  ds!.add(mediasModel!.data![index]);
                                });
                              } else {
                                setState(() {
                                  ds!.remove(mediasModel!.data![index]);
                                });
                              }
                            },
                          ),
                          Column(
                            children: [
                              Container(
                                height: 300,
                                width: 330,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xFFD9D9D9)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                child: Container(
                                  height: getSize(300),
                                  width: getSize(300),
                                  child: Image.network(
                                      Api_Url.BASE_URL_IMAGE +
                                          mediasModel!.data![index].filePath!,
                                      fit: BoxFit.fill),
                                ),
                              ),
                              // Text(
                              //   mediasModel!.data![index].fileName.toString(),
                              //   overflow: TextOverflow.clip,
                              //   style: TextStyle(
                              //       fontSize: 15,
                              //       color: Colors.black.withOpacity(0.5),
                              //       fontWeight: FontWeight.bold),
                              // )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
              // Center(
              //   child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              //     // ListView(
              //     //   children: [
              //     //     Container(
              //     //       height: 100,
              //     //       width: 300,
              //     //       child: Row(
              //     //         children: [
              //     //           Checkbox(
              //     //             value: false,
              //     //             onChanged: (value) {},
              //     //           ),
              //     //           SizedBox(
              //     //             height: 10,
              //     //           ),
              //     //           Container(
              //     //             width: 50,
              //     //             height: 50,
              //     //             child: Image.asset("assets/images/gallery_image.png"),
              //     //           )
              //     //         ],
              //     //       ),
              //     //     ),
              //     //     Container(
              //     //       height: 100,
              //     //       width: 300,
              //     //       child: Row(
              //     //         children: [
              //     //           Checkbox(
              //     //             value: false,
              //     //             onChanged: (value) {},
              //     //           ),
              //     //           SizedBox(
              //     //             height: 10,
              //     //           ),
              //     //           Container(
              //     //             width: 50,
              //     //             height: 50,
              //     //             child: Image.asset("assets/images/gallery_image.png"),
              //     //           )
              //     //         ],
              //     //       ),
              //     //     )
              //     //   ],
              //     // )

              );
      }),
    );
  }
}

class JobSkills {
  final int id;
  final String jobTitle;

  JobSkills({required this.id, required this.jobTitle});
}
