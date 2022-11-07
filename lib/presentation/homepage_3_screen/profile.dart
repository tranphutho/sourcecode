import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hires/presentation/my_profile/my_profile.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);
  static String id = "Profile";
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          MyProfile(),
        ],
      ),
    ));
  }
}
