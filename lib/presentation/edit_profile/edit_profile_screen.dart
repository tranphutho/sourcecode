import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hires/core/constants/constants.dart';
import 'package:hires/core/utils/color_constant.dart';
import 'package:hires/core/utils/common_utils.dart';
import 'package:hires/core/utils/image_constant.dart';
import 'package:hires/core/utils/math_utils.dart';
import 'package:hires/models/user_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  static String id = "EditProfile";

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController txtEmail;
  late TextEditingController txtPwd;
  late TextEditingController txtFName;
  late TextEditingController txtLName;
  late TextEditingController txtBio;
  var _currentdate = "Birthday";
  var selectImagePath = "";

  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    txtEmail = TextEditingController(text: '');
    txtPwd = TextEditingController(text: '');
    txtFName = TextEditingController(text: '');
    txtLName = TextEditingController(text: '');
    txtBio = TextEditingController(text: '');
    super.initState();
  }

  @override
  void dispose() {
    txtEmail.dispose();
    txtPwd.dispose();
    txtFName.dispose();
    txtLName.dispose();
    txtBio.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    UserModel usePrv = Provider.of<UserProvider>(
      context,
    ).userApp!;
    txtFName.text = "" + usePrv.first_name!;

    txtLName.text = "" + usePrv.last_name!.toString() ?? "";
    txtEmail.text = "" + usePrv.email!;
    final f = new DateFormat('yyyy-MM-dd');
    _currentdate = "" + f.format(usePrv.birthday!).toString();

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: size.width,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: getHorizontalSize(
                            18.00,
                          ),
                          right: getHorizontalSize(
                            24.00,
                          ),
                          top: getVerticalSize(16)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                height: getSize(
                                  24.00,
                                ),
                                width: getSize(
                                  24.00,
                                ),
                                child: Icon(Icons.arrow_back_ios,
                                    size: getSize(20),
                                    color:
                                        isDark ? Colors.white : Colors.black)),
                          ),
                          Text("Edit Profile"),
                          Container(),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: getVerticalSize(
                            16.00,
                          ),
                          bottom: getVerticalSize(
                            30.00,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: getSize(
                                104.00,
                              ),
                              width: getSize(
                                104.00,
                              ),
                              margin: EdgeInsets.only(
                                left: getHorizontalSize(
                                  24.00,
                                ),
                                top: getVerticalSize(
                                  8.00,
                                ),
                                right: getHorizontalSize(
                                  24.00,
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: ColorConstant.indigo50,
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    52.00,
                                  ),
                                ),
                              ),
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                elevation: 0,
                                margin: EdgeInsets.all(0),
                                color: ColorConstant.indigo50,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      52.00,
                                    ),
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    final pickedFile = await ImagePicker
                                        .platform
                                        .pickImage(source: ImageSource.gallery);
                                    if (pickedFile != null) {
                                      setState(() {
                                        selectImagePath = pickedFile.path;
                                      });
                                    }
                                  },
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          getSize(
                                            52.00,
                                          ),
                                        ),
                                        child: selectImagePath.toString() == ""
                                            ? Image.asset(
                                                ImageConstant
                                                    .imgChristinawocin7,
                                                height: getSize(
                                                  104.00,
                                                ),
                                                width: getSize(
                                                  104.00,
                                                ),
                                                fit: BoxFit.fill,
                                              )
                                            : Image.file(
                                                File(selectImagePath))),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    24.00,
                                  ),
                                  top: getVerticalSize(
                                    24.00,
                                  ),
                                  right: getHorizontalSize(
                                    24.00,
                                  ),
                                ),
                                child: Container(
                                  height: getVerticalSize(
                                    52.00,
                                  ),
                                  width: getHorizontalSize(
                                    327.00,
                                  ),
                                  margin: EdgeInsets.only(
                                    top: getVerticalSize(
                                      18.00,
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: txtFName,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'First Name',
                                      hintStyle: TextStyle(
                                        fontSize: getFontSize(
                                          14.0,
                                        ),
                                      ),
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(
                                          left: getHorizontalSize(
                                            24.00,
                                          ),
                                          right: getHorizontalSize(
                                            10.00,
                                          ),
                                        ),
                                        child: Container(
                                          height: getSize(
                                            20.00,
                                          ),
                                          width: getSize(
                                            19.00,
                                          ),
                                          child: isDark
                                              ? SvgPicture.asset(
                                                  ImageConstant.imgPassword613,
                                                  fit: BoxFit.contain,
                                                  color: Colors.white,
                                                )
                                              : SvgPicture.asset(
                                                  ImageConstant.imgPassword613,
                                                  fit: BoxFit.contain,
                                                ),
                                        ),
                                      ),
                                      prefixIconConstraints: BoxConstraints(
                                        minWidth: getSize(
                                          20.00,
                                        ),
                                        minHeight: getSize(
                                          20.00,
                                        ),
                                      ),
                                      isDense: true,
                                      contentPadding: EdgeInsets.only(
                                        top: getVerticalSize(
                                          25.50,
                                        ),
                                        bottom: getVerticalSize(
                                          .50,
                                        ),
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: ColorConstant.gray900,
                                      fontSize: getFontSize(
                                        14.0,
                                      ),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    24.00,
                                  ),
                                  right: getHorizontalSize(
                                    24.00,
                                  ),
                                ),
                                child: Container(
                                  height: getVerticalSize(
                                    52.00,
                                  ),
                                  width: getHorizontalSize(
                                    327.00,
                                  ),
                                  margin: EdgeInsets.only(
                                    top: getVerticalSize(
                                      18.00,
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: txtLName,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Last Name',
                                      hintStyle: TextStyle(
                                        fontSize: getFontSize(
                                          14.0,
                                        ),
                                      ),
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(
                                          left: getHorizontalSize(
                                            24.00,
                                          ),
                                          right: getHorizontalSize(
                                            10.00,
                                          ),
                                        ),
                                        child: Container(
                                          height: getSize(
                                            20.00,
                                          ),
                                          width: getSize(
                                            19.00,
                                          ),
                                          child: isDark
                                              ? SvgPicture.asset(
                                                  ImageConstant.imgPassword613,
                                                  fit: BoxFit.contain,
                                                  color: Colors.white,
                                                )
                                              : SvgPicture.asset(
                                                  ImageConstant.imgPassword613,
                                                  fit: BoxFit.contain,
                                                ),
                                        ),
                                      ),
                                      prefixIconConstraints: BoxConstraints(
                                        minWidth: getSize(
                                          20.00,
                                        ),
                                        minHeight: getSize(
                                          20.00,
                                        ),
                                      ),
                                      isDense: true,
                                      contentPadding: EdgeInsets.only(
                                        top: getVerticalSize(
                                          25.50,
                                        ),
                                        bottom: getVerticalSize(
                                          .50,
                                        ),
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: ColorConstant.gray900,
                                      fontSize: getFontSize(
                                        14.0,
                                      ),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  24.00,
                                ),
                                right: getHorizontalSize(
                                  24.00,
                                ),
                              ),
                              child: Container(
                                height: getVerticalSize(
                                  52.00,
                                ),
                                width: getHorizontalSize(
                                  327.00,
                                ),
                                margin: EdgeInsets.only(
                                  top: getVerticalSize(
                                    18.00,
                                  ),
                                ),
                                child: TextFormField(
                                  controller: txtEmail,
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                        left: getHorizontalSize(
                                          24.00,
                                        ),
                                        right: getHorizontalSize(
                                          10.00,
                                        ),
                                      ),
                                      child: Container(
                                        height: getSize(
                                          20.00,
                                        ),
                                        width: getSize(
                                          19.00,
                                        ),
                                        child: isDark
                                            ? SvgPicture.asset(
                                                ImageConstant.imgMailoutline11,
                                                fit: BoxFit.contain,
                                                color: Colors.white,
                                              )
                                            : SvgPicture.asset(
                                                ImageConstant.imgMailoutline11,
                                                fit: BoxFit.contain,
                                              ),
                                      ),
                                    ),
                                    prefixIconConstraints: BoxConstraints(
                                      minWidth: getSize(
                                        20.00,
                                      ),
                                      minHeight: getSize(
                                        20.00,
                                      ),
                                    ),
                                    isDense: true,
                                    contentPadding: EdgeInsets.only(
                                      top: getVerticalSize(
                                        19.50,
                                      ),
                                      bottom: getVerticalSize(
                                        19.50,
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: ColorConstant.gray900,
                                    fontSize: getFontSize(
                                      14.0,
                                    ),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: TextButton(
                                  onPressed: () {
                                    DatePicker.showDatePicker(context,
                                        showTitleActions: true,
                                        minTime: DateTime(1950, 3, 5),
                                        maxTime: DateTime.now(),
                                        onChanged: (date) {
                                      final f = new DateFormat('yyyy-MM-dd');
                                      setState(() {
                                        _currentdate =
                                            f.format(date).toString();
                                      });
                                      print('change $date');
                                    }, onConfirm: (date) {
                                      print('confirm $date');
                                    },
                                        currentTime: DateTime.now(),
                                        locale: LocaleType.en);
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 15, right: 15, top: 15),
                                      alignment: Alignment.center,
                                      height: 42,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                              color: ColorConstant.gray402)),
                                      child: Text(
                                        _currentdate.toString(),
                                        style: TextStyle(
                                            color: ColorConstant.gray900,
                                            fontSize: getFontSize(
                                              14.0,
                                            )),
                                      ),
                                    ),
                                  )),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    24.00,
                                  ),
                                  right: getHorizontalSize(
                                    24.00,
                                  ),
                                ),
                                child: Container(
                                  height: getVerticalSize(
                                    52.00,
                                  ),
                                  width: getHorizontalSize(
                                    327.00,
                                  ),
                                  margin: EdgeInsets.only(
                                    top: getVerticalSize(
                                      18.00,
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: txtPwd,
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                        fontSize: getFontSize(
                                          14.0,
                                        ),
                                      ),
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(
                                          left: getHorizontalSize(
                                            24.00,
                                          ),
                                          right: getHorizontalSize(
                                            10.00,
                                          ),
                                        ),
                                        child: Container(
                                          height: getSize(
                                            20.00,
                                          ),
                                          width: getSize(
                                            19.00,
                                          ),
                                          child: isDark
                                              ? SvgPicture.asset(
                                                  ImageConstant.imgPassword613,
                                                  fit: BoxFit.contain,
                                                  color: Colors.white,
                                                )
                                              : SvgPicture.asset(
                                                  ImageConstant.imgPassword613,
                                                  fit: BoxFit.contain,
                                                ),
                                        ),
                                      ),
                                      prefixIconConstraints: BoxConstraints(
                                        minWidth: getSize(
                                          20.00,
                                        ),
                                        minHeight: getSize(
                                          20.00,
                                        ),
                                      ),
                                      isDense: true,
                                      contentPadding: EdgeInsets.only(
                                        top: getVerticalSize(
                                          25.50,
                                        ),
                                        bottom: getVerticalSize(
                                          .50,
                                        ),
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: ColorConstant.gray900,
                                      fontSize: getFontSize(
                                        14.0,
                                      ),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    24.00,
                                  ),
                                  right: getHorizontalSize(
                                    24.00,
                                  ),
                                ),
                                child: Container(
                                  height: getVerticalSize(
                                    102.00,
                                  ),
                                  width: getHorizontalSize(
                                    327.00,
                                  ),
                                  margin: EdgeInsets.only(
                                    top: getVerticalSize(
                                      18.00,
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: txtBio,
                                    obscureText: false,
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                      hintText: 'Bio',
                                      hintStyle: TextStyle(
                                        fontSize: getFontSize(
                                          14.0,
                                        ),
                                      ),
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(
                                          left: getHorizontalSize(
                                            24.00,
                                          ),
                                          right: getHorizontalSize(
                                            10.00,
                                          ),
                                        ),
                                        child: Container(
                                          height: getSize(
                                            20.00,
                                          ),
                                          width: getSize(
                                            19.00,
                                          ),
                                          child: isDark
                                              ? SvgPicture.asset(
                                                  ImageConstant.imgPassword613,
                                                  fit: BoxFit.contain,
                                                  color: Colors.white,
                                                )
                                              : SvgPicture.asset(
                                                  ImageConstant.imgPassword613,
                                                  fit: BoxFit.contain,
                                                ),
                                        ),
                                      ),
                                      prefixIconConstraints: BoxConstraints(
                                        minWidth: getSize(
                                          20.00,
                                        ),
                                        minHeight: getSize(
                                          20.00,
                                        ),
                                      ),
                                      isDense: true,
                                      contentPadding: EdgeInsets.only(
                                        top: getVerticalSize(
                                          25.50,
                                        ),
                                        bottom: getVerticalSize(
                                          .50,
                                        ),
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: ColorConstant.gray900,
                                      fontSize: getFontSize(
                                        14.0,
                                      ),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    24.00,
                                  ),
                                  top: getVerticalSize(
                                    32.00,
                                  ),
                                  right: getHorizontalSize(
                                    24.00,
                                  ),
                                ),
                                child: GestureDetector(
                                  onTap: () async {
                                    if (txtEmail.text.trim().isEmpty ||
                                        txtPwd.text.trim().isEmpty ||
                                        txtFName.text.trim().isEmpty ||
                                        txtLName.text.trim().isEmpty ||
                                        txtBio.text.trim().isEmpty) {
                                      String mssg = '';
                                      if (txtEmail.text.trim().isEmpty)
                                        mssg = Constants.mssgErrEntrEmail;
                                      else if (txtPwd.text.trim().isEmpty) {
                                        mssg = Constants.mssgErrEntrPwd;
                                        getToastMessage(mssg, Colors.red);
                                      } else if (selectImagePath.toString() ==
                                          "")
                                        getToastMessage(
                                            "Select Images", Colors.red);
                                    } else {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      await Provider.of<UserProvider>(context,
                                              listen: false)
                                          .updateProfile(
                                        txtEmail.value.text.toString(),
                                        txtPwd.value.text.toString(),
                                        txtFName.value.text.toString(),
                                        txtLName.value.text.toString(),
                                        _currentdate.toString(),
                                        selectImagePath,
                                        txtBio.value.text.toString(),
                                        context,
                                      );

                                      setState(() {
                                        isLoading = false;
                                      });
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: getVerticalSize(
                                      56.00,
                                    ),
                                    width: getHorizontalSize(
                                      327.00,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.teal600,
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(
                                          16.00,
                                        ),
                                      ),
                                    ),
                                    child: isLoading
                                        ? CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : Text(
                                            "Update Profile",
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
