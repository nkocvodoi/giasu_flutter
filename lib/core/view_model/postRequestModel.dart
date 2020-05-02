import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:test_giasu/core/model/educationsservice.dart';
import 'package:test_giasu/core/model/formTeachingService.dart';
import 'package:test_giasu/core/model/locationservice.dart';
import 'package:test_giasu/core/model/provincesService.dart';
import 'package:test_giasu/core/model/subjectservice.dart';
import 'package:test_giasu/core/model/topicService.dart';
import 'package:test_giasu/core/model/user.dart';
import 'package:test_giasu/core/model/voiceService.dart';
import 'package:test_giasu/core/service/authentication_service.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

class PostRequestModel extends ChangeNotifier {
  final AuthenticationService authenticationService;

  PostRequestModel({this.authenticationService}) {
    init();
  }

  Map postRequestInfor = new Map();
  bool _busy = false;
  bool get busy => _busy;
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  List<Teachings> _form_teaching = [];
  List<Teachings> get form_teaching => _form_teaching;
  void setForms(List<Teachings> form_teaching) {
    _form_teaching = form_teaching;
  }

  int _idFormTeaching;
  int get idFormTeaching => _idFormTeaching;
  void setIdFormTeaching(int value) {
    print(form_teaching[value].name);
    _idFormTeaching = value;
    notifyListeners();
  }

  List<Educations> _education = [];
  List<Educations> get education => _education;
  void setTypes(List<Educations> education) {
    _education = education;
  }

  int _idEducation;
  int get idEducation => _idEducation;
  void setIdEducation(int value) {
    _idEducation = value;
    notifyListeners();
  }

  List<Voice> _voice = [];
  List<Voice> get voice => _voice;
  void setVoice(List<Voice> voice) {
    _voice = voice;
  }

  int _idVoice;
  int get idVoice => _idVoice;
  void setIdVoice(int value) {
    _idVoice = value;
    notifyListeners();
  }

  List<Location> _city = [];
  List<Location> get city => _city;
  void setCity(List<Location> city) {
    _city = city;
  }

  int _idCity;
  int get idCity => _idCity;
  void setIdCity(int value) {
    _idCity = value;
    notifyListeners();
  }

  List<Province> _province = [];
  List<Province> get province => _province;
  void setProvince(List<Province> city) {
    _province = province;
  }

  int _idProvince;
  int get idProvince => _idProvince;
  void setIdProvince(int value) {
    _idProvince = value;
    notifyListeners();
  }

  List<Subjects> _subject = [];
  List<Subjects> get subject => _subject;
  void setSubject(List<Subjects> subject) {
    _subject = subject;
  }

  int _idSubject;
  int get idSubject => _idSubject;
  void setIdSubject(int value) {
    _idSubject = value;
    notifyListeners();
  }

  List<List<Topics>> _topics = [];
  List<List<Topics>> get topics => _topics;
  void setTopics(List<List<Topics>> topics) {
    _topics = topics;
  }

  // Future<List<Topics>> _topicSubject;
  //  List<Topics> get topicSubject => _topicSubject;
  // void setTopicSubject(List<Topics> topicSubject) {
  //   _topicSubject = topicSubject;
  // }
  List<Topics> _topic1 = [];
  List<Topics> _topic2 = [];
  List<Topics> _topic3 = [];
  List<Topics> _topic4 = [];
  List<Topics> _topic5 = [];
  List<Topics> _topic6 = [];
  List<Topics> _topic7 = [];
  List<Topics> _topic8 = [];
  List<Topics> _topic9 = [];
  List<Topics> _topic10 = [];
  List<Topics> _topic11 = [];
  List<Topics> _topic12 = [];
  List<Topics> _topic13 = [];
  List<Topics> _topic14 = [];
  List<Topics> _topic15 = [];
  List<Topics> _topic16 = [];
  List<Topics> _topic17 = [];
  List<Topics> _topic18 = [];
  List<Topics> _topic19 = [];
  List<Topics> _topic20 = [];
  List<Topics> _topic21 = [];

  List<Topics> _topic = [];
  List<Topics> get topic => _topic;
  void setTopic(List<Topics> topic) {
    _topic = topic;
  }

  int _idTopic;
  int get idTopic => _idTopic;
  void serIdTopic(int value) {
    _idTopic = value;
    notifyListeners();
  }

  void init() async {
    setBusy(true);
    _province = await ProvinceService.instance.fetchProvince();
    _city = await LocationService.instance.fetchLocation();
    _subject = await SubjectService.instance.fetchSubject();
    _education = await EducationService.instance.fetchEducation();
    _form_teaching = await FormTeachingService.instance.fetchTeaching();
    _voice = await VoiceService.instance.fetchVoice();
    _topic1 = await TopicService.instance.fetchTopic(1);
    _topic2 = await TopicService.instance.fetchTopic(2);
    _topic3 = await TopicService.instance.fetchTopic(3);
    _topic4 = await TopicService.instance.fetchTopic(4);
    _topic5 = await TopicService.instance.fetchTopic(5);
    _topic6 = await TopicService.instance.fetchTopic(6);
    _topic7 = await TopicService.instance.fetchTopic(7);
    _topic8 = await TopicService.instance.fetchTopic(8);
    _topic9 = await TopicService.instance.fetchTopic(9);
    _topic10 = await TopicService.instance.fetchTopic(10);
    _topic11 = await TopicService.instance.fetchTopic(11);
    _topic12 = await TopicService.instance.fetchTopic(12);
    _topic13 = await TopicService.instance.fetchTopic(13);
    _topic14 = await TopicService.instance.fetchTopic(14);
    _topic15 = await TopicService.instance.fetchTopic(15);
    _topic16 = await TopicService.instance.fetchTopic(16);
    _topic17 = await TopicService.instance.fetchTopic(17);
    _topic18 = await TopicService.instance.fetchTopic(18);
    _topic19 = await TopicService.instance.fetchTopic(19);
    _topic20 = await TopicService.instance.fetchTopic(20);
    _topic21 = await TopicService.instance.fetchTopic(21);

    // _topic = [_topic1,_topic2,_topic3,_topic4,_topic5,_topic6,_topic7,_topic8,_topic9,_topic10,_topic11,_topic12,_topic13,_topic14,_topic15,_topic16,_topic17,_topic18,_topic19,_topic20,_topic21].expand((element) => element).toList();
    _topic = _topic1 +
        _topic2 +
        _topic3 +
        _topic4 +
        _topic5 +
        _topic6 +
        _topic7 +
        _topic8 +
        _topic9 +
        _topic10 +
        _topic11 +
        _topic12 +
        _topic13 +
        _topic14 +
        _topic15 +
        _topic16 +
        _topic17 +
        _topic18 +
        _topic19 +
        _topic20 +
        _topic21;
    print(_topic);
    print(_subject);
    setBusy(false);
  }

  String _infor;
  String get Infor => _infor;

  Future<bool> postRequest(Map _map) async {
    var data = {"course": _map};
    var res = await http.post(APIUrl + 'api/v1/parents/courses',
        body: json.encode(data),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${authenticationService.token}',
        });
    if (res.statusCode == 200) //return res.body;
    {
      Map<String, dynamic> mapResponse = json.decode(res.body);
      print(mapResponse.toString());

      if (mapResponse["code"] == 1) {
        return true;
      } else {
        _infor = mapResponse["message"];
        return false;
      }
    } 
    notifyListeners();
  }
}

class Schedules {
  int day;
  int session;
  Schedules({this.day, this.session});
  factory Schedules.fromJson(Map<String, dynamic> json) =>
      Schedules(day: json['day'], session: json['session']);
  Map<String, dynamic> toJson() => <String, dynamic>{
        'day': day,
        'session': session,
      };
  Map<String, dynamic> toMap() => <String, dynamic>{
        'day': day,
        'session': session,
      };
}
