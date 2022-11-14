import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hires/models/find_jobs.dart';
import 'package:hires/models/user_model.dart';
import 'package:hires/models/wishlist_model.dart';
import 'package:hires/presentation/add_new_job_screen/add_new_job_screen.dart';
import 'package:hires/presentation/application_tracking_screen/application_tracking_screen.dart';
import 'package:hires/presentation/applications_screen/applications_screen.dart';
import 'package:hires/presentation/apply_screen/apply_screen.dart';
import 'package:hires/presentation/apply_success_2_screen/apply_success_2_screen.dart';
import 'package:hires/presentation/categories_screen/categories_screen.dart';
import 'package:hires/presentation/categories_screen/popular.dart';
import 'package:hires/presentation/categories_screen/trending.dart';
import 'package:hires/presentation/companies_screen/companies_screen.dart';
import 'package:hires/presentation/company_profile/company_profile.dart';
import 'package:hires/presentation/following_employer_screen/following_employer_screen.dart';
import 'package:hires/presentation/forgot_password_page/forgot_password_page.dart';
import 'package:hires/presentation/home_screen/home_screen.dart';
import 'package:hires/presentation/homepage_3_screen/homepage_3_screen.dart';
import 'package:hires/presentation/homepage_3_screen/popular_jobs.dart';
import 'package:hires/presentation/homepage_3_screen/profile.dart';
import 'package:hires/presentation/homepage_3_screen/widgets/featured_jobs.dart';
import 'package:hires/presentation/job_details1_screen/job_details1_screen.dart';
import 'package:hires/presentation/job_details_screen/job_details_screen.dart';
import 'package:hires/presentation/job_preferences_2_screen/job_preferences_2_screen.dart';
import 'package:hires/presentation/log_in1_screen/log_in1_screen.dart';
import 'package:hires/presentation/log_in2_screen/log_in2_screen.dart';
import 'package:hires/presentation/log_in_screen/log_in_screen.dart';
import 'package:hires/presentation/managa_job_screen/manage_job_screen.dart';
import 'package:hires/presentation/managa_job_screen/manage_jobs_screen.dart';
import 'package:hires/presentation/manage_applicants_screen/manage_applicants_screen.dart';
import 'package:hires/presentation/messages_screen/messages_screen.dart';
import 'package:hires/presentation/my_contact_screen/my_contact_screen.dart';
import 'package:hires/presentation/my_profile/candidate_profile.dart';
import 'package:hires/presentation/my_profile/my_profile.dart';
import 'package:hires/presentation/notifications_screen/notifications_screen.dart';
import 'package:hires/presentation/profile_drop_draweritem/profile_drop_draweritem.dart';
import 'package:hires/presentation/profile_style_2_screen/profile_style_2_screen.dart';
import 'package:hires/presentation/register_screen/register_screen.dart';
import 'package:hires/presentation/reset_password1_screen/reset_password1_screen.dart';
import 'package:hires/presentation/reset_password_confirmation_screen/reset_password_confirmation_screen.dart';
import 'package:hires/presentation/resume_portfolio_upload_screen/resume_portfolio_upload_screen.dart';
import 'package:hires/presentation/resume_portfolio_uploading_screen/resume_portfolio_uploading_screen.dart';
import 'package:hires/presentation/search_option_3_screen/search_option_3_screen.dart';
import 'package:hires/presentation/searchfilterbottomsheet_page/searchfilterbottomsheet_page.dart';
import 'package:hires/presentation/set_b1_screen/set_b1_screen.dart';
import 'package:hires/presentation/set_b2_screen/set_b2_screen.dart';
import 'package:hires/presentation/set_b3_screen/set_b3_screen.dart';
import 'package:hires/presentation/set_b4_get_started_screen/set_b4_get_started_screen.dart';
import 'package:hires/presentation/set_b4_screen/set_b4_screen.dart';
import 'package:hires/presentation/set_b5_screen/set_b5_screen.dart';
import 'package:hires/presentation/set_b6_screen/set_b6_screen.dart';
import 'package:hires/presentation/settings_screen/language.dart';
import 'package:hires/presentation/settings_screen/settings_screen.dart';
import 'package:hires/presentation/shortlisted_resumes_screen/shortlisted_resumes_screen.dart';
import 'package:hires/presentation/solo_category_job_listing_screen/solo_category_job_listing_screen.dart';
import 'package:hires/presentation/start1_screen/start1_screen.dart';
import 'package:hires/presentation/verify1_screen/verify1_screen.dart';
import 'package:hires/presentation/verify_screen/verify_screen.dart';
import 'package:hires/translations/codegen_loader.g.dart';
import 'package:provider/provider.dart';

import 'core/theme/theme_constants.dart';
import 'core/theme/theme_manager.dart';
import 'models/applicant_detail_model.dart';
import 'models/job_model.dart';
import 'models/resource_model.dart';
import 'presentation/edit_profile/edit_profile_screen.dart';
import 'presentation/job_proposal_screen/job_proposal_screen.dart';
import 'presentation/job_type1_screen/job_type1_screen.dart';
import 'presentation/job_type_screen/job_type_screen.dart';
import 'presentation/profile_style_1_screen/profile_style_1_screen.dart';
import 'presentation/register1_screen/register1_screen.dart';
import 'presentation/reset_password_screen/reset_password_screen.dart';
import 'presentation/resume_portfolio_uploaded_screen/resume_portfolio_uploaded_screen.dart';
import 'presentation/search_result_2_screen/search_result_2_screen.dart';
import 'presentation/set_b4_get_started1_screen/set_b4_get_started1_screen.dart';

class myHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}

void main() async {
  GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  HttpOverrides.global = myHttpOverrides();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(EasyLocalization(
      supportedLocales: [Locale("en"), Locale("ar")],
      path: "assets/translations",
      assetLoader: CodegenLoader(),
      fallbackLocale: Locale('en'),
      child: MyApp()));
}

ThemeManager themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
// TODO: implement initState

    themeManager.addListener(themeListener);

    super.initState();
  }

  @override
  void dispose() {
// TODO: implement dispose

    themeManager.removeListener(themeListener);

    super.dispose();
  }

  void themeListener() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<ApplicantDetailModelProvider>(
            create: (_) => ApplicantDetailModelProvider()),
        ChangeNotifierProvider<JobsProvider>(create: (_) => JobsProvider()),
        ChangeNotifierProvider<JobProvider>(create: (_) => JobProvider()),
        ChangeNotifierProvider<WishlistProvider>(
            create: (_) => WishlistProvider()),
        ChangeNotifierProvider<ResourceModelProvider>(
            create: (_) => ResourceModelProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeManager.themeMode,
        title: 'White jobs',
        initialRoute: Start1Screen.id,
        routes: {
          ApplicationTrackingScreen.id: (context) =>
              ApplicationTrackingScreen(),
          Popular.id: (context) => Popular(),
          CandidateProfileScreen.id: (context) => CandidateProfileScreen(),
          SelectLanguage.id: (context) => SelectLanguage(),
          ApplicationsScreen.id: (context) => ApplicationsScreen(),
          Start1Screen.id: (context) => Start1Screen(),
          EditProfile.id: (context) => EditProfile(),
          ApplyScreen.id: (context) => ApplyScreen(),
          AddNewJobScreen.id: (context) => AddNewJobScreen(),
          ApplySuccess2Screen.id: (context) => ApplySuccess2Screen(),
          CategoriesScreen.id: (context) => CategoriesScreen(),
          CompaniesScreen.id: (context) => CompaniesScreen(),
          ForgotPasswordPage.id: (context) => ForgotPasswordPage(),
          FollowingEmployerScreen.id: (context) => FollowingEmployerScreen(),
          JobDetailsScreen.id: (context) => JobDetailsScreen(),
          JobDetails1Screen.id: (context) => JobDetails1Screen(),
          JobPreferences2Screen.id: (context) => JobPreferences2Screen(),
          JobProposalScreen.id: (context) => JobProposalScreen(),
          JobTypeScreen.id: (context) => JobTypeScreen(),
          JobType1Screen.id: (context) => JobType1Screen(),
          LogInScreen.id: (context) => LogInScreen(),
          LogIn1Screen.id: (context) => LogIn1Screen(),
          LogIn2Screen.id: (context) => LogIn2Screen(),
          MyContactScreen.id: (context) => MyContactScreen(),
          MessagesScreen.id: (context) => MessagesScreen(),
          ManageJobScreen.id: (context) => ManageJobScreen(),
          ManageJobsScreen.id: (context) => ManageJobsScreen(),
          ManageApplicantsScreen.id: (context) => ManageApplicantsScreen(),
          NotificationsScreen.id: (context) => NotificationsScreen(),
          ProfileDropDraweritem.id: (context) => ProfileDropDraweritem(),
          ProfileStyle1Screen.id: (context) => ProfileStyle1Screen(),
          ProfileStyle2Screen.id: (context) => ProfileStyle2Screen(),
          CompanyProfile.id: (context) => CompanyProfile(),
          MyProfile.id: (context) => MyProfile(),
          RegisterScreen.id: (context) => RegisterScreen(),
          Register1Screen.id: (context) => RegisterScreen(),
          ResetPasswordConfirmationScreen.id: (context) =>
              ResetPasswordConfirmationScreen(),
          ResetPasswordScreen.id: (context) => ResetPasswordScreen(),
          PopularJobes.id: (context) => PopularJobes(),
          ResetPassword1Screen.id: (context) => ResetPassword1Screen(),
          ResumePortfolioUploadScreen.id: (context) =>
              ResumePortfolioUploadScreen(),
          ResumePortfolioUploadedScreen.id: (context) =>
              ResumePortfolioUploadedScreen(),
          ResumePortfolioUploadingScreen.id: (context) =>
              ResumePortfolioUploadingScreen(),
          SearchOption3Screen.id: (context) => SearchOption3Screen(),
          ShortlistedResumesScreen.id: (context) => ShortlistedResumesScreen(),
          SetB1Screen.id: (context) => SetB1Screen(),
          SetB2Screen.id: (context) => SetB2Screen(),
          SetB3Screen.id: (context) => SetB3Screen(),
          SetB4GetStartedScreen.id: (context) => SetB4GetStartedScreen(),
          SetB4GetStarted1Screen.id: (context) => SetB4GetStarted1Screen(),
          FeaturedJobes.id: (context) => FeaturedJobes(),
          SetB4Screen.id: (context) => SetB4Screen(),
          SetB5Screen.id: (context) => SetB5Screen(),
          SetB6Screen.id: (context) => SetB6Screen(),
          SettingsScreen.id: (context) => SettingsScreen(),
          VerifyScreen.id: (context) => VerifyScreen(),
          Verify1Screen.id: (context) => Verify1Screen(),
          Homepage3Screen.id: (context) => Homepage3Screen(),
          HomeScreen.id: (context) => HomeScreen(),
          SearchResult2Screen.id: (context) => SearchResult2Screen(),
          SearchfilterbottomsheetPage.id: (context) =>
              SearchfilterbottomsheetPage(),
          SoloCategoryJobListingScreen.id: (context) =>
              SoloCategoryJobListingScreen(),
          Trending.id: (context) => Trending(),
          Profile.id: (context) => Profile(),
        },
      ),
    );
  }
}
