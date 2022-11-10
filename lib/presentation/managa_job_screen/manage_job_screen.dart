import 'package:hires/models/user_model.dart';
import 'package:hires/models/wishlist_model.dart';
import 'package:hires/presentation/home_screen/home_screen.dart';
import 'package:provider/provider.dart';
import '../saved_screen/widgets/saved_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:hires/core/app_export.dart';

class ManageJobScreen extends StatefulWidget {
  @override
  State<ManageJobScreen> createState() => _ManageJobScreenState();
  static String id = "ManageJobScreen";
}

class _ManageJobScreenState extends State<ManageJobScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  WishlistModel? wishlistModel;
  UserModel? usePrv;
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    tabController = tabController = TabController(length: 4, vsync: this);
    setState(() {
      _isLoading = true;
    });
    usePrv = Provider.of<UserProvider>(context, listen: false).userApp!;
    Provider.of<WishlistProvider>(context, listen: false)
        .intit(usePrv!.token!)
        .then((_) {
      wishlistModel =
          Provider.of<WishlistProvider>(context, listen: false).wishlistModel!;
      setState(() {
        _isLoading = false;
      });
    });
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
    var abc = context.watch<WishlistProvider>().getWishlist(usePrv!.token!);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Saved",
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
        actions: [
          // Padding(
          //   padding: EdgeInsets.symmetric(
          //     horizontal: getHorizontalSize(16),
          //     vertical: getVerticalSize(12)
          //   ),
          //   child: Container(
          //                height: getVerticalSize(
          //                  30.00,
          //                ),
          //                width: getHorizontalSize(
          //                  33.00,
          //                ),
          //                margin: EdgeInsets.only(
          //                  top: getVerticalSize(
          //                    1.00,
          //                  ),
          //                ),
          //                child: Stack(
          //                  alignment: Alignment.bottomCenter,
          //                  children: [
          //                    Align(
          //                      alignment: Alignment.center,
          //                      child: Padding(
          //                        padding: EdgeInsets.only(
          //                          right: getHorizontalSize(
          //                            2.00,
          //                          ),
          //                        ),
          //                        child: Container(
          //                          height: getSize(
          //                            30.00,
          //                          ),
          //                          width: getSize(
          //                            30.00,
          //                          ),
          //                         decoration: BoxDecoration(
          //                           color:isDark?ColorConstant.yellow: ColorConstant.red300,
          //                        borderRadius: BorderRadius.circular(getHorizontalSize(8),)
          //                        ),
          //                        ),
          //                      ),
          //                    ),
          //                    Align(
          //                      alignment: Alignment.bottomCenter,
          //                      child: Padding(
          //                        padding: EdgeInsets.only(
          //                          top: getVerticalSize(
          //                            10.00,
          //                          ),
          //                          right: getHorizontalSize(
          //                            2.00,
          //                          ),
          //                        ),
          //                        child: Image.asset(
          //                          ImageConstant.imgBusinessmanho,
          //                          height: getSize(
          //                            30.00,
          //                          ),
          //                          width: getSize(
          //                            30.00,
          //                          ),
          //                          fit: BoxFit.fill,
          //                        ),
          //                      ),
          //                    ),
          //                    Align(
          //                      alignment: Alignment.topRight,
          //                      child: Container(
          //                      padding: EdgeInsets.symmetric(
          //                        horizontal: getHorizontalSize(4),
          //                        vertical: getVerticalSize(4)
          //                      ),
          //                        decoration: BoxDecoration(
          //                          shape: BoxShape.circle,
          //                          color:isDark?ColorConstant.darkBg: ColorConstant.whiteA700
          //                        ),
          //
          //                        child: Container(
          //                          height: getSize(
          //                            6.00,
          //                          ),
          //                          width: getSize(
          //                            6.00,
          //                          ),
          //                          decoration: BoxDecoration(
          //                            color: ColorConstant.redA701,
          //                           shape: BoxShape.circle
          //                          ),
          //                        ),
          //                      ),
          //                    ),
          //
          //
          //                  ],
          //                ),
          //              ),
          // ),
        ],
      ),
      body: Container(
        width: size.width,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
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
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: getHorizontalSize(
                              24.00,
                            ),
                            top: getVerticalSize(
                              34.00,
                            ),
                          ),
                          child: Builder(builder: (context) {
                            if (_isLoading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else
                              return Text(
                                "You saved ${wishlistModel!.data!.length! ?? "0"} Jobs 👍",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: getFontSize(
                                    24,
                                  ),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              );
                          }),
                        ),
                      ),
                      Container(
                        height: getVerticalSize(60),
                        padding: EdgeInsets.only(top: getVerticalSize(24)),
                        child: TabBar(
                            padding: EdgeInsets.only(
                                left: getHorizontalSize(20),
                                right: getHorizontalSize(20)),
                            controller: tabController,
                            isScrollable: true,
                            labelColor: ColorConstant.whiteA700,
                            unselectedLabelColor: ColorConstant.teal600,
                            unselectedLabelStyle: TextStyle(
                              fontSize: getFontSize(
                                16,
                              ),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            labelStyle: TextStyle(
                              fontSize: getFontSize(
                                16,
                              ),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            indicator: BoxDecoration(
                                color: ColorConstant.teal600,
                                borderRadius: BorderRadius.circular(
                                    getHorizontalSize(100))),
                            tabs: [
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: getHorizontalSize(12)),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ColorConstant.teal600),
                                    borderRadius: BorderRadius.circular(
                                        getHorizontalSize(25)),
                                  ),
                                  child: Tab(
                                    text: 'All',
                                  )),
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: getHorizontalSize(12)),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ColorConstant.teal600),
                                    borderRadius: BorderRadius.circular(
                                        getHorizontalSize(25)),
                                  ),
                                  child: Tab(
                                    text: 'Design',
                                  )),
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: getHorizontalSize(12)),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ColorConstant.teal600),
                                    borderRadius: BorderRadius.circular(
                                        getHorizontalSize(25)),
                                  ),
                                  child: Tab(
                                    text: 'Developer',
                                  )),
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: getHorizontalSize(12)),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ColorConstant.teal600),
                                    borderRadius: BorderRadius.circular(
                                        getHorizontalSize(25)),
                                  ),
                                  child: Tab(
                                    text: 'Manager',
                                  )),
                            ]),
                      ),
                      Builder(builder: (context) {
                        if (_isLoading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else
                          return Container(
                            padding: EdgeInsets.only(top: getVerticalSize(20)),
                            alignment: Alignment.topCenter,
                            height: MediaQuery.of(context).size.height * .660,
                            child: TabBarView(
                              controller: tabController,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: Provider.of<WishlistProvider>(
                                            context,
                                            listen: true)
                                        .wishlistModel!
                                        .data!
                                        .length,
                                    itemBuilder: (context, index) {
                                      return SavedItemWidget(
                                          Provider.of<WishlistProvider>(context,
                                                  listen: true)
                                              .wishlistModel!
                                              .data![index]);
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: Provider.of<WishlistProvider>(
                                            context,
                                            listen: true)
                                        .wishlistModel!
                                        .data!
                                        .length,
                                    itemBuilder: (context, index) {
                                      return SavedItemWidget(
                                          Provider.of<WishlistProvider>(context,
                                                  listen: true)
                                              .wishlistModel!
                                              .data![index]);
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: Provider.of<WishlistProvider>(
                                            context,
                                            listen: true)
                                        .wishlistModel!
                                        .data!
                                        .length,
                                    itemBuilder: (context, index) {
                                      return SavedItemWidget(
                                          Provider.of<WishlistProvider>(context,
                                                  listen: true)
                                              .wishlistModel!
                                              .data![index]);
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: Provider.of<WishlistProvider>(
                                            context,
                                            listen: true)
                                        .wishlistModel!
                                        .data!
                                        .length,
                                    itemBuilder: (context, index) {
                                      return SavedItemWidget(
                                          Provider.of<WishlistProvider>(context,
                                                  listen: true)
                                              .wishlistModel!
                                              .data![index]);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
