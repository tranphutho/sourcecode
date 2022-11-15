import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hires/core/app_export.dart';
import 'package:hires/core/theme/theme_constants.dart';
import 'package:hires/models/candidates_model.dart';
import 'package:hires/presentation/job_details1_screen/job_details1_screen.dart';

import '../../../models/job_model.dart';

// ignore: must_be_immutable
//PHUTHO
class CandidatesCardWidget extends StatelessWidget {
  CandidatesCardWidget({this.candidate});
  Cadidate? candidate;
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, JobDetails1Screen.id, arguments: candidate);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Align(
          alignment: Alignment.center,
          child: isDark
              ? darkCustomContainer(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: context.locale == Constants.engLocal
                        ? getHorizontalSize(
                      20.00,
                    )
                        : getHorizontalSize(0),
                    right: context.locale == Constants.arLocal
                        ? getHorizontalSize(
                      20.00,
                    )
                        : getHorizontalSize(0),
                    top: getVerticalSize(
                      16.00,
                    ),
                    bottom: getVerticalSize(
                      15.00,
                    ),
                  ),
                  child: Container(
                    height: getVerticalSize(
                      43.00,
                    ),
                    width: getHorizontalSize(
                      41.26,
                    ),
                    child: Image.network(
                      "https://whitejobs.co.in/images/avatar.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(
                      20.74,
                    ),
                    top: getVerticalSize(
                      16.00,
                    ),
                    right: getHorizontalSize(
                      20.00,
                    ),
                    bottom: getVerticalSize(
                      15.00,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: getHorizontalSize(
                          220.00,
                        ),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: getVerticalSize(
                                  1.00,
                                ),
                              ),
                              child: Text(
                                candidate!.user!.name ?? "",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: getFontSize(
                                    14,
                                  ),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(
                              "${Constants.currency}${candidate?.expectedSalary ?? ""}/${candidate!.salaryType!.substring(0, 1)}",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: getFontSize(
                                  12,
                                ),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
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
                          MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              candidate!.title != null
                                  ? candidate!.title!
                                  : "",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: isDark
                                    ? Colors.white
                                    : ColorConstant.gray90087,
                                fontSize: getFontSize(
                                  13,
                                ),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "${candidate!.city != null ? candidate!.city : ""}, ${candidate!.country != null ? candidate!.country : ""}",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: isDark
                                    ? ColorConstant.whiteA700
                                    : ColorConstant.gray90087,
                                fontSize: getFontSize(
                                  13,
                                ),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
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
          )
              : lightCostumContainer(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: context.locale == Constants.engLocal
                        ? getHorizontalSize(
                      20.00,
                    )
                        : getHorizontalSize(0),
                    right: context.locale == Constants.arLocal
                        ? getHorizontalSize(
                      20.00,
                    )
                        : getHorizontalSize(0),
                    top: getVerticalSize(
                      16.00,
                    ),
                    bottom: getVerticalSize(
                      15.00,
                    ),
                  ),
                  child: Container(
                    height: getVerticalSize(
                      43.00,
                    ),
                    width: getHorizontalSize(
                      41.26,
                    ),
                    child: Image.network(
                      "https://whitejobs.co.in/images/avatar.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(
                      20.74,
                    ),
                    top: getVerticalSize(
                      16.00,
                    ),
                    right: getHorizontalSize(
                      20.00,
                    ),
                    bottom: getVerticalSize(
                      15.00,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: getHorizontalSize(
                          220.00,
                        ),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: getVerticalSize(
                                  1.00,
                                ),
                              ),
                              child: Container(
                                width: 150,
                                child: Text(
                                  candidate!.user!.name!,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: ColorConstant.gray900,
                                    fontSize: getFontSize(
                                      14,
                                    ),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              // "${Constants.currency}${job!.salaryMax != null ? job!.salaryMax! : ""}/${job!.salaryType!.substring(0, 1)}",
                              "${Constants.currency}${candidate?.expectedSalary ?? ""}/${candidate!.salaryType!.substring(0, 1)}",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: ColorConstant.gray900,
                                fontSize: getFontSize(
                                  12,
                                ),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
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
                          MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              candidate!.title != null
                                  ? candidate!.title!
                                  : "",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: ColorConstant.gray90087,
                                fontSize: getFontSize(
                                  13,
                                ),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "${candidate != null ? candidate!.city : ""}, ${candidate != null ? candidate!.country : ""}",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: ColorConstant.gray90087,
                                fontSize: getFontSize(
                                  13,
                                ),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
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
      ),
    );
  }
}
