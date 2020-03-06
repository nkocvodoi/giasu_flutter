import 'package:provider/provider.dart';
import 'package:test_giasu/core/view_model/filterModel.dart';
import 'package:test_giasu/core/view_model/paymentModel.dart';
import 'package:test_giasu/core/view_model/forgotPassModel.dart';
import 'package:test_giasu/core/view_model/signinModel.dart';
import 'package:test_giasu/core/view_model/subjectchoiceModel.dart';
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

  List<SingleChildCloneableWidget> dependentServices = [
//     ChangeNotifierProxyProvider<SelectedTimeModel,SelectedColumnModel>(
//       builder: (_, selectedtimeModel, __) => SelectedColumnModel(selectedTimeModel: selectedtimeModel),
//     ),
//  ];
//ChangeNotifierProxyProvider<SelectedColumnModel,SelectedTimeModel>(
//       builder: (_, selectedcolumnModel, __) => SelectedTimeModel(selectedColumnModel: selectedcolumnModel),
//     ),
  ];


  List<SingleChildCloneableWidget> providers = [
    ...independentServices,
    ...dependentServices,
    // ...uiConsumableProviders
  ];

  return providers;
}