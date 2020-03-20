import 'package:flutter/cupertino.dart';
import 'package:test_giasu/core/model/List_TeacherData.dart' as filter;
import 'package:test_giasu/core/model/locationservice.dart';
import 'package:test_giasu/core/model/subjectservice.dart';
import 'package:test_giasu/core/model/educationsservice.dart';
import 'package:test_giasu/core/model/formTeachingService.dart';

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
    print(education[value].name);
    _idEducation = value;
    notifyListeners();
  }

  List<filter.Location> _city = [];
  List<filter.Location> get city => _city;
  void setCity(List<filter.Location> city) {
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
    _city = await LocationService.instance.fetchLocation();
    _subject = await SubjectService.instance.fetchSubject();
    _education = await EducationService.instance.fetchEducation();
    _form_teaching = await FormTeachingService.instance.fetchTeaching();
    setBusy(false);
  }
}
