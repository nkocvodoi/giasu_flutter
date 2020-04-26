import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:test_giasu/core/model/anouncementData.dart';
import 'package:test_giasu/core/service/authentication_service.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

class AnouncementModel extends ChangeNotifier {
  final AuthenticationService authenticationService;

  AnouncementModel({this.authenticationService});

  Future<List<AnouncementData>> fetchNotifications() async {
    final response = await http.get(
      APIUrl + 'api/v1/notifications',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authenticationService.token}',
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      if (mapResponse["code"] == 1) {
        final notification = mapResponse["data"].cast<Map<String, dynamic>>();
        final listOfNotification =
            await notification.map<AnouncementData>((json) {
          return AnouncementData.fromJson(json);
        }).toList();
        return listOfNotification;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load');
    }
  }


}
