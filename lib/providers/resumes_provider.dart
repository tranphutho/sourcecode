import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hires/models/user_model.dart';
import 'package:hires/models/wishlist_model.dart';
import 'package:hires/services/get_services.dart';
import 'package:provider/provider.dart';

import '../core/utils/common_utils.dart';

class ResumeProvider extends ChangeNotifier {
  WishlistModel? wishListedItems;
  WishlistModel? searchedWishlistedItems=WishlistModel();

  Future getShortlistedResumes(BuildContext context) async {
    String token =
        Provider.of<UserProvider>(context, listen: false).userApp!.token!;
    var body = await GetServices.getShortlistedResumes(token);
    print("Shortlisted resumes");
    print(body);

    if (body != null) {
      var data = body["data"];
      wishListedItems = WishlistModel.fromJson(data);
      notifyListeners();
      return wishListedItems;
    }
  }

  Future removeResume(BuildContext context, Wishlist wishlist) async {
    String token =
        Provider.of<UserProvider>(context, listen: false).userApp!.token!;

    var data = {
      "object_id": wishlist.objectId.toString(),
      "object_model": wishlist.objectModel.toString()
    };
    loadingDialog(context);
    var body = await GetServices.removeResume(data, token);
    //Hiding loading dialog
    Navigator.pop(context);


    print("Shortlisted resumes");
    print(data);
    print(body);
    if (body['status']) {
      getToastMessage(body['message'], Colors.green);
    } else {
      getToastMessage(body['messsage'], Colors.red);
    }
    getShortlistedResumes(context);
  }

  searchResumes(String keyword){
    searchedWishlistedItems!.data=wishListedItems!.data!.where((element) =>element.company!.name==keyword).toList();
    notifyListeners();
  }
}
