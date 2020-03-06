import 'package:flutter/cupertino.dart';
import 'package:test_giasu/core/model/List_TeacherData.dart' as filter;
import 'package:test_giasu/core/model/location.dart';

class FilterModel extends ChangeNotifier {
  FilterPageModel() {
//    init();
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

  String _idCity;
  String get idCity => _idCity;
  void setIdCity(String value) {
    _idCity = value;
    notifyListeners();
  }

  void init() async {
    setBusy(true);
//     _city= await LocationService.;
    setBusy(false);
  }


}