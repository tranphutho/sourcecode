import 'package:flutter/material.dart';
import 'package:hires/core/utils/color_constant.dart';
import 'package:hires/presentation/add_experience_screen/widgets/custom_add_item_text_field.dart';

class AddExperienceScreen extends StatefulWidget {
  const AddExperienceScreen({Key? key}) : super(key: key);

  @override
  State<AddExperienceScreen> createState() => _AddExperienceScreenState();
}

class _AddExperienceScreenState extends State<AddExperienceScreen> {
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController informationController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    fromController.dispose();
    toController.dispose();
    locationController.dispose();
    positionController.dispose();
    informationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Experience"),
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
                        errorText: "From is required",
                        mainTitle: "From: ",
                        width: 190.0,
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
                        controller: positionController,
                      ),
                      customAddItemRow(
                        errorText: "Information is required",
                        mainTitle: "Information: ",
                        width: 190.0,
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
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    if(_formKey.currentState!.validate()) {
                      //TODO: add experience implementation
                    }
                  },
                  child: Center(child: Text("Add experience"),)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


}
