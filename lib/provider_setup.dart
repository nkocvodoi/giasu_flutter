import 'package:provider/provider.dart';
import 'package:test_giasu/core/view_model/filterModel.dart';
import 'package:test_giasu/core/view_model/paymentModel.dart';
import 'package:test_giasu/core/view_model/forgotPassModel.dart';
import 'package:test_giasu/core/view_model/signinModel.dart';
import 'package:test_giasu/core/view_model/subjectchoiceModel.dart';
import 'core/view_model/bottombarModel.dart';
import 'core/view_model/classModel.dart';
import 'core/view_model/napbitsModel.dart';
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
      create: (context) => SignInModel(),
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
  create: (context) => ClassModel(),
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