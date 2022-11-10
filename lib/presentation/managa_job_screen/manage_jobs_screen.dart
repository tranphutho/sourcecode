import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hires/models/job_model.dart';

class ManageJobsScreen extends StatefulWidget {
  static String id = "manageJobs";
  const ManageJobsScreen({Key? key}) : super(key: key);

  @override
  State<ManageJobsScreen> createState() => _ManageJobsScreenState();
}

class _ManageJobsScreenState extends State<ManageJobsScreen> {

  late TextEditingController txtSearchJob;
  List<Job> jobs = [
    Job(
        title: "Software Engineer",
        location: Location(name: "Biratnagar"),
        category: Category(name: "Development"),
        status: "Active",
        expirationDate: DateTime.now()
    ),
    Job(
        title: "Social Media Manager",
        location: Location(name: "Kathmandu"),
        category: Category(name: "Marketing"),
        status: "Expired",
        expirationDate: DateTime.now()
    ),
    Job(
        title: "PHP Developer",
        location: Location(name: "Bihar"),
        category: Category(name: "Development"),
        status: "Expired",
        expirationDate: DateTime.now()
    )
  ];
  List<Job> searchedJobs = [];

  getSearchedJobs() {
    searchedJobs.clear();
    jobs.forEach((job) {
      if(job.title!.toLowerCase().contains(txtSearchJob.text.toLowerCase())) {
        searchedJobs.add(job);
      }
    });
  }


  @override
  void initState() {
    txtSearchJob = TextEditingController(text: "");
    super.initState();
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
            SizedBox(height: 30,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
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
                          "Manage Jobs",
                          style: TextStyle(
                              fontSize: 18
                          ),
                        )
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 225,
                          child: TextFormField(
                            controller: txtSearchJob,
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
                                getSearchedJobs();
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
                    SizedBox(height: 50,),
                    Container(
                      height: 560,
                      child: ListView.builder(
                        itemCount: searchedJobs.length == 0 ? jobs.length : searchedJobs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0,0,0,50),
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
                                              text: 'Title:  ',
                                              style: TextStyle(
                                                color: Colors.blueAccent, fontSize: 17
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: searchedJobs.length == 0 ? jobs[index].title : searchedJobs[index].title,
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
                                                text: 'Status:  ',
                                                style: TextStyle(
                                                    color: Colors.blueAccent, fontSize: 17
                                                ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: searchedJobs.length == 0 ? jobs[index].status : searchedJobs[index].status,
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
                                                text: 'Location:  ',
                                                style: TextStyle(
                                                    color: Colors.blueAccent, fontSize: 17
                                                ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: searchedJobs.length == 0
                                                        ? jobs[index].location?.name
                                                        : searchedJobs[index].location?.name,
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
                                                text: 'Date:  ',
                                                style: TextStyle(
                                                    color: Colors.blueAccent, fontSize: 17
                                                ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: searchedJobs.length == 0
                                                        ? "${jobs[index].expirationDate?.day}/${jobs[index].expirationDate?.month}/${jobs[index].expirationDate?.year}"
                                                        : "${searchedJobs[index].expirationDate?.day}/${searchedJobs[index].expirationDate?.month}/${searchedJobs[index].expirationDate?.year}",
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
                                          width: 172,
                                          child: RichText(
                                            text: TextSpan(
                                                text: 'Category:  ',
                                                style: TextStyle(
                                                    color: Colors.blueAccent, fontSize: 17
                                                ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: jobs[index].category?.name,
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
                                                icon: Icon(Icons.remove_red_eye, color: Colors.blueAccent,),
                                                onPressed: () {},
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.edit, color: Colors.blueAccent,),
                                                onPressed: () {},
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.delete_outline, color: Colors.blueAccent,),
                                                onPressed: () {},
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
                      ),
                    )
                  ]
                )
              )
            )
          ]
        )
      )
    );
  }
}
