import 'package:flutter/material.dart';
import 'package:hires/models/job_model.dart';

class Employer {
  String? name;
  Location? location;
  Category? category;
  int? openJobs;
  String? status;


  Employer({
    this.name,
    this.location,
    this.category,
    this.openJobs,
    this.status
});
}

class FollowingEmployerScreen extends StatefulWidget {
  static String id = "followingEmployer";
  const FollowingEmployerScreen({Key? key}) : super(key: key);

  @override
  State<FollowingEmployerScreen> createState() => _FollowingEmployerScreenState();
}

class _FollowingEmployerScreenState extends State<FollowingEmployerScreen> {
  late TextEditingController txtSearchEmployer;
  List<Employer> employers = [
    Employer(
      name: "Matin Softech",
      location: Location(name: "Biratnagar"),
      category: Category(name: "Development"),
      openJobs: 2,
      status: "Active",
    ),
    Employer(
      name: "Spinks Softech",
      location: Location(name: "Kathmandu"),
      category: Category(name: "Software"),
      openJobs: 5,
      status: "Expired",
    ),
  ];
  List<Employer> searchedEmployers = [];

  getSearchedEmployers() {
    searchedEmployers.clear();
    employers.forEach((employer) {
      if(employer.name!.toLowerCase().contains(txtSearchEmployer.text.toLowerCase())) {
        searchedEmployers.add(employer);
      }
    });
  }

  @override
  void initState() {
    txtSearchEmployer = TextEditingController(text: "");
    super.initState();
  }

  @override
  void dispose() {
    txtSearchEmployer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Following Employers",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                        "Following Employers",
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
                            controller: txtSearchEmployer,
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
                                getSearchedEmployers();
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
                      height: MediaQuery.of(context).size.height! / 1.56,
                      child: ListView.builder(
                        itemCount: searchedEmployers.length == 0 ? employers.length : searchedEmployers.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.fromLTRB(0,0,0,MediaQuery.of(context).size.height / 25,),
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
                                              text: 'Name: ',
                                              style: TextStyle(
                                                  color: Colors.blueAccent, fontSize: 17
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: searchedEmployers.length == 0 ? employers[index].name : searchedEmployers[index].name,
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
                                              text: 'Featured: ',
                                              style: TextStyle(
                                                color: Colors.blueAccent, fontSize: 17
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: searchedEmployers.length == 0 ? employers[index].status : searchedEmployers[index].status,
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
                                    SizedBox(height: 35.0,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 180,
                                          child: RichText(
                                            text: TextSpan(
                                              text: 'Location: ',
                                              style: TextStyle(
                                                color: Colors.blueAccent, fontSize: 17
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: searchedEmployers.length == 0
                                                    ? employers[index].location?.name
                                                    : searchedEmployers[index].location?.name,
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
                                              text: 'Open Jobs: ',
                                              style: TextStyle(
                                                color: Colors.blueAccent, fontSize: 17
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: searchedEmployers.length == 0
                                                    ? employers[index].openJobs.toString()
                                                    : searchedEmployers[index].openJobs.toString(),
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
                                    SizedBox(height: 35.0,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 172,
                                          child: RichText(
                                            text: TextSpan(
                                              text: 'Job Category: ',
                                              style: TextStyle(
                                                color: Colors.blueAccent, fontSize: 17
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: searchedEmployers.length == 0
                                                    ? employers[index].category?.name
                                                    : searchedEmployers[index].category?.name,
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
                                                icon: Icon(Icons.delete_outline, color: Colors.blueAccent,),
                                                onPressed: () {
                                                  setState(() {
                                                    employers.removeAt(index);
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      ),
                    ),
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
