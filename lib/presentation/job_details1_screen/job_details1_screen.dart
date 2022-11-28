import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hires/core/app_export.dart';
import 'package:hires/models/job_model.dart';
import 'package:hires/models/wishlist_model.dart';
import 'package:hires/presentation/apply_screen/apply_screen.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';

class JobDetails1Screen extends StatefulWidget {
  static String id = "JobDetails1Screen";

  @override
  State<JobDetails1Screen> createState() => _JobDetails1ScreenState();
}

class _JobDetails1ScreenState extends State<JobDetails1Screen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  Job? job;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    job = ModalRoute.of(context)!.settings.arguments as Job;
    UserModel usePrv = Provider.of<UserProvider>(
      context,
    ).userApp!;

    print(job);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(16)),
        child:usePrv.role_id==Constants.candidateRoleId? Container(
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
              onPressed: () {
                Navigator.pushNamed(context, ApplyScreen.id, arguments: job);
              },
              label: Text('Apply Now')),
        ):SizedBox(),
      ),
      body: SafeArea(
        child: Container(
          width: size.width,
          child: Container(
            margin: EdgeInsets.only(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: getVerticalSize(
                    281.92,
                  ),
                  width: size.width,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: getVerticalSize(
                            281.92,
                          ),
                          width: size.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(0),
                                bottom: Radius.circular(100)),
                            child: SvgPicture.asset(
                              ImageConstant.greenBg,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: getVerticalSize(
                            255.92,
                          ),
                          child: SvgPicture.asset(
                            ImageConstant.imgMaskgroup22,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: getHorizontalSize(
                              18.00,
                            ),
                            top: getVerticalSize(
                              15.92,
                            ),
                            right: getHorizontalSize(
                              18.00,
                            ),
                            bottom: getVerticalSize(
                              15.92,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        bottom: getVerticalSize(
                                          56.00,
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
                                                color: Colors.white)),
                                      ),
                                    ),
                                    Container(
                                      height: getSize(
                                        80.00,
                                      ),
                                      width: getSize(
                                        80.00,
                                      ),
                                      child: Image.network(
                                        job!.thumbnailImage != null
                                            ? job!.thumbnailImage!
                                            : "https://whitejobs.co.in/images/avatar.png",
                                        fit: BoxFit.fill,
                                      ),

                                    ),
                                    InkWell(
                                      onTap: () async {
                                        print("tôi bâm vào wishlist");

                                        WishlistProvider whislistProvider =
                                            Provider.of<WishlistProvider>(
                                                context,
                                                listen: false);
                                        await whislistProvider.addWishlist(
                                            job!.id!.toString(),
                                            usePrv.token!);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          top: getVerticalSize(
                                            0.50,
                                          ),
                                          bottom: getVerticalSize(
                                            56.50,
                                          ),
                                        ),
                                        child: Container(
                                          height: getSize(
                                            23.00,
                                          ),
                                          width: getSize(
                                            23.00,
                                          ),
                                          child: SvgPicture.asset(
                                            ImageConstant.imgFluentbookmark8,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      89.00,
                                    ),
                                    top: getVerticalSize(
                                      12.00,
                                    ),
                                    right: getHorizontalSize(
                                      83.00,
                                    ),
                                  ),
                                  child: Text(
                                    job!.title! ?? "",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: ColorConstant.whiteA700,
                                      fontSize: getFontSize(
                                        20,
                                      ),
                                      fontFamily: 'Circular Std',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      89.00,
                                    ),
                                    top: getVerticalSize(
                                      4.00,
                                    ),
                                    right: getHorizontalSize(
                                      89.00,
                                    ),
                                  ),
                                  child: Text(
                                    job!.company != null
                                        ? job!.company!.name! ?? ""
                                        : "",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorConstant.whiteA7009e,
                                      fontSize: getFontSize(
                                        15,
                                      ),
                                      fontFamily: 'Circular Std',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: getVerticalSize(
                                    16.00,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: getVerticalSize(
                                        26.00,
                                      ),
                                      width: getHorizontalSize(
                                        69.00,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorConstant.whiteA70026,
                                        borderRadius: BorderRadius.circular(
                                          getHorizontalSize(
                                            164.00,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        job!.category!.name! ?? "",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: ColorConstant.whiteA700,
                                          fontSize: getFontSize(
                                            11,
                                          ),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: getVerticalSize(
                                        26.00,
                                      ),
                                      width: getHorizontalSize(
                                        82.00,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorConstant.whiteA70026,
                                        borderRadius: BorderRadius.circular(
                                          getHorizontalSize(
                                            164.00,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        job!.jobType!.name! ?? "",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: ColorConstant.whiteA700,
                                          fontSize: getFontSize(
                                            11,
                                          ),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: getVerticalSize(
                                        26.00,
                                      ),
                                      width: getHorizontalSize(
                                        66.00,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorConstant.whiteA70026,
                                        borderRadius: BorderRadius.circular(
                                          getHorizontalSize(
                                            164.00,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        "Junior",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: ColorConstant.whiteA700,
                                          fontSize: getFontSize(
                                            11,
                                          ),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: getVerticalSize(
                                    24.00,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: getHorizontalSize(
                                          30.00,
                                        ),
                                      ),
                                      child: Text(
                                        "${Constants.currency}${job?.salaryMin ?? ""} - ${Constants.currency}${job?.salaryMax ?? ""}/${job!.salaryType!.substring(0, 1)}",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: ColorConstant.whiteA700,
                                          fontSize: getFontSize(
                                            16,
                                          ),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        right: getHorizontalSize(
                                          25.00,
                                        ),
                                      ),
                                      child: Text(
                                        "${job!.company != null ? job!.company!.city ?? " " : ""}, ${job!.company != null ? job!.company!.country ?? "" : ""}",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: ColorConstant.whiteA700,
                                          fontSize: getFontSize(
                                            16,
                                          ),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: getVerticalSize(
                              16.00,
                            ),
                          ),
                          child: Container(
                            height: getVerticalSize(50),
                            child: TabBar(
                              indicatorColor: Colors.transparent,
                              controller: tabController,
                              isScrollable: true,
                              labelColor: isDark ? Colors.white : Colors.black,
                              unselectedLabelColor: ColorConstant.gray500,
                              unselectedLabelStyle: TextStyle(
                                fontSize: getFontSize(
                                  13,
                                ),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                              labelStyle: TextStyle(
                                fontSize: getFontSize(
                                  13,
                                ),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                              tabs: [
                                Tab(text: 'Description'),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Html(
                            //"Master's degree in Design, Computer Science, Computer Interaction, or a related field.\n3 years of relevant industry experience.\nAbility to lead and ideate products from scratch and improve features, all with a user-centered design process.\nSkills in communicating and influencing product design strategy.\nExcellent problem-solving skills and familiarity with technical constraints and limitations.\nExperience designing across multiple platform.\nPortfolio highlighting multiple projects.",
                            data:  job!.content != null ? job!.content! : " ",

                          ),
                        ),
                        Card(child: ListTile(title: Text("Date Posted"),subtitle: Text(DateFormat.yMMMMd().format(job!.createdAt!),style: TextStyle(color: Colors.grey),),)),
                        Card(child: ListTile(title: Text("Expiration Date"),subtitle: Text(DateFormat.yMMMMd().format(job!.expirationDate!),style: TextStyle(color: Colors.grey),),)),
                        Card(child: ListTile(title: Text("Location"),subtitle: Text(job!.location!.name!,style: TextStyle(color: Colors.grey),),)),
                        Card(child: ListTile(title: Text("Hours"),subtitle: Text(job!.hours.toString()!,style: TextStyle(color: Colors.grey),),)),
                        Card(child: ListTile(title: Text("Salary"),subtitle: Text(job!.salaryMax.toString()!,style: TextStyle(color: Colors.grey),),)),
                        Card(child: ListTile(title: Text("Experience"),subtitle: Text(job!.experience.toString(),style: TextStyle(color: Colors.grey),),)),
                        Card(child: ListTile(title: Text("No. of Requirements"),subtitle: Text(job!.numberRecruitments.toString(),style: TextStyle(color: Colors.grey),),)),
                        Card(child: ListTile(title: Text("Gender"),subtitle: Text(job!.gender!,style: TextStyle(color: Colors.grey),),)),


                        //Sizedbox for extra space at bottom
                        SizedBox(height: 100,)
                      ],
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
