import 'package:flutter/material.dart';
import 'package:hires/presentation/homepage_3_screen/widgets/group568_item_widget.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../core/utils/math_utils.dart';
import '../../models/job_model.dart';
import '../common_widget/LazyLoaderFooter.dart';

class PopularJobes extends StatefulWidget {
  static String id = "PopularJobes";
  PopularJobes({Key? key}) : super(key: key);
  @override
  State<PopularJobes> createState() => _PopularJobes();
}

class _PopularJobes extends State<PopularJobes> {
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
            "Popular Jobs",
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
          padding: EdgeInsets.symmetric(),
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
                child: ListView.builder(
                  padding: EdgeInsets.only(top: getVerticalSize(30)),
                  shrinkWrap: true,
                  itemCount: popularJob!.data!.length,
                  itemBuilder: (context, index) {
                    return Group568ItemWidget(job: popularJob!.data![index]);
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
