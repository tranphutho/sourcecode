import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hires/core/app_export.dart';
import 'package:hires/core/theme/theme_constants.dart';
import 'package:hires/models/wishlist_model.dart';
import 'package:provider/provider.dart';

import '../../../models/user_model.dart';

// ignore: must_be_immutable
class SavedItemWidget extends StatelessWidget {
  SavedItemWidget(this.wishlist);
  Wishlist? wishlist;

  @override
  Widget build(BuildContext context) {
    print(wishlist);
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    UserModel usePrv = Provider.of<UserProvider>(
      context,
    ).userApp!;
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getHorizontalSize(20), vertical: getVerticalSize(5)),
        child: isDark
            ? darkCustomContainer(
                child: InkWell(
                  onTap: () {
                    //   Navigator.pushNamed(context, JobDetails1Screen.id,
                    // arguments: job);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: getVerticalSize(
                              20.00,
                            ),
                            left: getHorizontalSize(16),
                            right: getHorizontalSize(16)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: getSize(
                                    44.00,
                                  ),
                                  width: getSize(
                                    44.00,
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
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(
                                          119.00,
                                        ),
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Image.asset(
                                            ImageConstant.imgSpotigy,
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
                                    bottom: getVerticalSize(
                                      1.00,
                                    ),
                                    left: getHorizontalSize(
                                      15.00,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          bottom: getVerticalSize(
                                            1.00,
                                          ),
                                        ),
                                        child: Container(
                                          width: getHorizontalSize(220),
                                          child: Text(
                                            wishlist!.job! != null
                                                ? wishlist!.job!.title!
                                                : "",
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
                                      ),
                                      Text(
                                        "Spotify",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
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
                            Column(
                              children: [
                                Container(
                                  width: getHorizontalSize(500),
                                  child: Text(
                                    "${Constants.currency}${wishlist!.job! != null ? wishlist!.job?.salaryMin ?? "" : ""}-${wishlist!.job! != null ? wishlist!.job?.salaryMax ?? "" : ""}/${wishlist!.job! != null ? wishlist!.job!.salaryType!.substring(0, 1) : ""}",
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: getFontSize(
                                        12,
                                      ),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${wishlist!.company!.city != null ? wishlist!.company!.city! : ""}, ${wishlist!.company!.country != null ? wishlist!.company!.country! : ""}",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.end,
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
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: getVerticalSize(
                            23.00,
                          ),
                          bottom: getVerticalSize(
                            20.00,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                alignment: Alignment.center,
                                height: getVerticalSize(
                                  33.00,
                                ),
                                width: getHorizontalSize(
                                  114.00,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorConstant.red50,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      52.00,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  wishlist!.job! != null
                                      ? wishlist!.job!.status!
                                      : "",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorConstant.red700,
                                    fontSize: getFontSize(
                                      13,
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
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: getVerticalSize(
                                  33.00,
                                ),
                                width: getHorizontalSize(
                                  114.00,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorConstant.red50,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      52.00,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  wishlist!.job! != null
                                      ? wishlist!.job!.status!
                                      : "",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorConstant.red700,
                                    fontSize: getFontSize(
                                      13,
                                    ),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: getVerticalSize(
                                  7.00,
                                ),
                                left: context.locale == Constants.engLocal
                                    ? getHorizontalSize(
                                        0.00,
                                      )
                                    : getHorizontalSize(24),
                                right: context.locale == Constants.arLocal
                                    ? getHorizontalSize(
                                        0.00,
                                      )
                                    : getHorizontalSize(24),
                                bottom: getVerticalSize(
                                  7.00,
                                ),
                              ),
                              child: Text(
                                "Full-Time",
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : lightCostumContainer(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: getVerticalSize(
                              20.00,
                            ),
                            left: getHorizontalSize(16),
                            right: getHorizontalSize(16)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: getSize(
                                    44.00,
                                  ),
                                  width: getSize(
                                    44.00,
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
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(
                                          119.00,
                                        ),
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Image.asset(
                                            ImageConstant.imgSpotigy,
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
                                    bottom: getVerticalSize(
                                      1.00,
                                    ),
                                    left: context.locale == Constants.engLocal
                                        ? getHorizontalSize(
                                            15.00,
                                          )
                                        : getHorizontalSize(0),
                                    right: context.locale == Constants.arLocal
                                        ? getHorizontalSize(
                                            15.00,
                                          )
                                        : getHorizontalSize(0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          bottom: getVerticalSize(
                                            1.00,
                                          ),
                                        ),
                                        child: Container(
                                          width: getHorizontalSize(150),
                                          child: Text(
                                            wishlist!.job! != null
                                                ? wishlist!.job!.title!
                                                : "",
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
                                      ),
                                      Text(
                                        "Spotify",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
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
                            Column(
                              children: [
                                Container(
                                  width: getHorizontalSize(50),
                                  child: Text(
                                    "${Constants.currency}${wishlist!.job! != null ? wishlist!.job?.salaryMin ?? "" : ""}-${wishlist!.job! != null ? wishlist!.job?.salaryMax ?? "" : ""}/${wishlist!.job! != null ? wishlist!.job!.salaryType!.substring(0, 1) : ""}",
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: getFontSize(
                                        12,
                                      ),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${wishlist!.company!.city != null ? wishlist!.company!.city! : ""}, ${wishlist!.company!.country != null ? wishlist!.company!.country! : ""}",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.end,
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
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: getVerticalSize(
                            23.00,
                          ),
                          bottom: getVerticalSize(
                            20.00,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: context.locale == Constants.engLocal
                                    ? getHorizontalSize(
                                        24.00,
                                      )
                                    : getHorizontalSize(0),
                                right: context.locale == Constants.arLocal
                                    ? getHorizontalSize(
                                        24.00,
                                      )
                                    : getHorizontalSize(0),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: getVerticalSize(
                                  33.00,
                                ),
                                width: getHorizontalSize(
                                  114.00,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorConstant.red50,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      52.00,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  wishlist!.job! != null
                                      ? wishlist!.job!.status!
                                      : "",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorConstant.red700,
                                    fontSize: getFontSize(
                                      13,
                                    ),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: context.locale == Constants.engLocal
                                    ? getHorizontalSize(
                                        5.00,
                                      )
                                    : getHorizontalSize(0),
                                right: context.locale == Constants.arLocal
                                    ? getHorizontalSize(
                                        5.00,
                                      )
                                    : getHorizontalSize(0),
                              ),
                              child: Container(
                                  alignment: Alignment.center,
                                  height: getVerticalSize(
                                    33.00,
                                  ),
                                  width: getHorizontalSize(
                                    114.00,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        52.00,
                                      ),
                                    ),
                                  ),
                                  child: InkWell(
                                      onTap: () async {
                                        print("test");
                                        WishlistProvider whislistProvider =
                                            Provider.of<WishlistProvider>(
                                                context,
                                                listen: false);
                                        bool? state = await whislistProvider
                                            .remoteWishlist(
                                                wishlist!.job!.id!.toString(),
                                                usePrv!.token!);
                                        if (state!) {
                                          await Provider.of<WishlistProvider>(
                                                  context,
                                                  listen: false)
                                              .intit(usePrv!.token!);
                                        }
                                      },
                                      child: Icon(Icons.delete_rounded))),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: getVerticalSize(
                                  7.00,
                                ),
                                left: context.locale == Constants.engLocal
                                    ? getHorizontalSize(
                                        0.00,
                                      )
                                    : getHorizontalSize(24),
                                right: context.locale == Constants.arLocal
                                    ? getHorizontalSize(
                                        0.00,
                                      )
                                    : getHorizontalSize(24),
                                bottom: getVerticalSize(
                                  7.00,
                                ),
                              ),
                              child: Text(
                                "Full-Time",
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
