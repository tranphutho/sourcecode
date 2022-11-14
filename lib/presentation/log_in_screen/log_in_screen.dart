import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hires/core/app_export.dart';
import 'package:hires/models/user_model.dart';
import 'package:hires/presentation/forgot_password_page/forgot_password_page.dart';
import 'package:hires/presentation/home_screen/home_screen.dart';
import 'package:hires/presentation/register_screen/register_screen.dart';
import 'package:hires/presentation/register_screen/widgets/white_jobs_logo_section.dart';
import 'package:hires/presentation/verify_screen/verify_screen.dart';
import 'package:hires/services/login_sevice.dart';
import 'package:provider/provider.dart';

import '../../core/utils/common_utils.dart';

class LogInScreen extends StatefulWidget {
  static String id = "LogInScreen";

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool obscure1 = true;
  TextEditingController? emailTxtControler;
  TextEditingController? pwdTxtControler;
  bool isLoading = false;

  @override
  void initState() {
    emailTxtControler = TextEditingController(text: '');
    pwdTxtControler = TextEditingController(text: '');
    super.initState();
  }

  @override
  void dispose() {
    emailTxtControler!.dispose();
    pwdTxtControler!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
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
                        top: getVerticalSize(
                          16.00,
                        ),
                        bottom: getVerticalSize(
                          20.00,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: context.locale == Constants.engLocal
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  18.00,
                                ),
                                right: getHorizontalSize(
                                  18.00,
                                ),
                                bottom: getVerticalSize(30.00)
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
                                        color: isDark
                                            ? Colors.white
                                            : Colors.black)),
                              ),
                            ),
                          ),
                          logoSection(),
                          Align(
                            alignment: context.locale == Constants.engLocal
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  24.00,
                                ),
                                top: getVerticalSize(
                                  7.00,
                                ),
                                right: getHorizontalSize(
                                  24.00,
                                ),
                              ),
                              child: Text(
                                "Welcome Back 👋",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: getFontSize(
                                    24,
                                  ),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: context.locale == Constants.engLocal
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  24.00,
                                ),
                                top: getVerticalSize(
                                  7.00,
                                ),
                                right: getHorizontalSize(
                                  24.00,
                                ),
                              ),
                              child: Text(
                                "Let’s log in. Apply to jobs!",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: ColorConstant.gray9007e,
                                  fontSize: getFontSize(
                                    14,
                                  ),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                24.00,
                              ),
                              top: getVerticalSize(
                                47.00,
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
                              child: TextFormField(
                                controller: emailTxtControler,
                                decoration: InputDecoration(
                                  //hintText: 'admin@dokkan.agency',
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
                                              ImageConstant.imgMailoutline1,
                                              fit: BoxFit.contain,
                                              color: Colors.white,
                                            )
                                          : SvgPicture.asset(
                                              ImageConstant.imgMailoutline1,
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
                                  fontSize: getFontSize(
                                    14.0,
                                  ),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Padding(
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
                              child: TextFormField(
                                controller: pwdTxtControler,
                                obscureText: obscure1,
                                decoration: InputDecoration(
                                  //hintText: '***********',
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
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: getHorizontalSize(16)),
                                    child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            obscure1 = !obscure1;
                                          });
                                        },
                                        child: obscure1
                                            ? Icon(
                                                Icons.visibility_off_outlined,
                                                color: isDark
                                                    ? Colors.white
                                                    : ColorConstant.black900)
                                            : Icon(
                                                Icons.visibility_outlined,
                                                color: isDark
                                                    ? Colors.white
                                                    : ColorConstant.black900,
                                              )),
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
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  18.00,
                                ),
                                top: getVerticalSize(
                                  32.00,
                                ),
                                right: getHorizontalSize(
                                  18.00,
                                ),
                              ),
                              child: StatefulBuilder(
                                builder: (BuildContext context,
                                        void Function(void Function())
                                            setState) =>
                                    GestureDetector(
                                  onTap: () async {
                                    if (!isLoading) {
                                      if (emailTxtControler!.text
                                              .trim()
                                              .isEmpty ||
                                          pwdTxtControler!.text
                                              .trim()
                                              .isEmpty) {
                                        String mssg = '';
                                        if (emailTxtControler!.text
                                            .trim()
                                            .isEmpty)
                                          mssg = Constants.mssgErrEntrEmail;
                                        else if (pwdTxtControler!.text
                                            .trim()
                                            .isEmpty)
                                          mssg = Constants.mssgErrEntrPwd;
                                        getToastMessage(mssg, Colors.red);
                                      } else {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        UserProvider logProvide =
                                            Provider.of<UserProvider>(context,
                                                listen: false);
                                        await logProvide.signIn(
                                            emailTxtControler!.text,
                                            pwdTxtControler!.text);

                                        setState(() {
                                          isLoading = false;
                                        });

                                        if (logProvide.userApp != null &&
                                            logProvide
                                                .userApp!.token!.isNotEmpty)
                                          Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              HomeScreen.id,
                                              (route) => false);
                                        else {
                                          if (logProvide.mssgLogin ==
                                              Constants.mssgErrVerifyEmail)
                                            Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                VerifyScreen.id,
                                                (route) => false);
                                        }
                                      }
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
                                            "Log in",
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
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  18.00,
                                ),
                                top: getVerticalSize(
                                  40.00,
                                ),
                                right: getHorizontalSize(
                                  18.00,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, ForgotPasswordPage.id);
                                },
                                child: Text(
                                  "Forgot Password?",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: ColorConstant.teal600,
                                    fontSize: getFontSize(
                                      15,
                                    ),
                                    fontFamily: 'Circular Std',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Align(
                          //   alignment: Alignment.center,
                          //   child: Padding(
                          //     padding: EdgeInsets.only(
                          //       left: getHorizontalSize(
                          //         18.00,
                          //       ),
                          //       top: getVerticalSize(
                          //         48.00,
                          //       ),
                          //       right: getHorizontalSize(
                          //         18.00,
                          //       ),
                          //     ),
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.start,
                          //       crossAxisAlignment: CrossAxisAlignment.center,
                          //       mainAxisSize: MainAxisSize.max,
                          //       children: [
                          //         Container(
                          //           height: getVerticalSize(
                          //             0.50,
                          //           ),
                          //           width: getHorizontalSize(
                          //             98.00,
                          //           ),
                          //           margin: EdgeInsets.only(
                          //             top: getVerticalSize(
                          //               8.00,
                          //             ),
                          //             bottom: getVerticalSize(
                          //               7.50,
                          //             ),
                          //           ),
                          //           decoration: BoxDecoration(
                          //             color: ColorConstant.gray400,
                          //           ),
                          //         ),
                          //         Padding(
                          //           padding: EdgeInsets.only(
                          //             left: getHorizontalSize(
                          //               16.00,
                          //             ),
                          //           ),
                          //           child: Text(
                          //             "Or continue with",
                          //             overflow: TextOverflow.ellipsis,
                          //             textAlign: TextAlign.center,
                          //             style: TextStyle(
                          //               color: ColorConstant.gray400,
                          //               fontSize: getFontSize(
                          //                 13,
                          //               ),
                          //               fontFamily: 'Circular Std',
                          //               fontWeight: FontWeight.w400,
                          //             ),
                          //           ),
                          //         ),
                          //         Container(
                          //           height: getVerticalSize(
                          //             0.50,
                          //           ),
                          //           width: getHorizontalSize(
                          //             98.00,
                          //           ),
                          //           margin: EdgeInsets.only(
                          //             left: getHorizontalSize(
                          //               16.00,
                          //             ),
                          //             top: getVerticalSize(
                          //               8.00,
                          //             ),
                          //             bottom: getVerticalSize(
                          //               7.50,
                          //             ),
                          //           ),
                          //           decoration: BoxDecoration(
                          //             color: ColorConstant.gray400,
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // Align(
                          //   alignment: Alignment.center,
                          //   child: Padding(
                          //     padding: EdgeInsets.only(
                          //       left: getHorizontalSize(
                          //         10.00,
                          //       ),
                          //       top: getVerticalSize(
                          //         48.00,
                          //       ),
                          //       right: getHorizontalSize(
                          //         10.00,
                          //       ),
                          //     ),
                          //     child: Container(
                          //         height: getVerticalSize(
                          //           56.00,
                          //         ),
                          //         width: getHorizontalSize(
                          //           200.00,
                          //         ),
                          //         child: Row(
                          //           mainAxisAlignment:
                          //               MainAxisAlignment.spaceBetween,
                          //           children: [
                          //             Container(
                          //                 decoration: BoxDecoration(
                          //                     shape: BoxShape.circle,
                          //                     color: ColorConstant.whiteA700),
                          //                 padding: EdgeInsets.all(getSize(8)),
                          //                 child: SvgPicture.asset(
                          //                     ImageConstant.appleLogo)),
                          //             Container(
                          //                 decoration: BoxDecoration(
                          //                     shape: BoxShape.circle,
                          //                     color: ColorConstant.whiteA700),
                          //                 padding: EdgeInsets.all(getSize(8)),
                          //                 child: SvgPicture.asset(
                          //                     ImageConstant.googleLogo)),
                          //             Container(
                          //                 decoration: BoxDecoration(
                          //                     shape: BoxShape.circle,
                          //                     color: ColorConstant.whiteA700),
                          //                 padding: EdgeInsets.all(getSize(8)),
                          //                 child: SvgPicture.asset(
                          //                     ImageConstant.facebookLogo)),
                          //           ],
                          //         )),
                          //   ),
                          // ),
                          Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, RegisterScreen.id);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: getHorizontalSize(
                                    18.00,
                                  ),
                                  top: getVerticalSize(
                                    48.00,
                                  ),
                                  right: getHorizontalSize(
                                    18.00,
                                  ),
                                ),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Haven’t an account? ',
                                        style: TextStyle(
                                          color: ColorConstant.gray401,
                                          fontSize: getFontSize(
                                            14,
                                          ),
                                          fontFamily: 'Circular Std',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Register',
                                        style: TextStyle(
                                          color: ColorConstant.teal600,
                                          fontSize: getFontSize(
                                            14,
                                          ),
                                          fontFamily: 'Circular Std',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
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
