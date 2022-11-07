import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/math_utils.dart';
import '../../models/user_model.dart';

class MyProfile extends StatefulWidget {
  static String id = "MyProfile";

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool upload = true;

  bool uploading = false;

  bool uploaded = false;
  late TextEditingController txtEmail;

  late TextEditingController txtFName;
  late TextEditingController txtLName;
  late TextEditingController txtBio;
  late TextEditingController txtBirth;
  late TextEditingController txtPhone;

  @override
  void initState() {
    // TODO: implement initState
    txtEmail = TextEditingController(text: '');

    txtFName = TextEditingController(text: '');
    txtLName = TextEditingController(text: '');
    txtBio = TextEditingController(text: '');
    txtBirth = TextEditingController(text: '');
    txtPhone = TextEditingController(text: '');

    super.initState();
  }

  @override
  void dispose() {
    txtEmail.dispose();

    txtFName.dispose();
    txtLName.dispose();
    txtBio.dispose();
    txtBirth.dispose();
    txtPhone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    UserModel usePrv = Provider.of<UserProvider>(
      context,
    ).userApp!;
    txtEmail.text = usePrv.email!;
    txtFName.text = usePrv.first_name!;
    txtLName.text = usePrv.last_name!;
    txtBio.text = usePrv.bio!;
    final f = new DateFormat('yyyy-MM-dd');
    txtBirth.text = "" + f.format(usePrv.birthday!).toString();
    txtPhone.text = usePrv.phone!;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "User Info",
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: getHorizontalSize(
                          10.00,
                        ),
                      ),
                      child: Text(
                        "Avatar",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: isDark ? Colors.white : ColorConstant.gray900,
                          fontSize: getFontSize(
                            16,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    if (upload)
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
                              // Align(
                              //   alignment: Alignment.center,
                              //   child: Container(
                              //     width: getHorizontalSize(
                              //       211.00,
                              //     ),
                              //     margin: EdgeInsets.only(
                              //       left: getHorizontalSize(
                              //         32.00,
                              //       ),
                              //       top: getVerticalSize(
                              //         40.00,
                              //       ),
                              //       right: getHorizontalSize(
                              //         32.00,
                              //       ),
                              //     ),
                              //     child: Text(
                              //       "Upload your CV or Resume and use it when you apply for jobs",
                              //       maxLines: null,
                              //       textAlign: TextAlign.center,
                              //       style: TextStyle(
                              //         color: ColorConstant.gray500,
                              //         fontSize: getFontSize(
                              //           13,
                              //         ),
                              //         fontFamily: 'Poppins',
                              //         fontWeight: FontWeight.w500,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      32.00,
                                    ),
                                    top: getVerticalSize(
                                      32.00,
                                    ),
                                    right: getHorizontalSize(
                                      32.00,
                                    ),
                                  ),
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: getVerticalSize(
                                        73.00,
                                      ),
                                      width: getHorizontalSize(
                                        263.00,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isDark
                                            ? ColorConstant.darkbutton
                                            : ColorConstant.gray100,
                                        borderRadius: BorderRadius.circular(
                                          getHorizontalSize(
                                            12.00,
                                          ),
                                        ),
                                      ),
                                      child: Icon(Icons.photo_camera_rounded)
                                      // Text(
                                      //   "Upload a Doc/Docx/PDF",
                                      //   textAlign: TextAlign.center,
                                      //   style: TextStyle(
                                      //     color: ColorConstant.teal600,
                                      //     fontSize: getFontSize(
                                      //       14,
                                      //     ),
                                      //     fontFamily: 'Poppins',
                                      //     fontWeight: FontWeight.w500,
                                      //   ),
                                      // ),
                                      ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      64.00,
                                    ),
                                    top: getVerticalSize(
                                      32.00,
                                    ),
                                    right: getHorizontalSize(
                                      64.00,
                                    ),
                                    bottom: getVerticalSize(
                                      40.00,
                                    ),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        uploading = true;
                                        upload = false;
                                        uploaded = false;
                                      });
                                    },
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
                                      ),
                                      child: Text(
                                        "Upload",
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
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          uploading = true;
                          upload = false;
                          uploaded = false;
                        });
                      },
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
                        ),
                        child: Text(
                          "Save",
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
                    SizedBox(
                      height: 20,
                    ),
                    //else
                    //   if(uploading)
                    //   Padding(
                    //     padding:  EdgeInsets.only(top: getVerticalSize(16)),
                    //     child: DottedBorder(
                    //       color: ColorConstant.teal600,
                    //
                    //
                    //       borderType: BorderType.RRect,
                    //       radius: Radius.circular(getHorizontalSize(16)),
                    //       dashPattern: [10,3,10,3],
                    //       child:
                    //
                    //       Column(
                    //         mainAxisSize: MainAxisSize.min,
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         children: [
                    //           Container(
                    //             width: getHorizontalSize(
                    //               211.00,
                    //             ),
                    //             margin: EdgeInsets.only(
                    //               left: getHorizontalSize(
                    //                 58.00,
                    //               ),
                    //               top: getVerticalSize(
                    //                 40.00,
                    //               ),
                    //               right: getHorizontalSize(
                    //                 58.00,
                    //               ),
                    //             ),
                    //             child: Text(
                    //               "Upload your CV or Resume and use it when you apply for jobs",
                    //               maxLines: null,
                    //               textAlign: TextAlign.center,
                    //               style: TextStyle(
                    //                 color: ColorConstant.gray500,
                    //                 fontSize: getFontSize(
                    //                   13,
                    //                 ),
                    //                 fontFamily: 'Poppins',
                    //                 fontWeight: FontWeight.w500,
                    //               ),
                    //             ),
                    //           ),
                    //           GestureDetector(
                    //               onTap: (){
                    //                 setState(() {
                    //                   uploaded=true;
                    //                   upload=false;
                    //                   uploading=false;
                    //                 });
                    //               },
                    //               child:Padding(
                    //                 padding:  EdgeInsets.only(
                    //                     top: getVerticalSize(24)
                    //                 ),
                    //                 child: Center(child: CircularProgressIndicator(
                    //                   color: ColorConstant.teal600,
                    //                   backgroundColor: ColorConstant.whiteA700,
                    //                 ),),
                    //               )
                    //
                    //
                    //           ),
                    //
                    //
                    //
                    //           Padding(
                    //             padding: EdgeInsets.only(
                    //               left: getHorizontalSize(
                    //                 58.00,
                    //               ),
                    //               top: getVerticalSize(
                    //                 48.00,
                    //               ),
                    //               right: getHorizontalSize(
                    //                 58.00,
                    //               ),
                    //               bottom: getVerticalSize(
                    //                 40.00,
                    //               ),
                    //             ),
                    //             child: Text(
                    //               "Uploading",
                    //               overflow: TextOverflow.ellipsis,
                    //               textAlign: TextAlign.start,
                    //               style: TextStyle(
                    //                 color:isDark?Colors.white: ColorConstant.gray900,
                    //                 fontSize: getFontSize(
                    //                   16,
                    //                 ),
                    //                 fontFamily: 'Poppins',
                    //                 fontWeight: FontWeight.w500,
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //
                    //
                    //     ),
                    //   )
                    // else if(uploaded)
                    //     Padding(
                    //       padding:  EdgeInsets.only(top: getVerticalSize(16)),
                    //       child: DottedBorder(
                    //         color: ColorConstant.teal600,
                    //
                    //
                    //         borderType: BorderType.RRect,
                    //         radius: Radius.circular(getHorizontalSize(16)),
                    //         dashPattern: [10,3,10,3],
                    //         child:
                    //
                    //         Column(
                    //           mainAxisSize: MainAxisSize.min,
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Container(
                    //               width: getHorizontalSize(
                    //                 211.00,
                    //               ),
                    //               margin: EdgeInsets.only(
                    //                 left: getHorizontalSize(
                    //                   32.00,
                    //                 ),
                    //                 top: getVerticalSize(
                    //                   40.00,
                    //                 ),
                    //                 right: getHorizontalSize(
                    //                   32.00,
                    //                 ),
                    //               ),
                    //               child: Text(
                    //                 "Upload your CV or Resume and use it when you apply for jobs",
                    //                 maxLines: null,
                    //                 textAlign: TextAlign.center,
                    //                 style: TextStyle(
                    //                   color: ColorConstant.gray500,
                    //                   fontSize: getFontSize(
                    //                     13,
                    //                   ),
                    //                   fontFamily: 'Poppins',
                    //                   fontWeight: FontWeight.w500,
                    //                 ),
                    //               ),
                    //             ),
                    //             Container(
                    //               height: getVerticalSize(
                    //                 85.00,
                    //               ),
                    //               width: getHorizontalSize(
                    //                 280.00,
                    //               ),
                    //               margin: EdgeInsets.only(
                    //                 left: getHorizontalSize(
                    //                   32.00,
                    //                 ),
                    //                 top: getVerticalSize(
                    //                   20.00,
                    //                 ),
                    //                 right: getHorizontalSize(
                    //                   26.00,
                    //                 ),
                    //               ),
                    //               child: Stack(
                    //                 alignment: Alignment.topRight,
                    //                 children: [
                    //                   Align(
                    //                     alignment: Alignment.bottomCenter,
                    //                     child: Container(
                    //                       margin: EdgeInsets.only(
                    //                         top: getVerticalSize(
                    //                           10.00,
                    //                         ),
                    //                         right: getHorizontalSize(
                    //                           6.00,
                    //                         ),
                    //                       ),
                    //                       decoration: BoxDecoration(
                    //                         color:isDark?ColorConstant.darkbutton: ColorConstant.gray100,
                    //                         borderRadius: BorderRadius.circular(
                    //                           getHorizontalSize(
                    //                             12.00,
                    //                           ),
                    //                         ),
                    //                       ),
                    //                       child: Row(
                    //                         crossAxisAlignment:
                    //                         CrossAxisAlignment.center,
                    //                         mainAxisSize: MainAxisSize.max,
                    //                         children: [
                    //                           Padding(
                    //                             padding: EdgeInsets.only(
                    //                               left: getHorizontalSize(
                    //                                 24.00,
                    //                               ),
                    //                               top: getVerticalSize(
                    //                                 16.00,
                    //                               ),
                    //                               bottom: getVerticalSize(
                    //                                 16.00,
                    //                               ),
                    //                             ),
                    //                             child: Container(
                    //                               height: getVerticalSize(
                    //                                 41.00,
                    //                               ),
                    //                               width: getHorizontalSize(
                    //                                 33.00,
                    //                               ),
                    //                               child: SvgPicture.asset(
                    //                                 ImageConstant.imgGroup135,
                    //                                 fit: BoxFit.fill,
                    //                               ),
                    //                             ),
                    //                           ),
                    //                           Padding(
                    //                             padding: EdgeInsets.only(
                    //                               left: getHorizontalSize(
                    //                                 16.00,
                    //                               ),
                    //                               top: getVerticalSize(
                    //                                 16.00,
                    //                               ),
                    //                               right: getHorizontalSize(
                    //                                 6.00,
                    //                               ),
                    //                               bottom: getVerticalSize(
                    //                                 16.00,
                    //                               ),
                    //                             ),
                    //                             child: Column(
                    //                               mainAxisSize: MainAxisSize.min,
                    //                               crossAxisAlignment:
                    //                               CrossAxisAlignment.start,
                    //                               mainAxisAlignment:
                    //                               MainAxisAlignment.start,
                    //                               children: [
                    //                                 Text(
                    //                                   "Dokkan Agency Portofolio",
                    //                                   overflow:
                    //                                   TextOverflow.ellipsis,
                    //                                   textAlign: TextAlign.start,
                    //                                   style: TextStyle(
                    //
                    //                                     fontSize: getFontSize(
                    //                                       14,
                    //                                     ),
                    //                                     fontFamily: 'Poppins',
                    //                                     fontWeight:
                    //                                     FontWeight.w500,
                    //                                   ),
                    //                                 ),
                    //                                 Padding(
                    //                                   padding: EdgeInsets.only(
                    //                                     top: getVerticalSize(
                    //                                       2.00,
                    //                                     ),
                    //                                     right: getHorizontalSize(
                    //                                       10.00,
                    //                                     ),
                    //                                   ),
                    //                                   child: Text(
                    //                                     "287 KB",
                    //                                     overflow:
                    //                                     TextOverflow.ellipsis,
                    //                                     textAlign: TextAlign.start,
                    //                                     style: TextStyle(
                    //                                       color: ColorConstant
                    //                                           .gray500,
                    //                                       fontSize: getFontSize(
                    //                                         11,
                    //                                       ),
                    //                                       fontFamily: 'Poppins',
                    //                                       fontWeight:
                    //                                       FontWeight.w400,
                    //                                     ),
                    //                                   ),
                    //                                 ),
                    //                               ],
                    //                             ),
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                   ),
                    //                   Align(
                    //                     alignment: Alignment.topRight,
                    //                     child: Container(
                    //                       height: getSize(
                    //                         24.00,
                    //                       ),
                    //                       width: getSize(
                    //                         24.00,
                    //                       ),
                    //                       margin: EdgeInsets.only(
                    //                         left: getHorizontalSize(
                    //                           10.00,
                    //                         ),
                    //                         bottom: getVerticalSize(
                    //                           10.00,
                    //                         ),
                    //                       ),
                    //                       decoration: BoxDecoration(
                    //                         color: ColorConstant.gray50,
                    //                         borderRadius: BorderRadius.circular(
                    //                           getHorizontalSize(
                    //                             12.00,
                    //                           ),
                    //                         ),
                    //                         border: Border.all(
                    //                           color:isDark?ColorConstant.darkBg: ColorConstant.bluegray100,
                    //                           width: getHorizontalSize(
                    //                             1.00,
                    //                           ),
                    //                         ),
                    //                       ),
                    //                       child: Stack(
                    //                         children: [
                    //                           Align(
                    //                             alignment: Alignment.center,
                    //                             child: Padding(
                    //                               padding: EdgeInsets.only(
                    //                                 left: getHorizontalSize(
                    //                                   6.00,
                    //                                 ),
                    //                                 top: getVerticalSize(
                    //                                   6.00,
                    //                                 ),
                    //                                 right: getHorizontalSize(
                    //                                   6.00,
                    //                                 ),
                    //                                 bottom: getVerticalSize(
                    //                                   6.00,
                    //                                 ),
                    //                               ),
                    //                               child: Container(
                    //                                 height: getSize(
                    //                                   12.00,
                    //                                 ),
                    //                                 width: getSize(
                    //                                   12.00,
                    //                                 ),
                    //                                 child: SvgPicture.asset(
                    //                                   ImageConstant
                    //                                       .imgAkariconscros6,
                    //                                   fit: BoxFit.fill,
                    //                                 ),
                    //                               ),
                    //                             ),
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //             Padding(
                    //               padding: EdgeInsets.only(
                    //                 left: getHorizontalSize(
                    //                   32.00,
                    //                 ),
                    //                 top: getVerticalSize(
                    //                   32.00,
                    //                 ),
                    //                 right: getHorizontalSize(
                    //                   32.00,
                    //                 ),
                    //                 bottom: getVerticalSize(
                    //                   40.00,
                    //                 ),
                    //               ),
                    //               child: Container(
                    //                 alignment: Alignment.center,
                    //                 height: getVerticalSize(
                    //                   56.00,
                    //                 ),
                    //                 width: getHorizontalSize(
                    //                   184.00,
                    //                 ),
                    //                 decoration: BoxDecoration(
                    //                   color: ColorConstant.teal600,
                    //                   borderRadius: BorderRadius.circular(
                    //                     getHorizontalSize(
                    //                       16.00,
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 child: Text(
                    //                   "Add More",
                    //                   textAlign: TextAlign.center,
                    //                   style: TextStyle(
                    //                     color: ColorConstant.whiteA700,
                    //                     fontSize: getFontSize(
                    //                       16,
                    //                     ),
                    //                     fontFamily: 'Poppins',
                    //                     fontWeight: FontWeight.w500,
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //
                    //       ),
                    //     )
                  ],
                ),
              ),
              customColumn(
                  title: "E-mail",
                  height: 45.0,
                  width: MediaQuery.of(context).size.width,
                  hint: "Email",
                  controller: txtEmail),
              SizedBox(
                height: 20,
              ),
              customRow(controllerFist: txtFName, controllerLast: txtLName),
              SizedBox(
                height: 20,
              ),
              customColumn(
                  title: "Phone Number",
                  height: 45.0,
                  width: MediaQuery.of(context).size.width,
                  hint: "0331913464",
                  controller: txtPhone),
              SizedBox(
                height: 20,
              ),
              customColumn(
                  title: "Birthday",
                  height: 45.0,
                  width: MediaQuery.of(context).size.width,
                  hint: "01/01/2002",
                  controller: txtBirth),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Biography",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    // color: Colors.blueGrey.withOpacity(0.5),
                    ),
                child: TextFormField(
                  controller: txtBio,
                  minLines: 1,
                  maxLines: 3,
                  decoration: InputDecoration(
                    //focusedBorder: InputBorder.none,
                    //border: InputBorder.none,
                    fillColor: Colors.transparent,
                    hintText: "Biography",
                    hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
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
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  customColumn(
      {final title,
      final hint,
      required,
      var height,
      var width,
      var controller}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
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
            decoration: BoxDecoration(),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                fillColor: Colors.white.withOpacity(0.5),
                hintText: hint,
                hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.5),
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }

  customRow({var width, var controllerFist, controllerLast}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        customColumn(
            title: "First Name",
            height: 45.0,
            width: 140.0,
            hint: "Khalid",
            controller: controllerFist),
        customColumn(
            title: "Last Name",
            height: 45.0,
            width: 140.0,
            hint: "Khan",
            controller: controllerLast),
      ],
    );
  }
}
