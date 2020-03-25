import 'package:flutter/cupertino.dart';
import 'package:test_giasu/core/service/authentication_service.dart';

class ProfileModel extends ChangeNotifier {

  final AuthenticationService autheticationService;

  ProfileModel({this.autheticationService});


//  Future<CurrentUser> _userdata;
//  Future<CurrentUser> get userdata => _userdata;
//  void setUserdata(){
//    _userdata = fetchUserData();
//    notifyListeners();
//
//  }


//  Future<CurrentUser> fetchUserData() async {
//    final response =
//    await http.get('https://giasu.htcon.vn/api/v1/users/${authenticationService.id}',
//        headers: {
//          'Content-Type': 'application/json',
//          'Accept': 'application/json',
//          'Authorization': 'Bearer ${authenticationService.token}',
//        }
//    );
//    Map<String, dynamic> mapResponse = json.decode(response.body);
////    print(mapResponse.toString());
//    print(mapResponse["data"]["available_coin"]);
//    if (response.statusCode == 200) {
////    Map<String, dynamic> mapResponse = json.decode(response.body);
//      if (mapResponse["code"] == 1) {
//        return CurrentUser.fromJson(mapResponse);
//      }
//    } else {
//      // If that call was not successful, throw an error.
//      throw Exception('Failed to load ');
//    }
//  }
////  void initState(){
////    _userdata = fetchUserData();
////  }
//
//

}