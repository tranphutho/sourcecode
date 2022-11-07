import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/math_utils.dart';
import '../../models/user_model.dart';

class CompanyProfile extends StatefulWidget {
  static String id = "ProfileStyle2Screen";
  @override
  State<CompanyProfile> createState() => _CompanyProfileState();
}

class _CompanyProfileState extends State<CompanyProfile> {
  bool upload = true;

  bool uploading = false;

  bool uploaded = false;
  late TextEditingController txtEmail;
  late TextEditingController txtName;
  late TextEditingController txtWebSite;
  late TextEditingController txtAddress;
  late TextEditingController txtFoundIn;
  late TextEditingController txtPhone;
  late TextEditingController txtCity;
  late TextEditingController txtState;
  late TextEditingController txtCountry;
  late TextEditingController txtZipcode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    txtEmail = TextEditingController(text: '');
    txtName = TextEditingController(text: '');
    txtWebSite = TextEditingController(text: '');
    txtAddress = TextEditingController(text: '');
    txtFoundIn = TextEditingController(text: '');
    txtPhone = TextEditingController(text: '');
    txtCity = TextEditingController(text: '');
    txtState = TextEditingController(text: '');
    txtCountry = TextEditingController(text: '');
    txtZipcode = TextEditingController(text: '');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    txtEmail.dispose();
    txtName.dispose();
    txtWebSite.dispose();
    txtAddress.dispose();
    txtFoundIn.dispose();
    txtPhone.dispose();
    txtCity.dispose();
    txtState.dispose();
    txtCountry.dispose();
    txtZipcode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    UserModel usePrv = Provider.of<UserProvider>(
      context,
    ).userApp!;
    if (usePrv.company != null) {
      txtName.text = usePrv.company!.name ?? "";
      txtEmail.text = usePrv.company!.email ?? "";
      txtWebSite.text = usePrv.company!.website ?? "";
      txtPhone.text = usePrv.company!.phone ??= "";
      txtFoundIn.text = usePrv.company!.foundedIn ?? "";
      txtAddress.text = usePrv.company!.address ?? "";
      txtCity.text = usePrv.company!.city ?? "";
      txtState.text = usePrv.company!.state ?? "";
      txtCountry.text = usePrv.company!.country ?? "";
      txtZipcode.text = usePrv.company!.zipCode.toString() ?? "";
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Company Info",
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //
            //   children: [
            //     customColumn(title: "Company name",height: 45.0, width:120.0,hint: ""),
            //     customColumn(title: "Company Email",height: 45.0, width:120.0,hint: "Email"),
            //
            //   ],
            // ),
            customRow(
                title1: "Company name",
                hint1: "Netflix",
                controller1: txtName,
                title2: "Company Email",
                hint2: "Email",
                controller2: txtEmail),
            SizedBox(
              height: 20,
            ),
            customRow(
                title1: "Phone Number",
                hint1: "03319134634",
                controller1: txtPhone,
                title2: "Website",
                hint2: "Website",
                controller2: txtWebSite),
            SizedBox(
              height: 20,
            ),
            customRow(
                title1: "Est. since",
                hint1: "12/10/1200",
                controller1: txtFoundIn,
                title2: "Address",
                hint2: "Bannu",
                controller2: txtAddress),
            SizedBox(
              height: 20,
            ),
            customRow(
                title1: "City",
                hint1: "Bannu",
                controller1: txtCity,
                title2: "State",
                hint2: "Pakistan",
                controller2: txtState),
            SizedBox(
              height: 20,
            ),
            customRow(
                title1: "Country",
                hint1: "--select--",
                controller1: txtCountry,
                title2: "Zip cde",
                hint2: "1234",
                controller2: txtZipcode),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
              child: Row(
                children: [
                  Container(
                    height: 20,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Allow in search",
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
              child: Text(
                "About Company",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: getVerticalSize(
                56.00,
              ),
              width: getHorizontalSize(
                184.00,
              ),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    16.00,
                  ),
                ),
              ),
              child: Text(
                "Save Changes",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorConstant.whiteA700,
                  fontSize: getFontSize(
                    16,
                  ),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  customColumn(
      {final title,
      final hint,
      required,
      var height,
      var width,
      var controller}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                fillColor: Colors.blueGrey.withOpacity(0.5),
                hintText: hint,
                hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }

  customRow(
      {final title1,
      final title2,
      final controller1,
      final hint1,
      final hint2,
      final controller2}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        customColumn(
            title: title1,
            height: 45.0,
            width: 140.0,
            hint: hint1,
            controller: controller1),
        customColumn(
            title: title2,
            height: 45.0,
            width: 140.0,
            hint: hint2,
            controller: controller2),
      ],
    );
  }
}
