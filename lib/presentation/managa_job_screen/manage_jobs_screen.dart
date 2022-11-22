import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hires/models/job_model.dart';
import 'package:hires/models/my_job_model.dart';
import 'package:hires/models/user_model.dart';
import 'package:hires/presentation/job_details1_screen/job_details1_screen.dart';
import 'package:hires/presentation/job_details_screen/job_details_screen.dart';
import 'package:hires/presentation/update_job_screen/update_job_screen.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


import '../../models/media_model.dart';

import '../../core/utils/common_utils.dart';

import '../common_widget/LazyLoaderFooter.dart';

class ManageJobsScreen extends StatefulWidget {
  static String id = "manageJobs";
  const ManageJobsScreen({Key? key}) : super(key: key);

  @override
  State<ManageJobsScreen> createState() => _ManageJobsScreenState();
}

class _ManageJobsScreenState extends State<ManageJobsScreen> {
  late TextEditingController txtSearchJob;
  // List<Job> jobs = [
  //   Job(
  //       title: "Software Engineer",
  //       location: Location(name: "Biratnagar"),
  //       category: Category(name: "Development"),
  //       status: "Active",
  //       expirationDate: DateTime.now()),
  //   Job(
  //       title: "Social Media Manager",
  //       location: Location(name: "Kathmandu"),
  //       category: Category(name: "Marketing"),
  //       status: "Expired",
  //       expirationDate: DateTime.now()),
  //   Job(
  //       title: "PHP Developer",
  //       location: Location(name: "Bihar"),
  //       category: Category(name: "Development"),
  //       status: "Expired",
  //       expirationDate: DateTime.now())
  // ];
  List<Job> searchedJobs = [];


  UserModel? userApp;
  bool? _loading = true;

  @override
  void initState() {
    txtSearchJob = TextEditingController(text: "");
    super.initState();
    userApp = Provider.of<UserProvider>(context, listen: false).userApp!;
    Provider.of<MyJobProvider>(context, listen: false)
        .intit(userApp!.token!)
        .then(
      (value) {
        Provider.of<MediaProvider>(context, listen: false)
            .getMediaImage()
            .then((value) => setState(() {
                  _loading = false;
                }));
      },
    );
  }

  @override
  void dispose() {
    txtSearchJob.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Manage Jobs",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              SizedBox(
                height: 20,
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          color: Colors.grey,
                          offset: Offset(3, 3)),
                    ],
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Manage Jobs",
                                  style: TextStyle(fontSize: 18),
                                )),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 50,
                                  width: 225,
                                  child: TextFormField(
                                    controller: txtSearchJob,
                                    onChanged: (value){
                                      print(value);
                                      Provider.of<MyJobProvider>(context,listen: false).searchJobs(txtSearchJob.text);


                                    },
                                    decoration: InputDecoration(
                                      hintText: "Search by name...",
                                      fillColor: Color(0xFFD9D9D9),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 110,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Provider.of<MyJobProvider>(context,listen: false).searchJobs(txtSearchJob.text);
                                      },
                                      child: const Text("Search"),
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  side: BorderSide(
                                                      color: Colors.blue))))),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 530,
                              child: Consumer<MyJobProvider>(
                                  builder: (context, value, child) {
                                if (_loading!)
                                  return Center(
                                      child: CircularProgressIndicator());
                                else
                                  return SmartRefresher(
                                    enablePullDown: false,
                                    controller: value.myjobRefreshController,
                                    onLoading: () {
                                      Provider.of<MyJobProvider>(context,
                                              listen: false)
                                          .intit(userApp!.token!);
                                    },
                                    footer: LazyLoaderFooter(),
                                    child:(value.searchedJobs!.data==null || value.searchedJobs!.data!.length<=0)? ListView.builder(
                                        itemCount:
                                            value.myJobsModel!.data!.length,
                                        itemBuilder: (context, index) {

                                          return Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 30),
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              color: Color(0xFFD9D9D9),
                                              child: InkWell(
                                                onTap: () =>
                                                    Navigator.pushNamed(context,
                                                        JobDetails1Screen.id,
                                                        arguments: value
                                                            .myJobsModel!
                                                            .data![index]),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 30),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            width: 180,
                                                            child: RichText(
                                                              text: TextSpan(
                                                                  text:
                                                                      'Title:  ',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .blueAccent,
                                                                      fontSize:
                                                                          17),
                                                                  children: <
                                                                      TextSpan>[
                                                                    TextSpan(
                                                                      text: value
                                                                          .myJobsModel!
                                                                          .data![
                                                                              index]
                                                                          .title,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              Colors.black),
                                                                    )
                                                                  ]),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 120,
                                                            child: RichText(
                                                              text: TextSpan(
                                                                  text:
                                                                      'Status:  ',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .blueAccent,
                                                                      fontSize:
                                                                          17),
                                                                  children: <
                                                                      TextSpan>[
                                                                    TextSpan(
                                                                      text: value
                                                                          .myJobsModel!
                                                                          .data![
                                                                              index]
                                                                          .status,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              Colors.black),
                                                                    )
                                                                  ]),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 25,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            width: 180,
                                                            child: RichText(
                                                              text: TextSpan(
                                                                  text:
                                                                      'Location:  ',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .blueAccent,
                                                                      fontSize:
                                                                          17),
                                                                  children: <
                                                                      TextSpan>[
                                                                    TextSpan(
                                                                      text:
                                                                          "Ấn độ",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              Colors.black),
                                                                    )
                                                                  ]),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 120,
                                                            child: RichText(
                                                              text: TextSpan(
                                                                  text:
                                                                      'Date:  ',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .blueAccent,
                                                                      fontSize:
                                                                          17),
                                                                  children: <
                                                                      TextSpan>[
                                                                    TextSpan(
                                                                      text: DateFormat('yyyy-MM-dd').format(value
                                                                          .myJobsModel!
                                                                          .data![
                                                                              index]
                                                                          .createdAt!),
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              Colors.black),
                                                                    )
                                                                  ]),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 25,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            width: 172,
                                                            child: RichText(
                                                              text: TextSpan(
                                                                  text:
                                                                      'Category:  ',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .blueAccent,
                                                                      fontSize:
                                                                          17),
                                                                  children: <
                                                                      TextSpan>[
                                                                    TextSpan(
                                                                      text:
                                                                          "Lập trình",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              Colors.black),
                                                                    )
                                                                  ]),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 30,
                                                            // color: Colors.blue,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                // IconButton(
                                                                //   icon: Icon(
                                                                //     Icons
                                                                //         .remove_red_eye,
                                                                //     color: Colors
                                                                //         .blueAccent,
                                                                //   ),
                                                                //   onPressed:
                                                                //       () {},
                                                                // ),

                                                                Container(
                                                                  child: Center(
                                                                    child:
                                                                        IconButton(
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .edit,
                                                                        color: Colors
                                                                            .blueAccent,
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        print(
                                                                            "object2");

                                                                        MyJob myJob = MyJob(
                                                                            id: value.myJobsModel!.data![index].id,
                                                                            title: value.myJobsModel!.data![index].title,
                                                                            content: value.myJobsModel!.data![index].content,
                                                                            thumbnailId: value.myJobsModel!.data![index].thumbnailId,
                                                                            categoryId: value.myJobsModel!.data![index].categoryId,
                                                                            locationId: value.myJobsModel!.data![index].locationId,
                                                                            jobTypeId: value.myJobsModel!.data![index].jobTypeId,
                                                                            expirationDate: DateFormat('yyyy-MM-dd').format(value.myJobsModel!.data![index].expirationDate!),
                                                                            hours: value.myJobsModel!.data![index].hours,
                                                                            hoursType: value.myJobsModel!.data![index].hoursType,
                                                                            salaryMin: double.parse(value.myJobsModel!.data![index].salaryMin!).toInt(),
                                                                            salaryMax: double.parse(value.myJobsModel!.data![index].salaryMax!).toInt(),
                                                                            salaryType: value.myJobsModel!.data![index].salaryType,
                                                                            gender: value.myJobsModel!.data![index].gender,
                                                                            mapLat: value.myJobsModel!.data![index].mapLat,
                                                                            mapLng: value.myJobsModel!.data![index].mapLng,
                                                                            mapZoom: value.myJobsModel!.data![index].mapZoom,
                                                                            experience: value.myJobsModel!.data![index].experience,
                                                                            isFeatured: value.myJobsModel!.data![index].isFeatured,
                                                                            isUrgent: value.myJobsModel!.data![index].isUrgent.toString(),
                                                                            status: value.myJobsModel!.data![index].status,
                                                                            applyEmail: value.myJobsModel!.data![index].applyEmail,
                                                                            applyLink: value.myJobsModel!.data![index].applyLink,
                                                                            applyType: value.myJobsModel!.data![index].applyType,
                                                                            wageAgreement: value.myJobsModel!.data![index].wageAgreement,
                                                                            gallery: value.myJobsModel!.data![index].gallery,
                                                                            video: value.myJobsModel!.data![index].video,
                                                                            videoCoverId: value.myJobsModel!.data![index].videoCoverId.toString(),
                                                                            numberRecruitment: value.myJobsModel!.data![index].numberRecruitments,
                                                                            jobSkills: value.myJobsModel!.data![index].skills!.map((e) => e.id!).toList());

                                                                        Navigator.pushNamed(
                                                                            context,
                                                                            UpdateJobScreen
                                                                                .id,
                                                                            arguments:
                                                                                myJob);
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  child:
                                                                      IconButton(
                                                                    icon: Icon(
                                                                      Icons
                                                                          .delete_outline,
                                                                      color: Colors
                                                                          .blueAccent,
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                          loadingDialog(context);

                                                                      Provider.of<MyJobProvider>(
                                                                              context,
                                                                              listen:
                                                                                  false)
                                                                          .destroyMyJob(
                                                                              value.myJobsModel!.data![index].id.toString(),
                                                                              userApp!.token!)
                                                                          .then(
                                                                        (value) {
                                                                          Navigator.pop(context);
                                                                          Provider.of<MyJobProvider>(context, listen: false)
                                                                              .intit(userApp!.token!);
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),

                                              ),
                                            ),
                                          );
                                        }):ListView.builder(
                                        itemCount:
                                        value.searchedJobs!.data!.length,
                                        itemBuilder: (context, index) {

                                          return Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 30),
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(15.0),

                                              ),
                                              color: Color(0xFFD9D9D9),
                                              child: InkWell(
                                                onTap: () =>
                                                    Navigator.pushNamed(context,
                                                        JobDetails1Screen.id,
                                                        arguments: value.searchedJobs!
                                                            .data![index]),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 30),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Container(
                                                            width: 180,
                                                            child: RichText(
                                                              text: TextSpan(
                                                                  text:
                                                                  'Title:  ',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .blueAccent,
                                                                      fontSize:
                                                                      17),
                                                                  children: <
                                                                      TextSpan>[
                                                                    TextSpan(
                                                                      text: value.searchedJobs!
                                                                          .data![
                                                                      index]
                                                                          .title,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                          14,
                                                                          color:
                                                                          Colors.black),
                                                                    )
                                                                  ]),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 120,
                                                            child: RichText(
                                                              text: TextSpan(
                                                                  text:
                                                                  'Status:  ',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .blueAccent,
                                                                      fontSize:
                                                                      17),
                                                                  children: <
                                                                      TextSpan>[
                                                                    TextSpan(
                                                                      text:value.searchedJobs!
                                                                          .data![
                                                                      index]
                                                                          .status,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                          14,
                                                                          color:
                                                                          Colors.black),
                                                                    )
                                                                  ]),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 25,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Container(
                                                            width: 180,
                                                            child: RichText(
                                                              text: TextSpan(
                                                                  text:
                                                                  'Location:  ',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .blueAccent,
                                                                      fontSize:
                                                                      17),
                                                                  children: <
                                                                      TextSpan>[
                                                                    TextSpan(
                                                                      text:
                                                                      "Ấn độ",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                          14,
                                                                          color:
                                                                          Colors.black),
                                                                    )
                                                                  ]),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 120,
                                                            child: RichText(
                                                              text: TextSpan(
                                                                  text:
                                                                  'Date:  ',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .blueAccent,
                                                                      fontSize:
                                                                      17),
                                                                  children: <
                                                                      TextSpan>[
                                                                    TextSpan(
                                                                      text: DateFormat('yyyy-MM-dd').format(value.searchedJobs!
                                                                          .data![
                                                                      index]
                                                                          .createdAt!),
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                          14,
                                                                          color:
                                                                          Colors.black),
                                                                    )
                                                                  ]),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 25,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Container(
                                                            width: 172,
                                                            child: RichText(
                                                              text: TextSpan(
                                                                  text:
                                                                  'Category:  ',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .blueAccent,
                                                                      fontSize:
                                                                      17),
                                                                  children: <
                                                                      TextSpan>[
                                                                    TextSpan(
                                                                      text:
                                                                      "Lập trình",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                          14,
                                                                          color:
                                                                          Colors.black),
                                                                    )
                                                                  ]),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 30,
                                                            // color: Colors.blue,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                              children: [
                                                                // IconButton(
                                                                //   icon: Icon(
                                                                //     Icons
                                                                //         .remove_red_eye,
                                                                //     color: Colors
                                                                //         .blueAccent,
                                                                //   ),
                                                                //   onPressed:
                                                                //       () {},
                                                                // ),

                                                                Container(
                                                                  child: Center(
                                                                    child:
                                                                    IconButton(
                                                                      icon:
                                                                      Icon(
                                                                        Icons
                                                                            .edit,
                                                                        color: Colors
                                                                            .blueAccent,
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        print(
                                                                            "object2");
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  child:
                                                                  IconButton(
                                                                    icon: Icon(
                                                                      Icons
                                                                          .delete_outline,
                                                                      color: Colors
                                                                          .blueAccent,
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      Provider.of<MyJobProvider>(
                                                                          context,
                                                                          listen:
                                                                          false)
                                                                          .destroyMyJob(
                                                                          value.myJobsModel!.data![index].id.toString(),
                                                                          userApp!.token!)
                                                                          .then(
                                                                            (value) {
                                                                          Provider.of<MyJobProvider>(context, listen: false)
                                                                              .intit(userApp!.token!);
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  );
                              }),
                            )
                          ])))
            ])));
  }
}
