import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hires/core/app_export.dart';
import 'package:hires/core/utils/common_utils.dart';
import 'package:hires/models/user_model.dart';
import 'package:hires/presentation/log_in_screen/log_in_screen.dart';
import 'package:hires/presentation/register_screen/widgets/custom_button.dart';
import 'package:hires/presentation/register_screen/widgets/white_jobs_logo_section.dart';
import 'package:hires/presentation/verify_screen/verify_screen.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static String id="RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscure1=true;
  bool obscure2=true;
  late TextEditingController txtEmail;
  late TextEditingController txtPhoneNum;
  late TextEditingController txtPwd  ;
  late TextEditingController txtPwdC ;
  bool isLoading = false;
  bool isCandidate = true;
  bool isEmployer = false;

  @override
  void initState() {
    // TODO: implement initState
    txtEmail = TextEditingController(text:'');
    txtPhoneNum = TextEditingController(text:'');
    txtPwd   = TextEditingController(text:'');
    txtPwdC  = TextEditingController(text:'');
    super.initState();
  }

  @override
  void dispose() {
    txtEmail.dispose();
    txtPhoneNum.dispose();
    txtPwd.dispose();
    txtPwdC.dispose();
    super.dispose();
  }

  candidateOnPressed() {
    setState(() {
      isCandidate = true;
      isEmployer = false;
    });
  }

  employerOnPressed() {
    setState(() {
      isCandidate = false;
      isEmployer = true;
    });
  }


  @override
  Widget build(BuildContext context) {
    bool isDark =Theme.of(context).brightness==Brightness.dark;
    
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: getVerticalSize(
                        16.00,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        logoSection(),
                        Align(
                           alignment:context.locale==Constants.engLocal? 
                            Alignment.centerLeft:Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                24.00,
                              ),
                              top: getVerticalSize(
                                20.00,
                              ),
                              right: getHorizontalSize(
                                24.00,
                              ),
                            ),
                            child: Text(
                              "Registration 👍",
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
                          alignment:context.locale==Constants.engLocal? 
                            Alignment.centerLeft:Alignment.centerRight,
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
                              "Let’s Register. Apply to jobs!",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color:isDark?Colors.white: ColorConstant.gray9007e,
                                fontSize: getFontSize(
                                  14,
                                ),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: getVerticalSize(
                        30.00,
                      ),
                      width: getHorizontalSize(
                        327.00,
                      ),
                      margin: EdgeInsets.only(
                        left: getHorizontalSize(
                          24.00,
                        ),
                        top: getVerticalSize(
                          31.00,
                        ),
                        right: getHorizontalSize(
                          24.00,
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            height: getVerticalSize(
                              52.00,
                            ),
                            width: getHorizontalSize(
                              327.00,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customButton(
                                title: "Candidate",
                                onPressed: candidateOnPressed,
                                isSelected: isCandidate,
                                icon: isCandidate != true
                                    ? Icon(CupertinoIcons.person, color: ColorConstant.teal600)
                                    : Icon(CupertinoIcons.person, color: ColorConstant.whiteA700)

                            ),
                            customButton(
                                title: "Employer",
                                onPressed: employerOnPressed,
                                isSelected: isEmployer,
                                icon: isEmployer != true
                                    ? Icon(CupertinoIcons.briefcase, color: ColorConstant.teal600)
                                    : Icon(CupertinoIcons.briefcase, color: ColorConstant.whiteA700)
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: getVerticalSize(50),
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
                                  child:isDark? SvgPicture.asset(
                                    ImageConstant.imgMailoutline11,
                                    fit: BoxFit.contain,
                                    color: Colors.white,

                                  ): SvgPicture.asset(
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
                        child:   Padding(
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
                              controller: txtPhoneNum,
                              decoration: InputDecoration(
                                hintText: 'Phone Number',
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
                                  child:Container(
                                    height: getSize(
                                      20.00,
                                    ),
                                    width: getSize(
                                      19.00,
                                    ),
                                    child:isDark
                                        ? Icon(CupertinoIcons.phone, color: Colors.white,)
                                        : Icon(CupertinoIcons.phone)
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
                        child:   Padding(
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
                              controller: txtPwd,
                              obscureText: obscure1,
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
                                  child:Container(
                                    height: getSize(
                                      20.00,
                                    ),
                                    width: getSize(
                                      19.00,
                                    ),
                                    child:isDark? SvgPicture.asset(
                                      ImageConstant.imgPassword613,
                                      fit: BoxFit.contain,
                                      color: Colors.white,
                                    ):SvgPicture.asset(
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
                                      padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(16)),
                                      child: GestureDetector(
                                            onTap: (){
                                              setState(() {
                                                obscure1=!obscure1;
                                              });
                                            },
                                            child:obscure1? Icon(Icons.visibility_off_outlined,color:isDark?Colors.white: ColorConstant.black900)
                                                :Icon(Icons.visibility_outlined,color:isDark?Colors.white: ColorConstant.black900,)),
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
                            onTap: ()async{
                             if(!isLoading) {
                                if(txtEmail.text.trim().isEmpty ||
                                  txtPwd.text.trim().isEmpty || txtPwd.text != txtPwdC.text){

                                  String mssg = '';
                                  if(txtEmail.text.trim().isEmpty) mssg = Constants.mssgErrEntrEmail;
                                  else if(txtPwd.text.trim().isEmpty)   mssg = Constants.mssgErrEntrPwd;
                                  else if(txtPwd.text != txtPwdC.text)  mssg = Constants.mssgErrDMatchPwds;
                                  getToastMessage(mssg, Colors.red);
                                }
                                else{
                                  setState(() {
                                    isLoading = true;
                                  });
                                  var prvSignUp = await Provider.of<UserProvider>(context,listen: false).signUp(txtEmail.text, txtPwd.text);

                                  setState(() {
                                    isLoading = false;
                                  });
                                  if(prvSignUp)
                                  Navigator.pushReplacementNamed(context, VerifyScreen.id);
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
                               ? CircularProgressIndicator(color: Colors.white,)
                               : Text(
                                "Register",
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
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap:() {
                            Navigator.pushNamed(context, LogInScreen.id);
                          },
                          child: Container(
                            margin: EdgeInsets.only(
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
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Have',
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
                                    text: ' ',
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
                                    text: 'an account? ',
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
                                    text: 'Log in',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
