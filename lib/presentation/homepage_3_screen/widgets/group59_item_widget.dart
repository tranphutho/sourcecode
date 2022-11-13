import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hires/core/app_export.dart';
import 'package:hires/models/job_model.dart';
import 'package:provider/provider.dart';

import '../../../models/user_model.dart';
import '../../../models/wishlist_model.dart';
import '../../apply_screen/apply_screen.dart';
import '../../job_details1_screen/job_details1_screen.dart';

// ignore: must_be_immutable
//PHUTHO du lieu tren home page
class Group59ItemWidget extends StatelessWidget {
  Group59ItemWidget({this.job});
  // Group59ItemWidget();

  Job? job;

  @override
  Widget build(BuildContext context) {
    UserModel usePrv = Provider.of<UserProvider>(
      context,
    ).userApp!;
    //print(job);
    return Align(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: getVerticalSize(
                  220.00,
                ),
                width: getHorizontalSize(450),
                child: SvgPicture.asset(
                  ImageConstant.imgGroup84,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => ApplyScreen(
              //         job: job,
              //       ),
              //     ));
              Navigator.pushNamed(context, JobDetails1Screen.id,
                  arguments: job);
            },
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                  left: getHorizontalSize(
                    40.00,
                  ),
                  top: getVerticalSize(
                    12.00,
                  ),
                  right: getHorizontalSize(
                    40.00,
                  ),
                  bottom: getVerticalSize(
                    30.00,
                  ),
                ),
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: getSize(
                                46.00,
                              ),
                              width: getSize(
                                46.00,
                              ),
                              margin: EdgeInsets.only(
                                bottom: getVerticalSize(
                                  1.00,
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: ColorConstant.whiteA700,
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    12.00,
                                  ),
                                ),
                              ),
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                elevation: 0,
                                margin: EdgeInsets.all(0),
                                color: ColorConstant.whiteA700,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      12.00,
                                    ),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: getHorizontalSize(
                                            12.88,
                                          ),
                                          top: getVerticalSize(
                                            12.00,
                                          ),
                                          right: getHorizontalSize(
                                            13.86,
                                          ),
                                          bottom: getVerticalSize(
                                            12.00,
                                          ),
                                        ),
                                        child: Container(
                                          height: getVerticalSize(
                                            22.00,
                                          ),
                                          width: getHorizontalSize(
                                            19.26,
                                          ),
                                          child: Image.network(
                                            job!.thumbnailImage != null
                                                ? job!.thumbnailImage!
                                                : "https://whitejobs.co.in/images/avatar.png",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  16.00,
                                ),
                                top: getVerticalSize(
                                  2.00,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: getHorizontalSize(220),
                                    child: Text(
                                      job!.title! ?? "",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      maxLines: 3,
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
                                      top: getVerticalSize(
                                        3.00,
                                      ),
                                      right: getHorizontalSize(
                                        10.00,
                                      ),
                                    ),
                                    child: Text(
                                      "Shell plc",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: ColorConstant.whiteA7009e,
                                        fontSize: getFontSize(
                                          14,
                                        ),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            child: InkWell(
                              onTap: () async {
                                WishlistProvider whislistProvider =
                                    Provider.of<WishlistProvider>(context,
                                        listen: false);
                                await whislistProvider.addWishlist(
                                    job!.id!.toString(), usePrv!.token!);
                              },
                              child: SvgPicture.asset(
                                ImageConstant.imgFluentbookmark,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: getVerticalSize(
                          15.00,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: getVerticalSize(
                              26.00,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: getHorizontalSize(16)),
                            decoration: BoxDecoration(
                              color: ColorConstant.whiteA70026,
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  65.00,
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
                            padding: EdgeInsets.symmetric(
                                horizontal: getHorizontalSize(16)),
                            decoration: BoxDecoration(
                              color: ColorConstant.whiteA70026,
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  65.00,
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
                            padding: EdgeInsets.symmetric(
                                horizontal: getHorizontalSize(16)),
                            decoration: BoxDecoration(
                              color: ColorConstant.whiteA70026,
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  65.00,
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
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: getVerticalSize(
                              14.00,
                            ),
                            right: getHorizontalSize(
                              4.00,
                            ),
                            bottom: getVerticalSize(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              // "${Constants.currency}${job!.salaryMin != null ? job!.salaryMin! : ""} - ${Constants.currency}${job!.salaryMax != null ? job!.salaryMax! : ""}/${checkNullToString(job!.salaryType!)}",
                              "${Constants.currency}${job?.salaryMin ?? ""} - ${Constants.currency}${job?.salaryMax ?? ""}/${job?.salaryType ?? ""}",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: ColorConstant.whiteA700,
                                fontSize: getFontSize(
                                  13,
                                ),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "${job!.company != null ? job!.company!.city : ""}, ${job!.company != null ? job!.company!.country : ""}",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: ColorConstant.whiteA700,
                                fontSize: getFontSize(
                                  13,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
