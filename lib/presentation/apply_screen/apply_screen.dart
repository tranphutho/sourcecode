import 'dart:ffi';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hires/core/theme/theme_constants.dart';
import 'package:hires/models/job_model.dart';
import 'package:hires/presentation/apply_success_2_screen/apply_success_2_screen.dart';
import 'package:provider/provider.dart';
import '../../models/user_model.dart';
import '../apply_screen/widgets/group2073_item_widget.dart';
import '../apply_screen/widgets/group2074_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hires/core/app_export.dart';

import '../resume_portfolio_upload_screen/resume_portfolio_upload_screen.dart';

class ApplyScreen extends StatefulWidget {
  static String id = "ApplyScreen";

  @override
  State<ApplyScreen> createState() => _ApplyScreen();
}

class _ApplyScreen extends State<ApplyScreen> {
  Job? job;
  late String fileName;
  late String filePath;
  late dynamic fileBits;

  late TextEditingController txtMessage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    txtMessage = TextEditingController();
    fileName = "Upload a Doc/Docx/PDF";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    txtMessage.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserModel usePrv = Provider.of<UserProvider>(
      context,
    ).userApp!;
    //print(job!.title!);
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    job = ModalRoute.of(context)!.settings.arguments as Job;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(16)),
        child: Container(
          width: getHorizontalSize(330),
          height: getVerticalSize(50),
          child: FloatingActionButton.extended(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(getHorizontalSize(12))),
              backgroundColor: ColorConstant.teal600,
              foregroundColor: ColorConstant.whiteA700,
              extendedTextStyle: TextStyle(
                color: ColorConstant.gray50,
                fontSize: getFontSize(
                  14,
                ),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                letterSpacing: 0.07,
              ),
              onPressed: () async {
                //Navigator.pushNamed(context, ApplySuccess2Screen.id);
                JobProvider jobProvider =
                    Provider.of<JobProvider>(context, listen: false);
                bool? status = await jobProvider.applyJob(
                    File(filePath),
                    filePath,
                    fileName,
                    txtMessage.text,
                    job!.id!.toString(),
                    job!.companyId!.toString(),
                    usePrv!.token!);
                if (status!)
                  Navigator.pushNamed(context, ApplySuccess2Screen.id);
              },
              label: Text('Apply')),
        ),
      ),
      appBar: AppBar(
        backgroundColor:
            isDark ? ColorConstant.darkbutton : ColorConstant.whiteA700,
        title: Text(
          "Apply",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getFontSize(
              16,
            ),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(
              left: getHorizontalSize(
                18.00,
              ),
              right: getHorizontalSize(
                18.00,
              ),
            ),
            child: GestureDetector(
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
                      color: isDark ? Colors.white : Colors.black)),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: getVerticalSize(
                          20.00,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: isDark
                                    ? ColorConstant.darkbutton
                                    : ColorConstant.whiteA700,
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorConstant.black90005,
                                    spreadRadius: getHorizontalSize(
                                      2.00,
                                    ),
                                    blurRadius: getHorizontalSize(
                                      2.00,
                                    ),
                                    offset: Offset(
                                      0,
                                      4,
                                    ),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: getVerticalSize(
                                        30.00,
                                      ),
                                      bottom: getVerticalSize(
                                        20.00,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          height: getSize(
                                            44.00,
                                          ),
                                          width: getSize(
                                            44.00,
                                          ),
                                          margin: EdgeInsets.only(
                                            left: getHorizontalSize(
                                              44.00,
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            color: ColorConstant.whiteA700,
                                            borderRadius: BorderRadius.circular(
                                              getHorizontalSize(
                                                119.00,
                                              ),
                                            ),
                                          ),
                                          child: Card(
                                            clipBehavior: Clip.antiAlias,
                                            elevation: 0,
                                            margin: EdgeInsets.all(0),
                                            color: ColorConstant.whiteA700,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                getHorizontalSize(
                                                  119.00,
                                                ),
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Image.asset(
                                                    ImageConstant.imgSpotigy13,
                                                    height: getSize(
                                                      44.00,
                                                    ),
                                                    width: getSize(
                                                      44.00,
                                                    ),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: getHorizontalSize(
                                              15.00,
                                            ),
                                            right: getHorizontalSize(
                                              52.00,
                                            ),
                                            bottom: getVerticalSize(
                                              1.00,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: getHorizontalSize(
                                                  220.00,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        bottom: getVerticalSize(
                                                          1.00,
                                                        ),
                                                      ),
                                                      child: Text(
                                                        job!.category!.name!,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                          fontSize: getFontSize(
                                                            14,
                                                          ),
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      "${Constants.currency}${job?.salaryMin ?? ""} - ${Constants.currency}${job?.salaryMax ?? ""}/${job!.salaryType!.substring(0, 1) ?? ""}",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: TextStyle(
                                                        fontSize: getFontSize(
                                                          12,
                                                        ),
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: getHorizontalSize(
                                                  220.00,
                                                ),
                                                margin: EdgeInsets.only(
                                                  top: getVerticalSize(
                                                    3.00,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      "Spotify",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        color: isDark
                                                            ? Colors.white
                                                            : ColorConstant
                                                                .gray90087,
                                                        fontSize: getFontSize(
                                                          13,
                                                        ),
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${job!.company != null ? job!.company!.city : ""}, ${job!.company != null ? job!.company!.country : ""}",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: TextStyle(
                                                        color: isDark
                                                            ? Colors.white
                                                            : ColorConstant
                                                                .gray90087,
                                                        fontSize: getFontSize(
                                                          13,
                                                        ),
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Align(
                          //   alignment: Alignment.centerLeft,
                          //   child: Padding(
                          //     padding: EdgeInsets.only(
                          //       left: getHorizontalSize(
                          //         24.00,
                          //       ),
                          //       top: getVerticalSize(
                          //         24.00,
                          //       ),
                          //       right: getHorizontalSize(
                          //         24.00,
                          //       ),
                          //     ),
                          //     child: Text(
                          //       "Select a profile",
                          //       overflow: TextOverflow.ellipsis,
                          //       textAlign: TextAlign.start,
                          //       style: TextStyle(
                          //         fontSize: getFontSize(
                          //           16,
                          //         ),
                          //         fontFamily: 'Poppins',
                          //         fontWeight: FontWeight.w600,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Container(
                          //   height: getVerticalSize(
                          //     200.00,
                          //   ),
                          //   child: ListView.builder(
                          //     padding: EdgeInsets.only(
                          //       left: getHorizontalSize(
                          //         24.00,
                          //       ),
                          //       top: getVerticalSize(
                          //         16.00,
                          //       ),
                          //       right: getHorizontalSize(
                          //         24.00,
                          //       ),
                          //     ),
                          //     scrollDirection: Axis.horizontal,
                          //     physics: BouncingScrollPhysics(),
                          //     itemCount: 2,
                          //     itemBuilder: (context, index) {
                          //       return Group2073ItemWidget();
                          //     },
                          //   ),
                          // ),
                          // Align(
                          //   alignment: Alignment.centerLeft,
                          //   child: Padding(
                          //     padding: EdgeInsets.only(
                          //       left: getHorizontalSize(
                          //         24.00,
                          //       ),
                          //       top: getVerticalSize(
                          //         32.00,
                          //       ),
                          //       right: getHorizontalSize(
                          //         24.00,
                          //       ),
                          //     ),
                          //     child: Text(
                          //       "Select a resume",
                          //       overflow: TextOverflow.ellipsis,
                          //       textAlign: TextAlign.start,
                          //       style: TextStyle(
                          //         fontSize: getFontSize(
                          //           16,
                          //         ),
                          //         fontFamily: 'Poppins',
                          //         fontWeight: FontWeight.w600,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Container(
                          //   height: getVerticalSize(
                          //     90.00,
                          //   ),
                          //   child: ListView.builder(
                          //     padding: EdgeInsets.only(
                          //       left: getHorizontalSize(
                          //         24.00,
                          //       ),
                          //       top: getVerticalSize(
                          //         16.00,
                          //       ),
                          //       right: getHorizontalSize(
                          //         24.00,
                          //       ),
                          //     ),
                          //     scrollDirection: Axis.horizontal,
                          //     physics: BouncingScrollPhysics(),
                          //     itemCount: 2,
                          //     itemBuilder: (context, index) {
                          //       return Group2074ItemWidget();
                          //     },
                          //   ),
                          // ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: getHorizontalSize(
                                10.00,
                              ),
                            ),
                            child: Text(
                              "Resume or CV",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: isDark
                                    ? Colors.white
                                    : ColorConstant.gray900,
                                fontSize: getFontSize(
                                  16,
                                ),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: getVerticalSize(16)),
                            child: DottedBorder(
                              color: ColorConstant.teal600,
                              borderType: BorderType.RRect,
                              radius: Radius.circular(getHorizontalSize(16)),
                              dashPattern: [10, 3, 10, 3],
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: getHorizontalSize(
                                        211.00,
                                      ),
                                      margin: EdgeInsets.only(
                                        left: getHorizontalSize(
                                          32.00,
                                        ),
                                        top: getVerticalSize(
                                          10.00,
                                        ),
                                        right: getHorizontalSize(
                                          32.00,
                                        ),
                                      ),
                                      child: Text(
                                        "Upload your CV or Resume and use it when you apply for jobs",
                                        maxLines: null,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: ColorConstant.gray500,
                                          fontSize: getFontSize(
                                            13,
                                          ),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: getHorizontalSize(
                                          32.00,
                                        ),
                                        top: getVerticalSize(
                                          20.00,
                                        ),
                                        right: getHorizontalSize(
                                          32.00,
                                        ),
                                        bottom: getHorizontalSize(
                                          20.00,
                                        ),
                                      ),
                                      child: Builder(builder: (context) {
                                        return InkWell(
                                          onTap: () async {
                                            final result = await FilePicker
                                                .platform
                                                .pickFiles();
                                            if (result == null) {
                                              fileName =
                                                  "Upload a Doc/Docx/PDF";
                                              (context as Element)
                                                  .markNeedsBuild();
                                              return;
                                            }
                                            final file = result!.files.first;
                                            print(file.name);
                                            fileName = file.name;
                                            print(file.path);
                                            filePath = file.path!;
                                            fileBits = file.bytes;
                                            (context as Element)
                                                .markNeedsBuild();
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: getVerticalSize(
                                              90.00,
                                            ),
                                            width: getHorizontalSize(
                                              263.00,
                                            ),
                                            decoration: BoxDecoration(
                                              color: isDark
                                                  ? ColorConstant.darkbutton
                                                  : ColorConstant.gray100,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                getHorizontalSize(
                                                  12.00,
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                              fileName,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: ColorConstant.teal600,
                                                fontSize: getFontSize(
                                                  14,
                                                ),
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: EdgeInsets.only(
                                left: getHorizontalSize(
                                  24.00,
                                ),
                                top: getVerticalSize(
                                  40.00,
                                ),
                                right: getHorizontalSize(
                                  24.00,
                                ),
                              ),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Cover Letter ',
                                      style: TextStyle(
                                        color: isDark
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: getFontSize(
                                          16,
                                        ),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '(Optional)',
                                      style: TextStyle(
                                        color: ColorConstant.gray500,
                                        fontSize: getFontSize(
                                          16,
                                        ),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: getVerticalSize(
                                  16.00,
                                ),
                                bottom: getVerticalSize(
                                  70.00,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        24.00,
                                      ),
                                    ),
                                    child: Container(
                                      height: getVerticalSize(
                                        87.00,
                                      ),
                                      width: getHorizontalSize(
                                        330.00,
                                      ),
                                      alignment: Alignment.center,
                                      child: isDark
                                          ? darkCustomContainer(
                                              child: Align(
                                              alignment: Alignment.topCenter,
                                              child: Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: TextFormField(
                                                  controller: txtMessage,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        "Write a cover letter......",
                                                    border:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide
                                                                    .none),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide
                                                                    .none),
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide
                                                                    .none),
                                                    //filled: false,
                                                  ),
                                                ),
                                              ),
                                            ))
                                          : lightCostumContainer(
                                              child: Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: TextFormField(
                                                  controller: txtMessage,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        "Write a cover letter......",
                                                    border:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide
                                                                    .none),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide
                                                                    .none),
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide
                                                                    .none),
                                                    //filled: false,
                                                  ),
                                                ),
                                              ),
                                            )),
                                    ),
                                  ),
                                  // GestureDetector(
                                  //   onTap: () {
                                  //     Navigator.pushNamed(context,
                                  //         ResumePortfolioUploadScreen.id);
                                  //   },
                                  //   child: Container(
                                  //     margin: EdgeInsets.only(
                                  //       left: getHorizontalSize(
                                  //         16.00,
                                  //       ),
                                  //       right: getHorizontalSize(
                                  //         24.00,
                                  //       ),
                                  //     ),
                                  //     decoration: BoxDecoration(
                                  //       color: isDark
                                  //           ? ColorConstant.darkbutton
                                  //           : ColorConstant.whiteA700,
                                  //       borderRadius: BorderRadius.circular(
                                  //         getHorizontalSize(
                                  //           12.00,
                                  //         ),
                                  //       ),
                                  //       boxShadow: [
                                  //         BoxShadow(
                                  //           color: ColorConstant.black90005,
                                  //           spreadRadius: getHorizontalSize(
                                  //             2.00,
                                  //           ),
                                  //           blurRadius: getHorizontalSize(
                                  //             2.00,
                                  //           ),
                                  //           offset: Offset(
                                  //             0,
                                  //             4,
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //     child: Column(
                                  //       mainAxisSize: MainAxisSize.min,
                                  //       crossAxisAlignment:
                                  //           CrossAxisAlignment.center,
                                  //       mainAxisAlignment:
                                  //           MainAxisAlignment.center,
                                  //       children: [
                                  //         Padding(
                                  //           padding: EdgeInsets.only(
                                  //             left: getHorizontalSize(
                                  //               16.00,
                                  //             ),
                                  //             top: getVerticalSize(
                                  //               16.00,
                                  //             ),
                                  //             right: getHorizontalSize(
                                  //               16.00,
                                  //             ),
                                  //           ),
                                  //           child: Container(
                                  //             height: getSize(
                                  //               16.00,
                                  //             ),
                                  //             width: getSize(
                                  //               16.00,
                                  //             ),
                                  //             child: SvgPicture.asset(
                                  //               ImageConstant.imgBiupload1,
                                  //               fit: BoxFit.fill,
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         Container(
                                  //           width: getHorizontalSize(
                                  //             36.00,
                                  //           ),
                                  //           margin: EdgeInsets.only(
                                  //             left: getHorizontalSize(
                                  //               16.00,
                                  //             ),
                                  //             top: getVerticalSize(
                                  //               9.00,
                                  //             ),
                                  //             right: getHorizontalSize(
                                  //               16.00,
                                  //             ),
                                  //             bottom: getVerticalSize(
                                  //               16.00,
                                  //             ),
                                  //           ),
                                  //           child: Text(
                                  //             "Upload\nPDF",
                                  //             maxLines: null,
                                  //             textAlign: TextAlign.center,
                                  //             style: TextStyle(
                                  //               color: ColorConstant.teal600,
                                  //               fontSize: getFontSize(
                                  //                 10,
                                  //               ),
                                  //               fontFamily: 'Poppins',
                                  //               fontWeight: FontWeight.w500,
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
