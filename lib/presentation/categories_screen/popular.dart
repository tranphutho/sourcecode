import 'package:flutter/material.dart';
import 'package:hires/presentation/categories_screen/widgets/categories_item_widget.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../core/utils/math_utils.dart';
import '../../models/job_model.dart';
import '../common_widget/LazyLoaderFooter.dart';

class Popular extends StatefulWidget {
  const Popular({Key? key}) : super(key: key);
  static String id = "Popular";
  @override
  State<Popular> createState() => _Popular();
}

class _Popular extends State<Popular> {
  JobsModel? popularJob;
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _isLoading = true;
    });
    Provider.of<JobProvider>(context, listen: false)
        .findPobularJobs()
        .then((_) {
      popularJob =
          Provider.of<JobProvider>(context, listen: false).popularJobModel;
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Consumer<JobProvider>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Popular",
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
                        color: isDark ? Colors.white : Colors.black)),
              ),
            ),
          ),
        ),
        body: Padding(
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
              return SmartRefresher(
                enablePullDown: false,
                controller: value.jobRefreshController,
                onLoading: () {
                  Provider.of<JobProvider>(context, listen: false)
                      .findPobularJobs()
                      .then((_) {
                    popularJob =
                        Provider.of<JobProvider>(context, listen: false)
                            .popularJobModel;
                  });
                },
                footer: LazyLoaderFooter(),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                  itemCount: popularJob!.data!.length,
                  itemBuilder: (context, index) {
                    return CategoriesItemWidget(
                      job: popularJob!.data![index],
                    );
                  },
                ),
              );
            }
          }),
        ),
      );
    });
  }
}
