import 'package:flutter/material.dart';
import 'package:hires/core/utils/color_constant.dart';
import 'package:hires/presentation/add_experience_screen/widgets/custom_add_item_text_field.dart';

class AddEducationScreen extends StatefulWidget {
  const AddEducationScreen({Key? key}) : super(key: key);

  @override
  State<AddEducationScreen> createState() => _AddEducationScreenState();
}

class _AddEducationScreenState extends State<AddEducationScreen> {
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController rewardController = TextEditingController();
  TextEditingController informationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    fromController.dispose();
    toController.dispose();
    locationController.dispose();
    rewardController.dispose();
    informationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Education"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: screenHeight / 10,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12)
                ),
                padding: EdgeInsets.fromLTRB(20,40,20,0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      customAddItemRow(
                        mainTitle: "From: ",
                        width: 190.0,
                        errorText: "From is required",
                        keyboardType: TextInputType.name,
                        controller: fromController,
                      ),
                      customAddItemRow(
                        mainTitle: "To: ",
                        width: 190.0,
                        errorText: "To is required",
                        keyboardType: TextInputType.name,
                        controller: toController,
                      ),
                      customAddItemRow(
                        mainTitle: "Location: ",
                        width: 190.0,
                        errorText: "Location is required",
                        keyboardType: TextInputType.name,
                        controller: locationController,
                      ),
                      customAddItemRow(
                        mainTitle: "Position: ",
                        width: 190.0,
                        errorText: "Position is required",
                        keyboardType: TextInputType.name,
                        controller: rewardController,
                      ),
                      customAddItemRow(
                        mainTitle: "Information: ",
                        width: 190.0,
                        errorText: "Information is required",
                        controller: informationController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenWidth / 10,),
              Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: EdgeInsets.symmetric(vertical: 20)
                  ),
                  onPressed: () {
                    if(_formKey.currentState!.validate()) {
                      //TODO: add experience implementation
                    }
                  },
                  child: Center(child: Text("Add education"),)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
