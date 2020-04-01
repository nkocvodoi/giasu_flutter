import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:test_giasu/core/model/List_ClassData.dart';

class ClassModel extends ChangeNotifier {

  ClassModel() {
    initState();
  }

  bool _busy = false;
  bool get busy => _busy;
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  List<Data_class> _list_class = new List<Data_class>();
  List<Data_class> get list_class => _list_class;
  void setList_class(List<Data_class> _newpage) {
    _list_class.addAll(_newpage);
//    notifyListeners();
  }

  Future<CLassData> _page_class;
  Future<CLassData> get Page_class => _page_class;
  void setPage(int i){
    _page_class = fetchClassDataNext(i);
    notifyListeners();

  }
//  ScrollController _scrollController = new ScrollController();
//  get scroll => _scrollController;

  void initState(){
    _page_class = fetchClassDatatest();
  }


  Future<CLassData> fetchClassDatatest() async {
//  https://giasu.htcon.vn/api/v1/parents/courses?filter=%7B%7D&page=2
    final response =
    await http.get('https://giasu.htcon.vn/api/v1/parents/courses');
    Map<String, dynamic> mapResponse = json.decode(response.body);
//  print(mapResponse["total"]);
    if (response.statusCode == 200) {
//    Map<String, dynamic> mapResponse = json.decode(response.body);
//    print('load true');
      return CLassData.fromJson(mapResponse);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load ');
    }
  }
  Future<CLassData> fetchClassDataNext(int i) async {
//print(i);
    final response =
    await http.get('https://giasu.htcon.vn/api/v1/parents/courses?filter=%7B%7D&page=${i}');
    Map<String, dynamic> mapResponse = json.decode(response.body);
  print('page ${mapResponse["page"]}');
    if (response.statusCode == 200) {
//    Map<String, dynamic> mapResponse = json.decode(response.body);
      return CLassData.fromJson(mapResponse);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load ');
    }
  }
 }
