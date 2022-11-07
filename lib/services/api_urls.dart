class Api_Url {
//========================================================================
  //BASE URL
//========================================================================

  // static const String BASE_URL = "http://elabdisb.com/eatcentral/api/";
  static const String BASE_URL = "https://whitejobs.co.in";
  static const String BASE_URL_IMAGE = BASE_URL + "/uploads/";

  //========================================================================
  //Api points
//========================================================================

  static const String MIDDLE_BASE = "api";

//========================================================================
  //end points
//========================================================================

  static const String LOGIN = "$BASE_URL/api/login";
  static const String REGISTER = "$BASE_URL/api/register";

  static const String APPLICANTDETAIL = "$BASE_URL/api/applicant/detail";
  static const String APPLY_JOB = "$BASE_URL/api/apply-job";
  static const String ADD_WISHLIT = "$BASE_URL/api/wishlist";
  static const String REMOVE_WISHLIT = "$BASE_URL/api/wishlist/remove";
}
