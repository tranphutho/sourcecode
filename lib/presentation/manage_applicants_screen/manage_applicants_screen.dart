import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hires/models/applicant_detail_model.dart';
import 'package:hires/models/applicants_model.dart';
import 'package:hires/providers/applicants_provider.dart';
import 'package:provider/provider.dart';

class ManageApplicantsScreen extends StatefulWidget {
  static String id = "manageApplicants";
  const ManageApplicantsScreen({Key? key}) : super(key: key);

  @override
  State<ManageApplicantsScreen> createState() => _ManageApplicantsScreenState();
}

class _ManageApplicantsScreenState extends State<ManageApplicantsScreen> {
  late TextEditingController txtSearchJob;



  List<ApplicantDetailModel> searchedApplicants = [];


  List<DropdownMenuItem<dynamic>>? jobTitlesList = [
    DropdownMenuItem(
        child: Text("--Select Job--", style: TextStyle(color: Colors.black),),
        value: "--Select Job--"
    ),
    DropdownMenuItem(
      child: Text("Flutter Developer", style: TextStyle(color: Colors.black),),
      value: "Flutter Developer",
    ),
    DropdownMenuItem(
        child: Text("PHP Developer", style: TextStyle(color: Colors.black),),
        value: "PHP Developer"
    ),
  ];


  @override
  void initState() {
    txtSearchJob = TextEditingController(text: "");
    super.initState();
    Provider.of<ApplicantProvider>(context,listen: false).getApplicants(context);
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
          "Manage Applicants",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<ApplicantProvider>(
          builder: (context,provider,_) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 30,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          color: Colors.grey,
                          offset: Offset(
                              3,3
                          )
                      ),
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
                              "Manage Applicants",
                              style: TextStyle(
                                  fontSize: 18
                              ),
                            )
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height / 25,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 50,
                              width: 225,
                              child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color:Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.circular(15), //border raiuds of dropdown button
                                  ),
                                  child:Padding(
                                      padding: EdgeInsets.only(left:30, right:30),
                                      child:DropdownButton<dynamic>(
                                        value:"Flutter Developer",
                                        items: jobTitlesList,
                                        onChanged: (value){ //get value when changed
                                        },
                                        icon: Padding(
                                            padding: EdgeInsets.only(left:20),
                                            child:Icon(Icons.arrow_drop_down)
                                        ),
                                        style: TextStyle(
                                            fontSize: 16
                                        ),

                                        dropdownColor: Color(0xFFD9D9D9), //dropdown background color
                                        underline: Container(), //remove underline
                                        isExpanded: true, //make true to make width 100%
                                      )
                                  )
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 110,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                  });
                                },
                                child: const Text("Search"),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side: BorderSide(color: Colors.blue)
                                    )
                                  )
                                )
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height / 30,),
                        Align(
                          alignment: Alignment.topRight,
                          child: SizedBox(
                            height: 50,
                            width: 110,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                });
                              },
                              child: const Text("Export"),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.amber),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side: BorderSide(color: Colors.amber)
                                  )
                                )
                              )
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height / 30,),
                        Container(
                          height: MediaQuery.of(context).size.height / 1.9,
                          child:(provider.applicantsModel!.data!=null && provider.applicantsModel!.data!.isNotEmpty)? ListView.builder(
                            itemCount:provider.applicantsModel!.data!.length ,
                            itemBuilder: (context, index) {
                              Applicant applicant=provider.applicantsModel!.data![index];
                              return Padding(
                                padding: EdgeInsets.fromLTRB(0,0,0,MediaQuery.of(context).size.height / 25),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  color: Color(0xFFD9D9D9),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 180,
                                              child: RichText(
                                                text: TextSpan(
                                                  text: 'Candidate: ',
                                                  style: TextStyle(
                                                    color: Colors.blueAccent, fontSize: 17
                                                  ),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: applicant.candidateInfo!.user!.name,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black
                                                      ),
                                                    )
                                                  ]
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 120,
                                              child: RichText(
                                                text: TextSpan(
                                                  text: 'Status: ',
                                                  style: TextStyle(
                                                    color: Colors.blueAccent, fontSize: 17
                                                  ),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: applicant.status,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black
                                                      ),
                                                    )
                                                  ]
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 50,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 180,
                                              child: RichText(
                                                text: TextSpan(
                                                  text: 'Job Title: ',
                                                  style: TextStyle(
                                                      color: Colors.blueAccent, fontSize: 17
                                                  ),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: applicant.jobInfo!.title,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black
                                                      ),
                                                    )
                                                  ]
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 120,
                                              child: RichText(
                                                text: TextSpan(
                                                  text: 'Date Applied: ',
                                                  style: TextStyle(
                                                    color: Colors.blueAccent, fontSize: 17
                                                  ),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: DateFormat.yMMMMd().format(applicant.createdAt!),
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black
                                                      ),
                                                    )
                                                  ]
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 50,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 120,
                                              child: RichText(
                                                text: TextSpan(
                                                  text: 'CV: ',
                                                  style: TextStyle(
                                                    color: Colors.blueAccent, fontSize: 17
                                                  ),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: applicant.cvInfo!.media!.fileName,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black
                                                      ),
                                                    )
                                                  ]
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 20,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  IconButton(
                                                    icon: Icon(Icons.check, color: Colors.blueAccent,),
                                                    onPressed: () {
                                                      provider.changeApplicantStatus(context, applicant,status: "approved");
                                                    },
                                                  ),
                                                  IconButton(
                                                    icon: Icon(CupertinoIcons.xmark_circle, color: Colors.blueAccent,),
                                                    onPressed: () {
                                                      provider.changeApplicantStatus(context, applicant,status: "rejected");

                                                    },
                                                  ),
                                                  IconButton(
                                                    icon: Icon(Icons.remove_red_eye, color: Colors.blueAccent,),
                                                    onPressed: () {},
                                                  ),
                                                  IconButton(
                                                    icon: Icon(Icons.delete_outline, color: Colors.blueAccent,),
                                                    onPressed: () {
                                                      provider.changeApplicantStatus(context, applicant,status: "delete");

                                                    },
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
                              );
                            }
                          ):Center(child: CircularProgressIndicator(),),
                        )
                      ]
                    )
                  )
                )
              ]
            );
          }
        )
      )
    );
  }
}
