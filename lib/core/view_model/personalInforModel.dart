import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_giasu/core/model/List_TeacherData.dart';
import 'package:test_giasu/core/model/educationsservice.dart';
import 'package:test_giasu/core/model/formTeachingService.dart';
import 'package:test_giasu/core/model/locationservice.dart';
import 'package:test_giasu/core/model/provincesService.dart';
import 'package:test_giasu/core/model/subjectservice.dart';
import 'package:test_giasu/core/model/topicService.dart';
import 'package:test_giasu/core/model/voiceService.dart';
import 'package:test_giasu/core/service/authentication_service.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

class PersonalInforModel extends ChangeNotifier {
  final AuthenticationService authenticationService;

  PersonalInforModel({this.authenticationService}) {
    init();
  }
  Map personalInfor = new Map();
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

  // List<Topics> _topic = [];
  // List<Topics> get topic => _topic;
  // void setTopic(List<Topics> topic) {
  //   _topic = topic;
  // }

  // int _idTopic;
  // int get idTopic => _idTopic;
  // void serIdTopic(int value) {
  //   _idTopic = value;
  //   notifyListeners();
  // }

  // List<Topics> _topic = [];
  // List<Topics> get topic => _topic;
  // Future<void> getListTopic(int i) async {
  //   _topic = await TopicService.instance.fetchTopic(i);
  //   notifyListeners();
  // }

  // List<List<Topics>> _topics = [];
  // List<List<Topics>> get topics => _topics;

  void init() async {
    setBusy(true);
    _province = await ProvinceService.instance.fetchProvince();
    _city = await LocationService.instance.fetchLocation();
    _subject = await SubjectService.instance.fetchSubject();
    _education = await EducationService.instance.fetchEducation();
    _form_teaching = await FormTeachingService.instance.fetchTeaching();
    _voice = await VoiceService.instance.fetchVoice();
    // _topics[0] = await TopicService.instance.fetchTopic(1);
    // _topics[1] = await TopicService.instance.fetchTopic(2);
    
    
    setBusy(false);
  }

  int _group = 0;
  int get group => _group;
  void setGroup(int val) {
    if (val != _group) {
      _group = val;
      notifyListeners();
    }
  }

  String _infor;
  String get Infor => _infor;

//  bool _validate = false;
//  bool get Validate => _validate;
//  void setValidate() {
//    _validate = true;
//  }
  String _role = 'parentt';
  String get role => _role;
  void setRole() {
    if (_group == 0)
      _role = 'parentt';
    else
      _role = 'tutor';
    notifyListeners();
  }

  Future<bool> personalInforCheckup(Map _map) async {
    var data = {"user": _map};
    
//    https://giasu.htcon.vn/api/users/registrations
    // try {APIUrl + '

      var res = await http.put(APIUrl + 'api/v1/tutors/2',
          
          body: json.encode(data),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1ODU4NzgxOTEsImlzcyI6InNhb2todWVlIiwiYXVkIjoiY2xpZW50In0.KgzU0-T8r9JSFoEzsakwBBj_nRPiuOumE-lVgRoQIsU',
          });
          // print('log' + res.body.toString());
          // print(res.toString());
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
    // } catch (e) {
    //   print(e.toString());
    // }
    notifyListeners();
  }
}
