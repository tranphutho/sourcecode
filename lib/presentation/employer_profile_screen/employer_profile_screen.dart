import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hires/core/app_export.dart';
import 'package:hires/core/utils/math_utils.dart';
import 'package:hires/models/employers_model.dart';
import 'package:hires/models/user_model.dart';
import 'package:hires/presentation/employer_profile_screen/widgets/custom_contact_us_textfield.dart';
import 'package:provider/provider.dart';
import 'package:flutter_html/flutter_html.dart';

class EmployerProfileScreen extends StatefulWidget {
  static String id = "employersProfileScreen";
  const EmployerProfileScreen({Key? key}) : super(key: key);

  @override
  State<EmployerProfileScreen> createState() => _EmployerProfileScreenState();
}

class _EmployerProfileScreenState extends State<EmployerProfileScreen> {
  Employer? employer;
  TextEditingController? contactNameController;
  TextEditingController? contactEmailController;
  TextEditingController? contactMessageController;

  @override
  void initState() {
    contactNameController = TextEditingController();
    contactEmailController = TextEditingController();
    contactMessageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    contactNameController!.dispose();
    contactEmailController!.dispose();
    contactMessageController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    employer = ModalRoute.of(context)?.settings.arguments as Employer;
    UserModel usePrv = Provider.of<UserProvider>(
      context,
    ).userApp!;
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Container(
                height: screenWidth / 1.3,
                width: screenWidth,
                decoration: BoxDecoration(
                    boxShadow: [

                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: -20.0,
                        blurRadius: 20.0,
                      ),
                    ],
                  color: ColorConstant.gray100,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)
                  )
                ),
                child:
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: screenWidth / 10,),
                      Text(
                        employer!.name.toString(),
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.grey.shade500,
                                size: 20,
                              ),
                              SizedBox(width: 5,),
                              SizedBox(
                                width: 60,
                                child: Text(
                                  employer!.location?.name ?? "none",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.briefcase,
                                color: Colors.grey.shade500,
                                size: 20,
                              ),
                              SizedBox(width: 5,),
                              SizedBox(
                                width: 80,
                                child: Text(
                                  employer!.category!.name ?? "none",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.phone,
                                color: Colors.grey.shade500,
                                size: 20,
                              ),
                              SizedBox(width: 5,),
                              SizedBox(
                                width: 102,
                                child: Text(
                                  employer!.phone ?? "none",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.mail,
                            color: Colors.grey.shade500,
                            size: 20,
                          ),
                          SizedBox(width: 5,),
                          Text(
                            employer!.email.toString() ?? "",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 40,
                        width: 125,
                        decoration: BoxDecoration(
                          color: Color(0xFFd4e2f4),
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Center(
                          child: Text(
                            "Open Jobs - ${employer!.jobCount ?? "0"}",
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ),
                      ),
                      SizedBox(height: screenWidth / 10,),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: screenWidth / 6,),
            employer!.about != null ? Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "About Company",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  Html(data: employer?.about)
                ],
              )
            ) : Container(),
            SizedBox(height: screenWidth / 6,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${employer!.jobCount.toString() ?? "0"} jobs at ${employer!.name}",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    employer!.jobCount != 0 ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: employer!.jobCount,
                      itemBuilder: (context, index) {
                        return employer?.jobs != null
                          ? Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorConstant.gray100,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 7,
                                    offset: Offset(3,3)
                                  )
                                ]
                              ),
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    employer!.jobs![index].title ?? "",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  SizedBox(height: screenWidth / 12,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.watch_later_outlined,
                                            color: Colors.grey.shade500,
                                            size: 20,
                                          ),
                                          SizedBox(width: 5,),
                                          Text(
                                            employer!.jobs![index].hours ?? "0",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.grey.shade500,
                                            size: 20,
                                          ),
                                          SizedBox(width: 5,),
                                          Text(
                                            employer!.location?.name ?? "",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.calendar,
                                            color: Colors.grey.shade500,
                                            size: 20,
                                          ),
                                          SizedBox(width: 5,),
                                          Text(
                                            employer!.jobs?[index].expirationDate ?? "",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: screenWidth / 12,),
                                  Row(
                                    children: [
                                      employer!.jobs?[index].isFeatured == 1
                                        ? Container(
                                          height: 40,
                                          width: 125,
                                          decoration: BoxDecoration(
                                              color: Color(0xFFdde8fa),
                                              borderRadius: BorderRadius.circular(30)
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Featured",
                                              style: TextStyle(color: Colors.blue),
                                            ),
                                          ),
                                        )
                                        : Container(),
                                        SizedBox(width: screenWidth / 15,),
                                        employer!.jobs?[index].isUrgent == 1
                                            ? Container(
                                          height: 40,
                                          width: 125,
                                          decoration: BoxDecoration(
                                              color: Color(0xFFfef2d8),
                                              borderRadius: BorderRadius.circular(30)
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Urgent",
                                              style: TextStyle(color: Colors.amber),
                                            ),
                                          ),
                                        ) : Container()
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                          : Container();
                      }
                    ) : Container(),

                  ],
                ),
              ),
            ),
            SizedBox(height: screenWidth / 6,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Container(
                decoration: BoxDecoration(
                    color: ColorConstant.gray100,
                  borderRadius: BorderRadius.circular(15)
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customCompanyInfoRow(
                      title: "Primary industry:",
                      value: employer!.category?.name
                    ),
                    customCompanyInfoRow(
                        title: "Company size:",
                        value: employer!.company?.teamSize.toString()
                    ),
                    customCompanyInfoRow(
                        title: "Founded in:",
                        value: employer!.foundedIn
                    ),
                    customCompanyInfoRow(
                        title: "Phone:",
                        value: employer!.phone
                    ),
                    customCompanyInfoRow(
                        title: "Email:",
                        value: employer!.email
                    ),
                    customCompanyInfoRow(
                        title: "Location:",
                        value: employer!.location?.name
                    ),
                    Container(
                      height: screenWidth / 8,
                      decoration: BoxDecoration(
                        color: Color(0xFFdde8fa),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(
                        child: Text(employer!.website ?? ""),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: screenWidth / 6,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Container(
                decoration: BoxDecoration(
                    color: ColorConstant.gray100,
                    borderRadius: BorderRadius.circular(15)
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contact us",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(height: 30,),
                    customContactUsTextField(
                      controller: contactNameController,
                      hintText: "Your Name",
                      keyboardType: TextInputType.name,
                      height: 50.0
                    ),
                    customContactUsTextField(
                      controller: contactEmailController,
                      hintText: "Email Address",
                      keyboardType: TextInputType.emailAddress,
                      height: 50.0

                    ),
                    customContactUsTextField(
                      controller: contactMessageController,
                      hintText: "Message",
                      keyboardType: TextInputType.multiline,
                    ),
                    ElevatedButton(

                      onPressed: () {},
                      child: Center(child: Text("Send Message"),)
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: screenWidth / 10,),
          ],
        ),
      ),
    );
  }


  customCompanyInfoRow({String? title, String? value}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title ?? "",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16
            ),
          ),
          Text(value ?? "not available")
        ],
      ),
    );
  }
}
