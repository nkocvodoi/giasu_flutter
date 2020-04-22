import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/service/authentication_service.dart';
import 'package:test_giasu/core/view_model/bitsmanagerModel.dart';
import 'package:test_giasu/core/view_model/classDetailModel.dart';
import 'package:test_giasu/core/view_model/classManagerModel.dart';
import 'package:test_giasu/core/view_model/filterModel.dart';
import 'package:test_giasu/core/view_model/paymentModel.dart';
import 'package:test_giasu/core/view_model/forgotPassModel.dart';
import 'package:test_giasu/core/view_model/personalInforModel.dart';
import 'package:test_giasu/core/view_model/profileModel.dart';
import 'package:test_giasu/core/view_model/signinModel.dart';
import 'package:test_giasu/core/view_model/signupModel.dart';
import 'package:test_giasu/core/view_model/subjectchoiceModel.dart';
import 'package:test_giasu/core/view_model/support_settingModel.dart';
import 'package:test_giasu/core/view_model/anouncementModel.dart';
import 'core/view_model/bottombarModel.dart';
import 'core/view_model/classModel.dart';
import 'core/view_model/napbitsModel.dart';
import 'core/view_model/passWordModel.dart';
import 'core/view_model/selectedModel.dart';

List<SingleChildCloneableWidget> getProviders() {
  List<SingleChildCloneableWidget> independentServices = [
    ChangeNotifierProvider(
      create: (context) => PaymentModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => FilterModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => AuthenticationService(),
    ),
    ChangeNotifierProvider(
      create: (context) => ForgotPassModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => BottomBarModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => NapBitsModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => SelectedTimeModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => SubjectChoiceModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => Support_SettingModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => PersonalInforModel(),
    ),
  ];

  List<SingleChildCloneableWidget> dependentServices = [
    ChangeNotifierProxyProvider<AuthenticationService, SignInModel>(
      update: (_, authenticationService, __) =>
          SignInModel(authenticationService: authenticationService),
    ),
    ChangeNotifierProxyProvider<AuthenticationService, PersonalInforModel>(
      update: (_, authenticationService, __) =>
          PersonalInforModel(authenticationService: authenticationService),
    ),
    ChangeNotifierProxyProvider<AuthenticationService, BitsManagerModel>(
      update: (_, authentication, __) =>
          BitsManagerModel(authenticationService: authentication),
    ),
    ChangeNotifierProxyProvider<AuthenticationService, ProfileModel>(
      update: (_, authentication, __) =>
          ProfileModel(authenticationService: authentication),
    ),
    ChangeNotifierProxyProvider<AuthenticationService, NapBitsModel>(
      update: (_, authentication, __) =>
          NapBitsModel(authenticationService: authentication),
    ),
    ChangeNotifierProxyProvider<AuthenticationService, SignUpModel>(
      update: (_, authentication, __) =>
          SignUpModel(authenticationService: authentication),
    ),
    ChangeNotifierProxyProvider<AuthenticationService, ClassModel>(
      update: (_, authentication, __) =>
          ClassModel(authenticationService: authentication),
    ),
    ChangeNotifierProxyProvider<AuthenticationService, AnouncementModel>(
      update: (_, authentication, __) =>
          AnouncementModel(authenticationService: authentication),
    ),
    ChangeNotifierProxyProvider<AuthenticationService, ClassManagerModel>(
      update: (_, authentication, __) =>
          ClassManagerModel(authenticationService: authentication),
    ),
    ChangeNotifierProxyProvider<AuthenticationService, ClassDetailModel>(
      update: (_, authentication, __) =>
          ClassDetailModel(authenticationService: authentication),
    ),
ChangeNotifierProxyProvider<AuthenticationService, PassWordModel>(
      update: (_, authentication, __) =>
          PassWordModel(authenticationService: authentication),
    ),

  ];

  List<SingleChildCloneableWidget> providers = [
    ...independentServices,
    ...dependentServices,
//     ...uiConsumableProviders
  ];

  return providers;
}
