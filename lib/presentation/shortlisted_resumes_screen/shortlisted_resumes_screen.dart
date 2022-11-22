import 'package:flutter/material.dart';
import 'package:hires/core/utils/color_constant.dart';
import 'package:hires/core/utils/math_utils.dart';
import 'package:hires/models/candidates_model.dart';
import 'package:hires/models/find_jobs.dart';
import 'package:hires/models/wishlist_model.dart';
import 'package:hires/providers/resumes_provider.dart';
import 'package:provider/provider.dart';

class ShortlistedResumesScreen extends StatefulWidget {
  static String id = "shortlistedResumes";
  const ShortlistedResumesScreen({Key? key}) : super(key: key);


  @override
  State<ShortlistedResumesScreen> createState() => _ShortlistedResumesScreenState();
}

class _ShortlistedResumesScreenState extends State<ShortlistedResumesScreen> {
  late TextEditingController txtSearchResume;

  List<Cadidate> resumes = [
    Cadidate(
      title: "Rajeev kumar majhi",
      gender: "Mr.",
    ),
    Cadidate(
      title: "Biman lakhey",
      gender: "Mr.",
    ),
    Cadidate(
      title: "Sakura harano",
      gender: "Mrs.",
    )
  ];
  List<Cadidate> searchedResumes = [];

  getSearchedResumes() {
    searchedResumes.clear();
    resumes.forEach((resume) {
      if(resume.title!.toLowerCase().contains(txtSearchResume.text.toLowerCase())) {
        searchedResumes.add(resume);
      }
    });
  }


  @override
  void initState() {
    txtSearchResume = TextEditingController(text: "");
    super.initState();
    Provider.of<ResumeProvider>(context,listen: false).getShortlistedResumes(context);
  }

  @override
  void dispose() {
    txtSearchResume.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Shortlisted Resumes",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<ResumeProvider>(
          builder: (context,provider,_) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
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
                            "Shortlisted Resumes",
                            style: TextStyle(
                              fontSize: 18
                            ),
                          )
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height / 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50,
                              width: 225,
                              child: TextFormField(
                                controller: txtSearchResume,
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
                                  setState(() {
                                    getSearchedResumes();
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
                        SizedBox(
                          height: 520,
                          width: 400,
                          child:provider.shortlistedResumes!=null? ListView.builder(
                            itemCount:(provider.searchedResumes!.data==null || provider.searchedResumes!.data!.isEmpty)? provider.shortlistedResumes!.data!.length:provider.searchedResumes!.data!.length,
                            itemBuilder: (context, index) {
                              Wishlist wishlist=(provider.searchedResumes!.data==null || provider.searchedResumes!.data!.isEmpty)? provider.shortlistedResumes!.data![index]:provider.searchedResumes!.data![index];
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,0,40),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  color: Color(0xFFD9D9D9),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 30.0,
                                      horizontal: 20.0
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(50)
                                          ),
                                          child: Image.asset(
                                            "assets/images/default_image.png",
                                            fit: BoxFit.cover,
                                            height: 50,
                                            width: 50,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              wishlist.company!=null?  wishlist.company!.name!:"Null",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500
                                              ),

                                            ),
                                            SizedBox(height: 10,),

                                          ],
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete_outline, color: Colors.red,),
                                          onPressed: () {
                                            setState(() {
                                              var wishlist=provider.shortlistedResumes!.data![index];
                                              provider.removeResume(context,wishlist);
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                          )
                        :Text("No data")),
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
