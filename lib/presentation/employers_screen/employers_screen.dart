import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hires/core/app_export.dart';
import 'package:hires/models/candidates_model.dart';
import 'package:hires/models/resource_model.dart';
import 'package:hires/models/user_model.dart';
import 'package:hires/presentation/candidates_screen/widgets/candidates_card_widget.dart';
import 'package:hires/presentation/employers_screen/widgets/employers_card_widget.dart';
import 'package:hires/presentation/homepage_3_screen/homepage_3_screen.dart';
import 'package:hires/presentation/homepage_3_screen/popular_jobs.dart';
import 'package:hires/presentation/homepage_3_screen/widgets/drawer_widget.dart';
import 'package:hires/presentation/search_option_3_screen/search_option_3_screen.dart';
import 'package:hires/presentation/searchfilterbottomsheet_page/searchfilterbottomsheet_page.dart';
import 'package:provider/provider.dart';

import '../../models/employers_model.dart';
import '../search_employer_screen/search_employer_screen.dart';

class EmployersScreen extends StatefulWidget {
  static String id = "employersScreen";

final String? keyword;
  EmployersScreen({this.keyword});

  @override
  State<EmployersScreen> createState() => _EmployersScreenState();
}

class _EmployersScreenState extends State<EmployersScreen> {
  bool status = false;
  EmployersModel? employers;

  bool _isLoading = false;


  @override
  initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    Provider.of<EmployersProvider>(context, listen: false).init(keyword:widget.keyword).then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    //THO
    UserModel usePrv = Provider.of<UserProvider>(
      context,
    ).userApp!;

    employers =
        Provider.of<EmployersProvider>(context, listen: false).employersModel;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Scaffold(
        key: Homepage3Screen.skey,
        endDrawer: drawerWidget(
            isDark: isDark,
            usePrv: usePrv,
            context: context
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
                  Scaffold.of(context).openEndDrawer();
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
                                  Navigator.push(context, MaterialPageRoute(builder: (c)=>SearchEmployerScreen()));
                                },
                                decoration: InputDecoration(
                                  hintText: 'Search a Company',
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
                                left: getHorizontalSize(
                                  0.00,
                                ),
                                top: getVerticalSize(
                                  30.00,
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
                                  return Container(
                                    height: 250,
                                    width: screenWidth,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFD9D9D9),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 10,
                                              offset: Offset(
                                                  3,3
                                              )
                                          )
                                        ]
                                    ),
                                    child: Image.asset(
                                      "assets/images/google_maps.png",
                                      fit: BoxFit.cover,

                                    ),
                                  );
                                }
                              }),
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
                                      "Employers",
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
                                      itemCount: employers!.data!.length,
                                      itemBuilder: (context, index) {
                                        return EmployersCardWidget(
                                            employer: employers!.data![index]
                                        );
                                        return Container();
                                      },
                                    ),
                                  )
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
            )
        ),
      ),
    );
  }
}
