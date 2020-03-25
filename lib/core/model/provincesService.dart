import 'dart:convert';

import 'package:http/http.dart' as http;

import 'List_TeacherData.dart' as filter;

class ProvinceService {
  static final ProvinceService instance = ProvinceService.internal();
  ProvinceService.internal();
  factory ProvinceService() => instance;

  Future<List<Province>> fetchProvince() async {
    final response =
    await http.get('https://giasu.htcon.vn/api/v1/guests/provinces');

    print("ketqua" + response.toString());
    if(response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      if(mapResponse["code"] == 1) {
        final province = mapResponse["data"].cast<Map<String, dynamic>>();
        final listOfProvince = await province.map<Province>((json) {
          return Province.fromJson(json);
        }).toList();
        return listOfProvince;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load');
    }
  }
}

class Province {
 final int id;
 final String name;

 Province({
   this.id,
   this.name,
 });

 factory Province.fromJson(Map<dynamic, dynamic> json) => Province(
   id: json['id'],
   name: json['name'] as String,
 );

 Map<String, dynamic> toJson() => <String, dynamic>{
   'id': id,
   'name': name,
 };
}