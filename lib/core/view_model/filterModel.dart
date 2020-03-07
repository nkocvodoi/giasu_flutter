import 'package:flutter/cupertino.dart';
import 'package:test_giasu/core/model/List_TeacherData.dart' as filter;
import 'package:test_giasu/core/model/locationservice.dart';
import 'package:test_giasu/core/model/subjectservice.dart';

class FilterModel extends ChangeNotifier {
  FilterModel() {
    init();
  }

  bool _busy = false;
  bool get busy => _busy;
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  int _topic;
  int get topic => _topic;
  void setTopic(int value) {
    _topic = value;
    notifyListeners();
  }

  int _form_teaching;
  int get form_teaching => _form_teaching;
  void setForm_teaching(int value) {
    _form_teaching = value;
    notifyListeners();
  }
int _education;
  int get education => _education;
  void setEducation(int value) {
    _education = value;
    notifyListeners();
  }
  List<filter.Location> _city = [];
  List<filter.Location> get city => _city;
  void setTypes(List<filter.Location> city) {
    _city = city;
  }

  int _idCity;
  int get idCity => _idCity;
  void setIdCity(int value) {
    _idCity = value;
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

  void init() async {
    setBusy(true);
    _city= await LocationService.instance.fetchLocation();
    _subject = await SubjectService.instance.fetchSubject();
    setBusy(false);
  }

}