import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';


class TopicService {
  static final TopicService instance = TopicService.internal();
  TopicService.internal();
  factory TopicService() => instance;
  Future<List<Topics>> fetchTopic(int subject_id) async {
    final response =
    await http.get('https://giasu.htcon.vn/api/v1/topics?subject_id=${subject_id}');
    if(response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      
      if(mapResponse["code"] == 1) {
        final topic = mapResponse["data"]["topics"].cast<Map<String, dynamic>>();
        final listOfTopic = await topic.map<Topics>((json) {
          return Topics.fromJson(json);
        }).toList();
        
        return listOfTopic;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load ');
    }
  }
}


class Topics{
  final int id, subject_id;
  final String name;
  Topics({this.id, this.name, this.subject_id});
  factory Topics.fromJson(Map<dynamic, dynamic> json) => Topics(
    id: json['id'],
    name: json['name'] as String,
    subject_id: json['subject_id'],
    
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'subject_id': subject_id,
     
    };
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
    'subject_id': subject_id,
  };
}
