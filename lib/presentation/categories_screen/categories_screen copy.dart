import 'package:easy_localization/easy_localization.dart';
import 'package:hires/presentation/categories_screen/popular.dart';
import 'package:hires/presentation/categories_screen/trending.dart';
import 'package:hires/presentation/home_screen/home_screen.dart';
import 'package:provider/provider.dart';
import '../../models/job_model.dart';
import '../../models/user_model.dart';
import '../categories_screen/widgets/categories1_item_widget.dart';
import '../categories_screen/widgets/categories_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:hires/core/app_export.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  State<CategoriesScreen> createState() => _CategoriesScreen();
  static String id = "CategoriesScreen";
}

class _CategoriesScreen extends State<CategoriesScreen> {
  JobsModel? featuredJob;
  JobsModel? urgentJob;
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _isLoading = true;
    });
    Provider.of<JobProvider>(context, listen: false)
        .intitCategories()
        .then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    UserModel usePrv = Provider.of<UserProvider>(
      context,
    ).userApp!;
    // JobProvider jobprovider = Provider.of<JobProvider>(context, listen: false);
    // jobprovider.findFeaturedJobs();
    featuredJob =
        Provider.of<JobProvider>(context, listen: false).featuredJobModel;
    //print(featuredJob);
    urgentJob = Provider.of<JobProvider>(context, listen: false).urgenJobModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Categories",
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
                Navigator.pushReplacementNamed(context, HomeScreen.id);
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
      body: Container(
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
                        10.00,
                      ),
                      bottom: getVerticalSize(
                        46.00,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: getVerticalSize(
                              32.00,
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
                                          20.00,
                                        )
                                      : getHorizontalSize(0),
                                  right: context.locale == Constants.arLocal
                                      ? getHorizontalSize(
                                          20.00,
                                        )
                                      : getHorizontalSize(0),
                                  bottom: getVerticalSize(
                                    2.00,
                                  ),
                                ),
                                child: Text(
                                  "Popular",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                                    2.00,
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
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, Popular.id);
                                  },
                                  child: Text(
                                    "See all",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: ColorConstant.gray500,
                                      fontSize: getFontSize(
                                        13,
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
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                24.00,
                              ),
                              top: getVerticalSize(
                                18.00,
                              ),
                              right: getHorizontalSize(
                                24.00,
                              ),
                            ),
                            child: Builder(builder: (context) {
                              if (_isLoading) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                return GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: getVerticalSize(
                                      140.00,
                                    ),
                                    crossAxisCount: 2,
                                    mainAxisSpacing: getHorizontalSize(
                                      0.00,
                                    ),
                                    crossAxisSpacing: getHorizontalSize(
                                      8.00,
                                    ),
                                  ),
                                  physics: BouncingScrollPhysics(),
                                  itemCount: featuredJob!.data!.length,
                                  itemBuilder: (context, index) {
                                    return CategoriesItemWidget(
                                      job: featuredJob!.data![index],
                                    );
                                  },
                                );
                              }
                            }),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: getVerticalSize(
                              40.00,
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
                                          20.00,
                                        )
                                      : getHorizontalSize(0),
                                  right: context.locale == Constants.arLocal
                                      ? getHorizontalSize(
                                          20.00,
                                        )
                                      : getHorizontalSize(0),
                                  bottom: getVerticalSize(
                                    2.00,
                                  ),
                                ),
                                child: Text(
                                  "Trending",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
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
                                    2.00,
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
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, Trending.id);
                                  },
                                  child: Text(
                                    "See all",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: ColorConstant.gray500,
                                      fontSize: getFontSize(
                                        13,
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
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: getHorizontalSize(
                                24.00,
                              ),
                              top: getVerticalSize(
                                18.00,
                              ),
                              right: getHorizontalSize(
                                24.00,
                              ),
                            ),
                            child: Builder(builder: (context) {
                              if (_isLoading) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                return GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: getVerticalSize(
                                      140.00,
                                    ),
                                    crossAxisCount: 2,
                                    mainAxisSpacing: getHorizontalSize(
                                      0.00,
                                    ),
                                    crossAxisSpacing: getHorizontalSize(
                                      8.00,
                                    ),
                                  ),
                                  physics: BouncingScrollPhysics(),
                                  itemCount: urgentJob!.data!.length,
                                  itemBuilder: (context, index) {
                                    return Categories1ItemWidget(
                                      job: urgentJob!.data![index],
                                    );
                                  },
                                );
                              }
                            }),
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
    );
  }
}
