import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hires/models/resource_model.dart';
import 'package:hires/presentation/categories_screen/categories_screen.dart';
import 'package:hires/presentation/homepage_3_screen/homepage_3_screen.dart';
import 'package:hires/presentation/homepage_3_screen/profile.dart';
import 'package:hires/presentation/messages_screen/messages_screen.dart';
import 'package:hires/presentation/my_profile/my_profile.dart';
import 'package:hires/presentation/saved_screen/saved_screen.dart';
import 'package:provider/provider.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/math_utils.dart';

class HomeScreen extends StatefulWidget {
  static String id = "HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//PHUTHO
class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [
    Homepage3Screen(),
    CategoriesScreen(),
    SavedScreen(),
    MyProfile(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ResourceModelProvider>(context, listen: false).init();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  int selectedNavBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        selectedItemColor: ColorConstant.teal600,
        unselectedItemColor: ColorConstant.gray600,
        selectedLabelStyle: TextStyle(
          color: ColorConstant.teal600,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w900,
        ),
        unselectedLabelStyle: TextStyle(
          color: ColorConstant.gray600,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        currentIndex: selectedNavBarIndex,
        onTap: (index) {
          setState(() {
            selectedNavBarIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(ImageConstant.iActiveHome,
                color: ColorConstant.gray402),
            activeIcon: SvgPicture.asset(
              ImageConstant.activeHome,
            ),
            label: ".",
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(ImageConstant.inActiveCategory),
              activeIcon: SvgPicture.asset(ImageConstant.inActiveCategory,
                  color: ColorConstant.teal600),
              label: "."),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(ImageConstant.inActiveBookmark),
              activeIcon: SvgPicture.asset(ImageConstant.inActiveBookmark,
                  color: ColorConstant.teal600),
              label: "."),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(ImageConstant.imgProfile21),
              activeIcon: SvgPicture.asset(ImageConstant.imgProfile213,
                  color: ColorConstant.teal600),
              label: "."),
        ],
      ),
      body: screens[selectedNavBarIndex],
    );
  }
}
