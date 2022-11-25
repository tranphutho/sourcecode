import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hires/core/constants/constants.dart';
import 'package:hires/core/utils/color_constant.dart';
import 'package:hires/core/utils/image_constant.dart';
import 'package:hires/core/utils/math_utils.dart';
import 'package:hires/models/applicant_detail_model.dart';
import 'package:hires/models/user_model.dart';
import 'package:hires/presentation/add_new_job_screen/add_new_job_screen.dart';
import 'package:hires/presentation/applications_screen/applications_screen.dart';
import 'package:hires/presentation/candidates_screen/candidates_screen.dart';
import 'package:hires/presentation/companies_screen/companies_screen.dart';
import 'package:hires/presentation/company_profile/company_profile.dart';
import 'package:hires/presentation/employers_screen/employers_screen.dart';
import 'package:hires/presentation/following_employer_screen/following_employer_screen.dart';
import 'package:hires/presentation/homepage_3_screen/widgets/custom_employer_nav_div.dart';
import 'package:hires/presentation/log_in_screen/log_in_screen.dart';
import 'package:hires/presentation/managa_job_screen/manage_jobs_screen.dart';
import 'package:hires/presentation/manage_applicants_screen/manage_applicants_screen.dart';
import 'package:hires/presentation/my_contact_screen/my_contact_screen.dart';
import 'package:hires/presentation/my_profile/candidate_profile.dart';
import 'package:hires/presentation/profile_style_1_screen/profile_style_1_screen.dart';
import 'package:hires/presentation/shortlisted_resumes_screen/shortlisted_resumes_screen.dart';
import 'package:hires/presentation/web_view_screen/web_view_screen.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

drawerWidget({
  required final isDark,
  required final usePrv,
  required final context,
}) {
  return Drawer(
      backgroundColor:
      isDark ? ColorConstant.darkBg : ColorConstant.whiteA700,
      child: Padding(
        padding: EdgeInsets.only(
          top: getVerticalSize(50),
          left: getHorizontalSize(
            24.00,
          ),
          right: getHorizontalSize(
            24.00,
          )

        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: getSize(
                          20.00,
                        ),
                        width: getSize(
                          20.00,
                        ),
                        child: SvgPicture.asset(
                          ImageConstant.imgAkariconscros1,
                          fit: BoxFit.fill,
                          color: Colors.transparent,
                        ),
                      ),
                      Column(
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
                                16.00,
                              ),
                              right: getHorizontalSize(
                                16.00,
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
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        getSize(
                                          52.00,
                                        ),
                                      ),
                                      child: Image.asset(
                                        ImageConstant.imgChristinawocin,
                                        height: getSize(
                                          104.00,
                                        ),
                                        width: getSize(
                                          104.00,
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        bottom: getVerticalSize(
                                          0.64,
                                        ),
                                      ),
                                      child: Container(
                                        height: getVerticalSize(
                                          103.36,
                                        ),
                                        width: getHorizontalSize(
                                          104.00,
                                        ),
                                        //PHUTHO
                                        child: SvgPicture.asset(
                                          ImageConstant.imgMaskgroup3,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: getVerticalSize(
                                  12.00,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    usePrv.name ?? '',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: getFontSize(
                                        20,
                                      ),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: getHorizontalSize(
                                        4.00,
                                      ),
                                      top: getVerticalSize(
                                        4.00,
                                      ),
                                      bottom: getVerticalSize(
                                        3.00,
                                      ),
                                    ),
                                    child: Container(
                                      height: getSize(
                                        12.00,
                                      ),
                                      width: getSize(
                                        12.00,
                                      ),
                                      child: SvgPicture.asset(
                                        ImageConstant.imgIcroundverifi,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          SizedBox(width:180,height:40,child: Html(data:usePrv.bio,style: {
                            "padding":Style(padding: EdgeInsets.all(0),margin: EdgeInsets.zero)
                          },)),

                          Padding(
                            padding: EdgeInsets.only(
                              top: getVerticalSize(4),
                            ),
                            child: GestureDetector(
                              onTap: () async {
                                Navigator.pushNamed(
                                    context, CandidateProfileScreen.id
                                );
                                return;
                                //PHUTHO
                                ApplicantDetailModelProvider
                                applicantDetail = Provider.of<
                                    ApplicantDetailModelProvider>(
                                    context,
                                    listen: false);

                                if (usePrv.role_id == 3) {
                                  Provider.of<ApplicantDetailModelProvider>(
                                      context,
                                      listen: false)
                                      .getApplicantDetail(
                                      usePrv.id!, usePrv.token!)
                                      .then((_) {
                                    Navigator.pushNamed(
                                        context, ProfileStyle1Screen.id);
                                  });
                                  // await applicantDetail
                                  //     .getApplicantDetail(
                                  //         usePrv.id!, usePrv.token!);
                                  // Navigator.pushNamed(
                                  //     context, ProfileStyle1Screen.id);
                                } else {
                                  Navigator.pushNamed(
                                      context, CompanyProfile.id);
                                }
                              },
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "View Profile",
                                    overflow: TextOverflow.ellipsis,
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
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: getHorizontalSize(16)),
                          child: Container(
                            height: getSize(
                              20.00,
                            ),
                            width: getSize(
                              20.00,
                            ),
                            child: SvgPicture.asset(
                              ImageConstant.imgAkariconscros1,
                              fit: BoxFit.fill,
                              color: isDark ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: getVerticalSize(16)),
                    child: GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: getSize(
                              20.00,
                            ),
                            width: getSize(
                              20.00,
                            ),
                            child: SvgPicture.asset(
                              ImageConstant.imgGroup187,
                              fit: BoxFit.fill,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, CandidateProfileScreen.id
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getHorizontalSize(12)),
                              child: Text(
                                "My Profile",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: getFontSize(
                                    15,
                                  ),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  usePrv.role_id!=Constants.candidateRoleId?   Padding(
                    padding: EdgeInsets.only(top: getVerticalSize(16)),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, CompanyProfile.id);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: getVerticalSize(
                              21.00,
                            ),
                            width: getHorizontalSize(
                              16.00,
                            ),
                            child: Icon(Icons.person),
                          ),
                       Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: getHorizontalSize(12),
                            ),
                            child: Text(
                              "Company Profile",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: getFontSize(
                                  15,
                                ),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ):SizedBox(),
                  usePrv.role_id==Constants.candidateRoleId?   Padding(
                    padding: EdgeInsets.only(top: getVerticalSize(16)),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, ApplicationsScreen.id);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: getVerticalSize(
                              21.00,
                            ),
                            width: getHorizontalSize(
                              16.00,
                            ),
                            child: SvgPicture.asset(
                              ImageConstant.imgVector4,
                              fit: BoxFit.fill,
                            ),
                          ),
                       Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: getHorizontalSize(12),
                            ),
                            child: Text(
                              "Applied Jobs",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: getFontSize(
                                  15,
                                ),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ):SizedBox(),
                  customEmployerNavBuilder(
                      title: "Manage Jobs",
                      usePrv: usePrv,
                      onTap: () =>
                          Navigator.of(context).pushNamed(ManageJobsScreen.id),
                      icon: Icon(Icons.event_note_rounded, color: Colors.grey.shade400,)
                  ),

                  customEmployerNavBuilder(
                      title: "Manage Applicants",
                      usePrv: usePrv,
                      onTap: () =>
                          Navigator.of(context).pushNamed(ManageApplicantsScreen.id),
                      icon: Icon(Icons.wallet_giftcard, color: Colors.grey.shade400,)
                  ),
                  Builder(builder: (context) {
                    if (usePrv.role_id != 3)
                      return Container();
                    else
                      return Padding(
                        padding:
                        EdgeInsets.only(top: getVerticalSize(16)),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, FollowingEmployerScreen.id);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                height: getVerticalSize(
                                  20.00,
                                ),
                                width: getHorizontalSize(
                                  16.50,
                                ),
                                child: SvgPicture.asset(
                                  ImageConstant.imgGroup4,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: getHorizontalSize(12),
                                ),
                                child: Text(
                                  "Following Employers",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: getFontSize(
                                      15,
                                    ),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                  }),
                  customEmployerNavBuilder(
                      title: "Shortlisted Resumes",
                      usePrv: usePrv,
                      onTap: () {
                        Navigator.pushNamed(context, ShortlistedResumesScreen.id);
                      },
                      icon: Icon(
                        CupertinoIcons.rectangle_stack_person_crop_fill,
                        color: Colors.grey.shade400,
                      )
                  ),
                  customEmployerNavBuilder(
                      title: "My Contact",
                      usePrv: usePrv,
                      onTap: () {
                        Navigator.pushNamed(context, MyContactScreen.id);
                      },
                      icon: Icon(
                        Icons.contact_mail_outlined,
                        color: Colors.grey.shade400,
                      )
                  ),
                  usePrv.role_id==Constants.candidateRoleId?     Padding(
                    padding: EdgeInsets.only(top: getVerticalSize(16)),
                    child: GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: getSize(
                              20.00,
                            ),
                            width: getSize(
                              20.00,
                            ),
                            child: Icon(CupertinoIcons.person_2, color: Colors.black38,)
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, CandidatesScreen.id
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getHorizontalSize(12)),
                              child: Text(
                                "Candidates",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: getFontSize(
                                    15,
                                  ),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ):SizedBox(),
                  usePrv.role_id==Constants.candidateRoleId?   Padding(
                    padding: EdgeInsets.only(top: getVerticalSize(16)),
                    child: GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                              height: getSize(
                                20.00,
                              ),
                              width: getSize(
                                20.00,
                              ),
                              child: Icon(CupertinoIcons.desktopcomputer, color: Colors.black38,)
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, EmployersScreen.id
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getHorizontalSize(12)),
                              child: Text(
                                "Employers",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: getFontSize(
                                    15,
                                  ),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ):SizedBox(),
                  Padding(
                    padding: EdgeInsets.only(top: getVerticalSize(16)),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (c)=>WebViewScreen(url:Constants.privacyPolicyUrl)));

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: getVerticalSize(
                                3.00,
                              ),
                              bottom: getVerticalSize(
                                3.33,
                              ),
                            ),
                            child: Container(
                              height: getVerticalSize(
                                16.67,
                              ),
                              width: getHorizontalSize(
                                20.00,
                              ),
                              child: Icon(Icons.person,color: Colors.grey,),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                14.00,
                              ),
                              right: getHorizontalSize(
                                14.00,
                              ),
                            ),
                            child: Text(
                              "About us",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: getFontSize(
                                  15,
                                ),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: getVerticalSize(16)),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (c)=>WebViewScreen(url:Constants.contactUrl)));

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: getVerticalSize(
                                3.00,
                              ),
                              bottom: getVerticalSize(
                                3.33,
                              ),
                            ),
                            child: Container(
                              height: getVerticalSize(
                                16.67,
                              ),
                              width: getHorizontalSize(
                                20.00,
                              ),
                              child: Icon(Icons.call,color: Colors.grey,),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                14.00,
                              ),
                              right: getHorizontalSize(
                                14.00,
                              ),
                            ),
                            child: Text(
                              "Contact Us",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: getFontSize(
                                  15,
                                ),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: getVerticalSize(16)),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (c)=>WebViewScreen(url:Constants.termsConditionsUrl)));

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: getVerticalSize(
                                3.00,
                              ),
                              bottom: getVerticalSize(
                                3.33,
                              ),
                            ),
                            child: Container(
                              height: getVerticalSize(
                                16.67,
                              ),
                              width: getHorizontalSize(
                                20.00,
                              ),
                              child: Icon(Icons.contact_page_rounded,color: Colors.grey,),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                14.00,
                              ),
                              right: getHorizontalSize(
                                14.00,
                              ),
                            ),
                            child: Text(
                              "Terms & Conditions",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: getFontSize(
                                  15,
                                ),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: getVerticalSize(16)),
                    child: GestureDetector(
                      onTap: () {
launchUrl(Uri.parse("http://play.google.com/store/apps/details?id=${Constants.packageName}"));

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: getVerticalSize(
                                3.00,
                              ),
                              bottom: getVerticalSize(
                                3.33,
                              ),
                            ),
                            child: Container(
                              height: getVerticalSize(
                                16.67,
                              ),
                              width: getHorizontalSize(
                                20.00,
                              ),
                              child: Icon(Icons.star,color: Colors.grey,),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                14.00,
                              ),
                              right: getHorizontalSize(
                                14.00,
                              ),
                            ),
                            child: Text(
                              "Terms & Conditions",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: getFontSize(
                                  15,
                                ),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: getVerticalSize(16)),
                    child: GestureDetector(
                      onTap: () {
                        Share.share('http://play.google.com/store/apps/details?id=${Constants.packageName}');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: getVerticalSize(
                                3.00,
                              ),
                              bottom: getVerticalSize(
                                3.33,
                              ),
                            ),
                            child: Container(
                              height: getVerticalSize(
                                16.67,
                              ),
                              width: getHorizontalSize(
                                20.00,
                              ),
                              child: Icon(Icons.share,color: Colors.grey,),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                14.00,
                              ),
                              right: getHorizontalSize(
                                14.00,
                              ),
                            ),
                            child: Text(
                              "Share App",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: getFontSize(
                                  15,
                                ),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: getVerticalSize(16)),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: Container(
                                height: getVerticalSize(200),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.end,
                                  children: [
                                    Icon(Icons.logout,
                                        color: ColorConstant.redA700),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: getVerticalSize(30)),
                                      child: Text(
                                        "Logout From your account?",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: getFontSize(16),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: getHorizontalSize(50),
                                        right: getHorizontalSize(50),
                                        top: getVerticalSize(50),
                                        bottom: getVerticalSize(20)),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize:
                                                getFontSize(16),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              UserProvider provUser =
                                              Provider.of<
                                                UserProvider>(
                                                context,
                                                listen: false);
                                              await provUser.logout();
                                              if (provUser.userApp == null)
                                                Navigator
                                                  .pushNamedAndRemoveUntil(
                                                    context,
                                                    LogInScreen.id, (route) => false
                                                  );
                                            },
                                            child: Text(
                                              "Logout",
                                              style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize:
                                                getFontSize(16),
                                                color: Colors.red),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: getVerticalSize(
                                3.00,
                              ),
                              bottom: getVerticalSize(
                                3.33,
                              ),
                            ),
                            child: Container(
                              height: getVerticalSize(
                                16.67,
                              ),
                              width: getHorizontalSize(
                                20.00,
                              ),
                              child: SvgPicture.asset(
                                ImageConstant.imgGroup191,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                14.00,
                              ),
                              right: getHorizontalSize(
                                14.00,
                              ),
                            ),
                            child: Text(
                              "Logout",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: ColorConstant.redA700,
                                fontSize: getFontSize(
                                  15,
                                ),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
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
            Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(onPressed: (){Navigator.of(context).pushNamed(AddNewJobScreen.id);}, child: Row(
              children: [
                Icon(Icons.add),
                Text("Add New Job"),
              ],
            ),style: ElevatedButton.styleFrom(primary: Colors.lightGreen,elevation: 0,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),),
          ],
        )
          ],
        ),
      )
  );
}