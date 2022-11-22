import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hires/core/utils/common_utils.dart';
import 'package:hires/models/applicants_model.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';
import '../services/get_services.dart';

class ApplicantProvider extends ChangeNotifier {
  ApplicantsModel? applicantsModel = ApplicantsModel();

  Future getApplicants(BuildContext context) async {
    String token =
        Provider.of<UserProvider>(context, listen: false).userApp!.token!;
    var body = await GetServices.getApplicants(token);
    print(body);

    if (body != null) {
      var data = body["data"]['rows'];
      applicantsModel = ApplicantsModel.fromJson(data);
      notifyListeners();
      return applicantsModel;
    }
  }

  Future changeApplicantStatus(BuildContext context, Applicant applicant,
      {String? status}) async {
    String token =
        Provider.of<UserProvider>(context, listen: false).userApp!.token!;
    var data = {
      "status": status.toString(),
      "job_id": applicant.jobId.toString(),
      "candidate_id": applicant.candidateId.toString()
    };
    loadingDialog(context);
    var body = await GetServices.changeApplicantStatus(token, data);
    Navigator.pop(context);
    getApplicants(context);
    print(body);

    if (body != null) {
      print(body);
      getToastMessage(body['message'], Colors.grey);
      notifyListeners();
    }
  }
}
