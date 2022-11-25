import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hires/core/app_export.dart';
import 'package:hires/models/user_model.dart';
import 'package:hires/presentation/homepage_3_screen/popular_jobs.dart';
import 'package:hires/presentation/homepage_3_screen/widgets/drawer_widget.dart';
import 'package:hires/presentation/homepage_3_screen/widgets/featured_jobs.dart';
import 'package:hires/presentation/search_option_3_screen/search_option_3_screen.dart';
import 'package:hires/presentation/searchfilterbottomsheet_page/searchfilterbottomsheet_page.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../models/job_model.dart';
import '../homepage_3_screen/widgets/group568_item_widget.dart';
import '../homepage_3_screen/widgets/group59_item_widget.dart';

class Homepage3Screen extends StatefulWidget {
  static String id = "Homepage3Screen";
  static GlobalKey<ScaffoldState> skey = GlobalKey();

  @override
  State<Homepage3Screen> createState() => _Homepage3ScreenState();
}

class _Homepage3ScreenState extends State<Homepage3Screen> {
  int silderIndex = 1;
  bool status = false;
  JobsModel? featuredJob;
  JobsModel? popularJob;
  bool _isLoading = false;

  @override
  initState() {
    super.initState();

    setState(() {
      _isLoading = true;
    });
    Provider.of<JobProvider>(context, listen: false).intit().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //THO
    UserModel usePrv = Provider.of<UserProvider>(
      context,
    ).userApp!;
    // JobProvider jobprovider = Provider.of<JobProvider>(context, listen: false);
    // jobprovider.findFeaturedJobs();
    featuredJob =
        Provider.of<JobProvider>(context, listen: false).featuredJobModel;
    //print(featuredJob);
    popularJob =
        Provider.of<JobProvider>(context, listen: false).popularJobModel;
    //print(featuredJob);
    //
    // jobprovider.findJobs();
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Scaffold(
        key: Homepage3Screen.skey,
        drawer: drawerWidget(
          isDark: isDark,
          usePrv: usePrv,
          context: context,
        ),
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          title: Padding(
            padding: EdgeInsets.only(
              top: getVerticalSize(
                12.00,
              ),
            ),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back!",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: ColorConstant.gray500,
                      fontSize: getFontSize(
                        14,
                      ),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getVerticalSize(
                        2.00,
                      ),
                    ),
                    child: Text(
                      // "Dokkan Agency 👋",
                      usePrv.role_id != 3
                          ? "${usePrv.company != null ? usePrv.company!.name! : usePrv.name} 👋"
                          : "${usePrv.name} 👋",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: getFontSize(
                          18,
                        ),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            Builder(builder: (context) {
              return GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getVerticalSize(20),
                      horizontal: getHorizontalSize(16)),
                  child: Container(
                    height: getVerticalSize(
                      50.00,
                    ),
                    width: getHorizontalSize(
                      52.00,
                    ),
                    margin: EdgeInsets.only(
                      top: getVerticalSize(
                        1.00,
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: getHorizontalSize(
                                2.00,
                              ),
                            ),
                            child: Container(
                              height: getSize(
                                50.00,
                              ),
                              width: getSize(
                                50.00,
                              ),
                              decoration: BoxDecoration(
                                  color: isDark
                                      ? ColorConstant.yellow
                                      : ColorConstant.red300,
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(8),
                                  )),
                            ),
                          ),
                        ),
                        Image.network(
                          usePrv!.profilePicture != null
                              ?"http://"+Constants.urlApi+"/"+ usePrv!.profilePicture!
                              : "https://whitejobs.co.in/images/avatar.png",
                          fit: BoxFit.fill,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: getHorizontalSize(4),
                                vertical: getVerticalSize(4)),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isDark
                                    ? ColorConstant.darkBg
                                    : ColorConstant.whiteA700),
                            child: Container(
                              height: getSize(
                                8.00,
                              ),
                              width: getSize(
                                8.00,
                              ),
                              decoration: BoxDecoration(
                                  color: ColorConstant.redA701,
                                  shape: BoxShape.circle),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
        body: SafeArea(
            child: Container(
          width: size.width,
          child: Padding(
            padding: EdgeInsets.only(
              top: getVerticalSize(
                0.00,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        24.00,
                      ),
                      top: getVerticalSize(
                        0.00,
                      ),
                      right: getHorizontalSize(
                        24.00,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: getVerticalSize(
                            40.00,
                          ),
                          width: getHorizontalSize(
                            263.00,
                          ),
                          child: TextFormField(
                            readOnly: true,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, SearchOption3Screen.id);
                            },
                            decoration: InputDecoration(
                              hintText: 'Search a job or position',
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(
                                  left: context.locale == Constants.engLocal
                                      ? getHorizontalSize(
                                          24.00,
                                        )
                                      : getHorizontalSize(10),
                                  right: context.locale == Constants.arLocal
                                      ? getHorizontalSize(
                                          24.00,
                                        )
                                      : getHorizontalSize(10),
                                ),
                                child: Container(
                                  height: getSize(
                                    20.00,
                                  ),
                                  width: getSize(
                                    20.00,
                                  ),
                                  child: isDark
                                      ? SvgPicture.asset(
                                          ImageConstant.imgSearch11,
                                          fit: BoxFit.contain,
                                          color: Colors.white,
                                        )
                                      : SvgPicture.asset(
                                          ImageConstant.imgSearch11,
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
                                  17.75,
                                ),
                              ),
                            ),
                            style: TextStyle(
                              color: ColorConstant.gray500,
                              fontSize: getFontSize(
                                15.0,
                              ),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          height: getSize(
                            48.00,
                          ),
                          width: getSize(
                            48.00,
                          ),
                          margin: EdgeInsets.only(
                            left: context.locale == Constants.engLocal
                                ? getHorizontalSize(
                                    16.00,
                                  )
                                : getHorizontalSize(0),
                            right: context.locale == Constants.arLocal
                                ? getHorizontalSize(
                                    16.00,
                                  )
                                : getHorizontalSize(0),
                          ),
                          decoration: BoxDecoration(
                            color: isDark
                                ? ColorConstant.darkContainer
                                : ColorConstant.gray100,
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
                                      11.00,
                                    ),
                                    top: getVerticalSize(
                                      11.00,
                                    ),
                                    right: getHorizontalSize(
                                      11.00,
                                    ),
                                    bottom: getVerticalSize(
                                      11.00,
                                    ),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                            top: Radius.circular(20),
                                          )),
                                          builder: (context) {
                                            return SearchfilterbottomsheetPage();
                                          });
                                    },
                                    child: Container(
                                      height: getSize(
                                        26.00,
                                      ),
                                      width: getSize(
                                        26.00,
                                      ),
                                      child: SvgPicture.asset(
                                        ImageConstant.imgFilter5,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
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
                                          24.00,
                                        )
                                      : getHorizontalSize(0),
                                  right: context.locale == Constants.arLocal
                                      ? getHorizontalSize(
                                          24.00,
                                        )
                                      : getHorizontalSize(0),
                                ),
                                child: Text(
                                  "Featured Jobs",
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
                                  right: context.locale == Constants.engLocal
                                      ? getHorizontalSize(
                                          24.00,
                                        )
                                      : getHorizontalSize(0),
                                  left: context.locale == Constants.arLocal
                                      ? getHorizontalSize(
                                          24.00,
                                        )
                                      : getHorizontalSize(0),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, FeaturedJobes.id);
                                  },
                                  child: Text(
                                    "See all",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.right,
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
                        Padding(
                          padding: EdgeInsets.only(
                            left: getHorizontalSize(
                              0.00,
                            ),
                            top: getVerticalSize(
                              12.00,
                            ),
                            right: getHorizontalSize(
                              0.00,
                            ),
                          ),
                          child: Builder(builder: (context) {
                            if (_isLoading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return CarouselSlider.builder(
                                options: CarouselOptions(
                                  height: getVerticalSize(
                                    220.00,
                                  ),
                                  initialPage: 0,
                                  autoPlay: true,
                                  viewportFraction: 1.0,
                                  enableInfiniteScroll: false,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      silderIndex = index;
                                    });
                                  },
                                ),
                                itemCount: featuredJob!.data!.length,
                                itemBuilder: (context, index, realIndex) {
                                  //PHUTHO
                                  return Group59ItemWidget(
                                      job: featuredJob!.data![index]);
                                },
                              );
                            }
                          }),
                        ),
                        Builder(builder: (context) {
                          if (_isLoading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Container(
                              //color: Colors.amber,
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: getVerticalSize(
                                    8.00,
                                  ),
                                  margin: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      24.00,
                                    ),
                                    top: getVerticalSize(
                                      0.00,
                                    ),
                                    right: getHorizontalSize(
                                      20.00,
                                    ),
                                  ),
                                  child: AnimatedSmoothIndicator(
                                    activeIndex: silderIndex,
                                    count: featuredJob!.data!.length,
                                    axisDirection: Axis.horizontal,
                                    effect: ScrollingDotsEffect(
                                      spacing: 8,
                                      activeDotScale: 2,
                                      radius: 2,
                                      activeDotColor: ColorConstant.teal600,
                                      dotColor: ColorConstant.gray300,
                                      dotHeight: getVerticalSize(
                                        4.00,
                                      ),
                                      dotWidth: getHorizontalSize(
                                        8.00,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        }),
                        Padding(
                          padding: EdgeInsets.only(
                            top: getVerticalSize(
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
                                          26.00,
                                        )
                                      : getHorizontalSize(0),
                                  right: context.locale == Constants.arLocal
                                      ? getHorizontalSize(
                                          26.00,
                                        )
                                      : getHorizontalSize(0),
                                ),
                                child: Text(
                                  "Popular Jobs",
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
                                    Navigator.pushNamed(
                                        context, PopularJobes.id);
                                  },
                                  child: Text(
                                    "See all",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.right,
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
                        Builder(builder: (context) {
                          if (_isLoading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Align(
                              alignment: Alignment.center,
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
                                child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return Group568ItemWidget(
                                        job: popularJob!.data![index]);
                                  },
                                ),
                              ),
                            );
                          }
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
