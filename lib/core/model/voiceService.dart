import 'dart:convert';

import 'package:http/http.dart' as http;
import 'List_TeacherData.dart' as filter;

//import 'List_ClassData.dart' as filter;

class VoiceService {
  static final VoiceService instance = VoiceService.internal();
  VoiceService.internal();
  factory VoiceService() => instance;
  Future<List<filter.Voice>> fetchVoice() async {
    final response =
    await http.get('https://giasu.htcon.vn/api/v1/voices');
    print(response.toString());
    if(response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      if(mapResponse["code"] == 1) {
        final voice = mapResponse["data"].cast<Map<String, dynamic>>();
        final listOfVoices = await voice.map<filter.Voice>((json) {
          return filter.Voice.fromJson(json);
        }).toList();
        return listOfVoices;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load ');
    }
  }
}


