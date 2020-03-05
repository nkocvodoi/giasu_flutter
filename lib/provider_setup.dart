import 'package:provider/provider.dart';
import 'package:test_giasu/core/view_model/filterModel.dart';
import 'package:test_giasu/core/view_model/paymentModel.dart';
import 'package:test_giasu/core/view_model/forgotPassModel.dart';
import 'package:test_giasu/core/view_model/signinModel.dart';
import 'package:test_giasu/core/view_model/subjectchoiceModel.dart';
import 'package:test_giasu/ui/Open_App/Waiting_screen.dart';
import 'package:test_giasu/ui/UI_Main/Filter.dart';

import 'core/model/api.dart';
import 'core/view_model/bottombarModel.dart';
import 'core/view_model/napbitsModel.dart';
import 'core/view_model/selectedModel.dart';
List<SingleChildCloneableWidget> getProviders() {
  List<SingleChildCloneableWidget> independentServices = [
    ChangeNotifierProvider(
      builder: (context) => PaymentModel(),
    ),
    ChangeNotifierProvider(
      builder: (context) => FilterModel(),
    ),
    ChangeNotifierProvider(
      builder: (context) => SignInModel(),
    ),
 ChangeNotifierProvider(
      builder: (context) => ForgotPassModel(),
    ),
ChangeNotifierProvider(
      builder: (context) => BottomBarModel(),
    ),
ChangeNotifierProvider(
      builder: (context) => NapBitsModel(),
    ),
ChangeNotifierProvider(
      builder: (context) => SelectedTimeModel(),
    ),
ChangeNotifierProvider(
      builder: (context) => SubjectChoiceModel(),
    ),

  ];

//  List<SingleChildCloneableWidget> dependentServices = [
//    // ChangeNotifierProxyProvider<AccountModel, FollowDao>(
//    //   builder: (_, accountModel, __) => FollowDao(accountModel: accountModel),
//    // ),
//    // ChangeNotifierProxyProvider<AccountModel, LikeDao>(
//    //   builder: (_, accountModel, __) => LikeDao(accountModel: accountModel),
//    // ),
//    // ChangeNotifierProxyProvider<AccountModel, SearchDao>(
//    //   builder: (_, accountModel, __) => SearchDao(accountModel: accountModel),
//    // ),
//    // ChangeNotifierProxyProvider<AccountModel, BasePageModel>(
//    //   builder: (_, accountModel, __) =>
//    //       BasePageModel(accountModel: accountModel),
//    // ),
//    ChangeNotifierProxyProvider<AccountModel, SettingsPageModel>(
//      builder: (_, accountModel, __) =>
//          SettingsPageModel(accountModel: accountModel),
//    ),
//    ChangeNotifierProxyProvider<FollowDao, FollowedPageModel>(
//      builder: (_, followDao, __) => FollowedPageModel(followDao: followDao),
//    ),
//  ];


  List<SingleChildCloneableWidget> providers = [
    ...independentServices,
//    ...dependentServices,
    // ...uiConsumableProviders
  ];

  return providers;
}