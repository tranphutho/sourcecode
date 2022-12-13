import 'dart:io';

import 'package:flutter/material.dart';

import 'package:hires/models/resource_model.dart';
import 'package:hires/services/api_urls.dart';

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/math_utils.dart';
import '../../models/user_model.dart';

class CompanyProfile extends StatefulWidget {
  static String id = "ProfileStyle2Screen";
  @override
  State<CompanyProfile> createState() => _CompanyProfileState();
}

class _CompanyProfileState extends State<CompanyProfile> {
  bool upload = true;
  bool uploading = false;
  bool uploaded = false;

  int idMedia = 0;
  bool allowSearch = true;

  late TextEditingController txtEmail;
  late TextEditingController txtName;
  late TextEditingController txtWebSite;
  late TextEditingController txtAddress;
  late TextEditingController txtFoundIn;
  late TextEditingController txtPhone;
  late TextEditingController txtCity;
  late TextEditingController txtState;
  late TextEditingController txtCountry;
  late TextEditingController txtZipcode;
  late TextEditingController txtAboutCompany;
  late TextEditingController txtLatitude;
  late TextEditingController txtLongitude;
  late TextEditingController txtMapZoom;
  late TextEditingController txtSkype;
  late TextEditingController txtFacebook;
  late TextEditingController txtTwitter;
  late TextEditingController txtInstagram;
  late TextEditingController txtLinkedin;
  late TextEditingController txtGoogle;

  late String txtCategory;

  File? imageFile;

  String publishDWValue = "Draft";
  var companySizeDWValue;
  String categoryDWValue = "1";
  String categoryId = "AF";
  String nearestCityDWValue = "0";
  String country = "";
  ResourceModel? resourceModel;
  Map? countries;
  UserModel? usePrv;
  @override
  void initState() {
    super.initState();

    txtEmail = TextEditingController(text: '');
    txtName = TextEditingController(text: '');
    txtWebSite = TextEditingController(text: '');
    txtAddress = TextEditingController(text: '');
    txtFoundIn = TextEditingController(text: '');
    txtPhone = TextEditingController(text: '');
    txtCity = TextEditingController(text: '');
    txtState = TextEditingController(text: '');
    txtCountry = TextEditingController(text: '');
    txtZipcode = TextEditingController(text: '');
    txtAboutCompany = TextEditingController(text: '');
    txtLatitude = TextEditingController(text: '');
    txtLongitude = TextEditingController(text: '');
    txtMapZoom = TextEditingController(text: '');
    txtTwitter = TextEditingController(text: '');
    txtFacebook = TextEditingController(text: '');
    txtSkype = TextEditingController(text: '');
    txtLinkedin = TextEditingController(text: '');
    txtInstagram = TextEditingController(text: '');
    txtGoogle = TextEditingController(text: '');
    Provider.of<ResourceModelProvider>(context, listen: false).init();
    usePrv = Provider.of<UserProvider>(context, listen: false).userApp!;
    resourceModel = Provider.of<ResourceModelProvider>(context, listen: false)
        .resourceModel!;
    countries =
        Provider.of<ResourceModelProvider>(context, listen: false).countries!;
    if (usePrv!.company != null) {
      txtName.text = usePrv!.company!.name ?? "";
      txtEmail.text = usePrv!.company!.email ?? "";
      txtWebSite.text = usePrv!.company!.website ?? "";
      txtPhone.text = usePrv!.company!.phone ??= "";
      txtFoundIn.text = usePrv!.company!.foundedIn ?? "";
      txtAddress.text = usePrv!.company!.address ?? "";
      txtCity.text = usePrv!.company!.city ?? "";
      txtState.text = usePrv!.company!.state ?? "";

      txtZipcode.text = usePrv!.company!.zipCode.toString() ?? "";
      txtAboutCompany.text = usePrv!.company!.about.toString() ?? "";
      txtLatitude.text = usePrv!.company!.mapLat ?? "";
      txtLongitude.text = usePrv!.company!.mapLng ?? "";
      txtMapZoom.text = "";
      txtSkype.text = usePrv!.company!.socialMedia?.skype ?? "";
      txtFacebook.text = usePrv!.company!.socialMedia?.facebook ?? "";
      txtTwitter.text = usePrv!.company!.socialMedia?.twitter ?? "";
      txtInstagram.text = usePrv!.company!.socialMedia?.instagram ?? "";
      txtLinkedin.text = usePrv!.company!.socialMedia?.linkedin ?? "";
      txtGoogle.text = usePrv!.company!.socialMedia?.google ?? "";
      nearestCityDWValue = usePrv!.company!.locationId.toString();
      categoryDWValue = usePrv!.company!.categoryId.toString();
      // companySizeDWValue = usePrv!.company!.teamSize.toString();
      publishDWValue = usePrv!.company!.status!;
      country = usePrv!.company!.country ?? "";
      if (usePrv!.company!.allowSearch == 1)
        allowSearch = true;
      else
        allowSearch = false;
      //imageFile = File(path)
    }
  }

  @override
  void dispose() {
    super.dispose();
    txtEmail.dispose();
    txtName.dispose();
    txtWebSite.dispose();
    txtAddress.dispose();
    txtFoundIn.dispose();
    txtPhone.dispose();
    txtCity.dispose();
    txtState.dispose();
    txtCountry.dispose();
    txtZipcode.dispose();
    txtAboutCompany.dispose();
    txtLatitude.dispose();
    txtLongitude.dispose();
    txtMapZoom.dispose();
    txtSkype.dispose();
    txtFacebook.dispose();
    txtTwitter.dispose();
    txtInstagram.dispose();
    txtLinkedin.dispose();
    txtGoogle.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Company Info",
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
                          "Company Content",
                          style: TextStyle(fontSize: 18),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    customRow(
                        title1: "Company name",
                        //hint1: "Netflix",
                        controller1: txtName,
                        title2: "Company email",
                        //hint2: "Email",
                        controller2: txtEmail),

                    SizedBox(
                      height: 20,
                    ),
                    customRow(
                        title1: "Phone Number",

                        //hint1: "987654321",
                        controller1: txtPhone,
                        title2: "Website",
                        //hint2: "Website",

                        controller2: txtWebSite),
                    SizedBox(
                      height: 20,
                    ),
                    customRow(
                        title1: "Est. since",

                        //hint1: "12/10/1200",
                        controller1: txtFoundIn,
                        title2: "Address",
                        //hint2: "Bannu",

                        controller2: txtAddress),
                    SizedBox(
                      height: 20,
                    ),
                    customRow(
                        title1: "City",

                        //hint1: "Bannu",
                        controller1: txtCity,
                        title2: "State",
                        //hint2: "Pakistan",

                        controller2: txtState),
                    SizedBox(
                      height: 20,
                    ),

                    // customRow(
                    //     title1: "Country",
                    //     //hint1: "--select--",
                    //     controller1: txtCountry,
                    //     title2: "Zip code",
                    //     //hint2: "1234",
                    //     controller2: txtZipcode),
                    Row(
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
                              width: 150,
                              child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.circular(
                                        15), //border raiuds of dropdown button
                                  ),
                                  child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 30, right: 5),
                                      child: DropdownButton<String>(
                                        value: country,
                                        selectedItemBuilder:
                                            (BuildContext context) {
                                          return countries!.values
                                              .map<Widget>((value) {
                                            return Container(
                                                alignment: Alignment.centerLeft,
                                                constraints:
                                                    const BoxConstraints(
                                                        minWidth: 100),
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ));
                                          }).toList();
                                        },
                                        items: countries!.keys
                                            .map<DropdownMenuItem<String>>(
                                                (item) {
                                          return DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(countries![item],
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          //get value when changed
                                          setState(() {
                                            country = value.toString();
                                          });
                                        },
                                        icon: Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Icon(Icons.arrow_drop_down)),
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
                        customColumn(
                          title: "Zip code",
                          height: 50.0,
                          width: 150.0,
                          //hint: hint2,
                          controller: txtZipcode,
                          maxLines: 1,
                          keyboardType: TextInputType.text,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 20,
                          width: 30,
                          alignment: Alignment.center,
                          child: Checkbox(
                            value: allowSearch,
                            onChanged: (value) {
                              setState(() {
                                allowSearch = value!;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Allow in search and listing",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    customColumn(
                        controller: txtAboutCompany,
                        title: "About company",
                        maxLines: null,
                        keyboardType: TextInputType.multiline)
                  ],
                ),
              ),
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
                                "Company Location",
                                style: TextStyle(fontSize: 18),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Nearest city",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                            height: 10,
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
                                    value: nearestCityDWValue,
                                    selectedItemBuilder:
                                        (BuildContext context) {
                                      return resourceModel!.locations!
                                          .map<Widget>((item) {
                                        return Container(
                                            alignment: Alignment.centerLeft,
                                            constraints: const BoxConstraints(
                                                minWidth: 100),
                                            child: Text(
                                              item.name!,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ));
                                      }).toList();
                                    },
                                    items: resourceModel!.locations!
                                        .map<DropdownMenuItem<String>>((item) {
                                      return DropdownMenuItem<String>(
                                        value: item.id.toString(),
                                        child: Text(item.name!,
                                            style:
                                                TextStyle(color: Colors.black)),
                                      );
                                    }).toList(),
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

                                    dropdownColor: Color(
                                        0xFFD9D9D9), //dropdown background color
                                    underline: Container(), //remove underline
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
                                    fontSize: 14, fontWeight: FontWeight.bold),
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
                                "Categories",
                                style: TextStyle(fontSize: 18),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          // DecoratedBox(
                          //     decoration: BoxDecoration(
                          //       color: Color(0xFFD9D9D9),
                          //       borderRadius: BorderRadius.circular(
                          //           15), //border raiuds of dropdown button
                          //     ),
                          //     child: Padding(
                          //         padding: EdgeInsets.only(left: 30, right: 30),
                          //         child: DropdownButton<String>(
                          //           value: categoryDWValue,
                          //           selectedItemBuilder:
                          //               (BuildContext context) {
                          //             return resourceModel!.categories!
                          //                 .map<Widget>((item) {
                          //               return Container(
                          //                   alignment: Alignment.centerLeft,
                          //                   constraints: const BoxConstraints(
                          //                       minWidth: 100),
                          //                   child: Text(
                          //                     item.name!,
                          //                     style: TextStyle(
                          //                         color: Colors.black),
                          //                   ));
                          //             }).toList();
                          //           },
                          //           items: resourceModel!.categories!
                          //               .map<DropdownMenuItem<String>>((item) {
                          //             return DropdownMenuItem<String>(
                          //                 value: item.id!.toString(),
                          //                 child: Text(item.name!,
                          //                     style: TextStyle(
                          //                         color: Colors.black)));
                          //           }).toList(),
                          //           onChanged: (value) {
                          //             //get value when changed
                          //
                          //             setState(() {
                          //               categoryDWValue = value.toString();
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
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Company Size",
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
                                    value: companySizeDWValue,
                                    selectedItemBuilder: (context) {
                                      return resourceModel!.terms!.map<Widget>(
                                        (e) {
                                          return Container(
                                              alignment: Alignment.centerLeft,
                                              constraints: const BoxConstraints(
                                                  minWidth: 100),
                                              child: Text(
                                                e.name!,
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ));
                                        },
                                      ).toList();
                                    },
                                    items: resourceModel!.terms!
                                        .map<DropdownMenuItem<String>>((e) {
                                      return DropdownMenuItem<String>(
                                          value: e.id!.toString(),
                                          child: Text(
                                            e.name!,
                                            style:
                                                TextStyle(color: Colors.black),
                                          ));
                                    }).toList(),
                                    onChanged: (value) {
                                      //get value when changed

                                      setState(() {
                                        companySizeDWValue = value.toString();
                                      });
                                    },
                                    icon: Padding(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Icon(Icons.arrow_drop_down)),
                                    style: TextStyle(fontSize: 16),
                                    dropdownColor: Color(
                                        0xFFD9D9D9), //dropdown background color
                                    underline: Container(), //remove underline
                                    isExpanded:
                                        true, //make true to make width 100%
                                  ))),
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
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Logo (Recommended size image: 330x300px)",
                                style: TextStyle(fontSize: 18),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                              width: 400,
                              height: 300,
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFD9D9D9)),
                              ),
                              child: usePrv!.company!.avatarDetail!.filePath !=
                                          null &&
                                      imageFile == null
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                          Container(
                                            height: 210,
                                            width: 210,
                                            child: InkWell(
                                              onTap: () {
                                                print("Bấm vào đây");
                                                _getFromGallery();
                                              },
                                            ),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    Api_Url.BASE_URL_IMAGE +
                                                        usePrv!
                                                            .company!
                                                            .avatarDetail!
                                                            .filePath!,
                                                  ),
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              child: const Text("Upload image"),
                                            ),
                                          )
                                        ])
                                  // : GestureDetector(
                                  //     onTap: () => _getFromGallery(),
                                  //     child: Image.file(imageFile!))
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                          Container(
                                            height: 210,
                                            width: 210,
                                            child: InkWell(
                                              onTap: () {
                                                print("Bấm vào đây");
                                                _getFromGallery();
                                              },
                                              child: Image.file(
                                                imageFile!,
                                                fit: BoxFit.fill,
                                              ),
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
                                                idMedia = (await Provider.of<
                                                            UserProvider>(
                                                        context,
                                                        listen: false)
                                                    .postMedia(imageFile!))!;
                                              },
                                              child: const Text("Upload image"),
                                            ),
                                          )
                                        ]))
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
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Social Media",
                                style: TextStyle(fontSize: 18),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          customRow(
                              title1: "Skype",
                              title2: "Facebook",
                              controller1: txtSkype,
                              controller2: txtFacebook),
                          SizedBox(
                            height: 20,
                          ),
                          customRow(
                              title1: "Twitter",
                              title2: "Instagram",
                              controller1: txtTwitter,
                              controller2: txtInstagram),
                          SizedBox(
                            height: 20,
                          ),
                          customRow(
                              title1: "Linkedin",
                              title2: "Google",
                              controller1: txtLinkedin,
                              controller2: txtGoogle),
                        ]))),
            SizedBox(
              height: 50,
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
                                "Publish",
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
                                  child: DropdownButton(
                                    value: publishDWValue,
                                    items: [
                                      //add items in the d
                                      DropdownMenuItem(
                                        child: Text(
                                          "Publish",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        value: "publish",
                                      ), // ropdown
                                      DropdownMenuItem(
                                        child: Text(
                                          "Draft",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        value: "draft",
                                      ),
                                    ],
                                    onChanged: (value) {
                                      //get value when changed
                                      setState(() {
                                        publishDWValue = value.toString();
                                      });
                                    },
                                    icon: Padding(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Icon(Icons.arrow_drop_down)),
                                    style: TextStyle(fontSize: 16),
                                    dropdownColor: Color(
                                        0xFFD9D9D9), //dropdown background color
                                    underline: Container(), //remove underline
                                    isExpanded:
                                        true, //make true to make width 100%
                                  ))),
                        ]))),
            SizedBox(
              height: 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: InkWell(
                onTap: () async {
                  usePrv!.company!.name = txtName.text;
                  usePrv!.company!.email = txtEmail.text;
                  usePrv!.company!.phone = txtPhone.text;
                  usePrv!.company!.website = txtWebSite.text;
                  usePrv!.company!.locationId = int.parse(nearestCityDWValue);
                  if (idMedia != 0) {
                    usePrv!.company!.avatarId = idMedia;
                  }
                  usePrv!.company!.categoryId = int.parse(categoryDWValue);
                  usePrv!.company!.mapLat = txtLatitude.text;
                  usePrv!.company!.mapLng = txtLongitude.text;
                  usePrv!.company!.status = publishDWValue;
                  usePrv!.company!.about = txtAboutCompany.text;
                  usePrv!.company!.city = txtCity.text;
                  usePrv!.company!.state = txtState.text;
                  usePrv!.company!.country = country;
                  usePrv!.company!.address = txtAddress.text;
                  usePrv!.company!.teamSize = int.parse(companySizeDWValue);

                  usePrv!.company!.zipCode = int.parse(txtZipcode.text);
                  usePrv!.company!.allowSearch = allowSearch ? 1 : 0;
                  await Provider.of<UserProvider>(context, listen: false)
                      .updateProfileCompany(usePrv!.company!);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: getVerticalSize(
                    56.00,
                  ),
                  width: getHorizontalSize(
                    184.00,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20),
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
          ],
        ),
      ),
    );
  }

  customColumn({
    final title,

    //final hint,

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

              //hintText: hint,
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

  customRow(
      {final title1, final title2, final controller1, final controller2}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customColumn(
            title: title1,
            height: 50.0,
            width: 150.0,
            //hint: hint1,
            controller: controller1,
            maxLines: 1,
            keyboardType: TextInputType.text),
        customColumn(
          title: title2,
          height: 50.0,
          width: 150.0,
          //hint: hint2,
          controller: controller2,
          maxLines: 1,
          keyboardType: TextInputType.text,
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
  }
}
