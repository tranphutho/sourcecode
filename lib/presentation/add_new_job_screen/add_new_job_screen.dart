import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hires/core/app_export.dart';

import 'package:hires/presentation/my_profile/my_profile_widgets/custom_image_upload.dart';

import 'package:hires/models/job_model.dart';
import 'package:hires/models/resource_model.dart';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

class modelList {
  String? id;
  String? name;
  modelList({this.id, this.name});
}

class AddNewJobScreen extends StatefulWidget {
  static String id = "addNewJob";
  const AddNewJobScreen({Key? key}) : super(key: key);

  @override
  State<AddNewJobScreen> createState() => _AddNewJobScreenState();
}

class _AddNewJobScreenState extends State<AddNewJobScreen> {
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

  String hoursDWValue = "/day";
  String genderDWValue = "Male";
  String salaryDWValue = "/hourly";
  String nearestCityDWValue = "0";
  String categoryDWValue = "0";
  String jobTypeDWValue = "Full Time";
  String applyTypeDWValue = "default";
  String publishDWValue = "publish";

  bool? agreement = true;
  bool? enableUrgent = true;

  File? imageFile;

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFiles;
  Job? job;
  ResourceModel? resourceModel;
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
    txtMapZoom = TextEditingController(text: "");
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
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Add new Job",
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
                                                value: "/day",
                                              ),
                                              DropdownMenuItem(
                                                  child: Text(
                                                    "/week",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14),
                                                  ),
                                                  value: "/week"),
                                              DropdownMenuItem(
                                                child: Text(
                                                  "/month",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                ),
                                                value: "/month",
                                              ),
                                              DropdownMenuItem(
                                                child: Text(
                                                  "/year",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                ),
                                                value: "/year",
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
                                                value: "/hourly",
                                              ),
                                              DropdownMenuItem(
                                                  child: Text(
                                                    "/weekly",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14),
                                                  ),
                                                  value: "/weekly"),
                                              DropdownMenuItem(
                                                child: Text(
                                                  "/monthly",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                ),
                                                value: "/monthly",
                                              ),
                                              DropdownMenuItem(
                                                child: Text(
                                                  "/yearly",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                ),
                                                value: "/yearly",
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
                                width: 400,
                                height: 150,
                                padding: EdgeInsets.all(16.0),
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
                            SizedBox(
                              height: 30,
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
                                decoration: BoxDecoration(
                                  color: Color(0xFFD9D9D9),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                                items: _jobSkills,
                                onConfirm: (values) {})
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
                            customImageUploadDiv(
                                title: "Feature Image",
                                imageFile: imageFile,
                                getFromGallery: _getFromGallery
                            )
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
                              onTap: () {
                                job = new Job(
                                  title: txtTitle.text,
                                  content: txtContent.text,
                                  // thumbnailId:
                                );
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
                          ])))
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
      var pickedfiles = await imagePicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (pickedfiles != null) {
        imageFiles = pickedfiles;
        setState(() {});
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }
}

class JobSkills {
  final int id;
  final String jobTitle;

  JobSkills({required this.id, required this.jobTitle});
}
