import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


// ignore: missing_return
Future<TeacherData> fetchTeacherData() async {
  final response =
  await http.get('https://giasu.htcon.vn/api/v1/parents/tutors');
  Map<String, dynamic> mapResponse = json.decode(response.body);
  print(mapResponse["total"]);
  if (response.statusCode == 200) {
//    Map<String, dynamic> mapResponse = json.decode(response.body);
    return TeacherData.fromJson(mapResponse);
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load ');
  }
}

class TeacherData {
  int code;
  List<Data_teacher> data;
  String status;
  String page;
  int per_page;
  int total;

  TeacherData({
    this.code,
    this.data,
    this.status,
    this.page,
    this.per_page,
    this.total,
  });

  factory TeacherData.fromJson(Map<String, dynamic> json) => TeacherData(
    code: json['code'],
    data: (json['data'] as List)
        ?.map((e) =>
    e == null ? null : Data_teacher.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: json['status'],
    page: json['page'],
    per_page: json['per_page'],
    total: json['total'],
  );
//  Map<String, dynamic> toMap() => <String, dynamic>{
//    'code': code,
//    'data': data,
//    'status': status,
//    'page': page,
//    'per_page': per_page,
//    'total': total,
//  };
}

class Data_teacher {
  int voice_id;
  int id;
  String role;
  String reset_password_token;
  String experience;
  String avatar;
  String activity_1;
  String full_name;
  String address;
  String achievement;
  String video;
  String facebook;
  String email;
  String phone_number;
  int location_id;
  int tuition_fee;
  int number_class;
  String gender;
  int available_coin;
  int promotion_coin;
  int booking;
  String approval;
  String active;
  String university;
  int school_year;
  String specialism;
  int education_level_id;
  String company;
  int native_country_id;
  String schedule_text;
  String birthdate;
  List<Subject> subject;
  String subject_text;
  int course_count;
  int like_count;
  Location location;
  Voice voice;
  EducationLevel education_level;
  NativeCountry native_country;
  List<Topic> topic;
  Education education;
  List<FormTeaching> form_teachings;

  Data_teacher(
      {this.id,
        this.role,
        this.reset_password_token,
        this.experience,
        this.avatar,
        this.activity_1,
        this.full_name,
        this.address,
        this.achievement,
        this.video,
        this.tuition_fee,
        this.number_class,
        this.gender,
        this.available_coin,
        this.promotion_coin,
        this.booking,
        this.approval,
        this.active,
        this.university,
        this.school_year,
        this.specialism,
        this.education_level_id,
        this.company,
        this.native_country_id,
        this.schedule_text,
        this.subject,
        this.subject_text,
        this.course_count,
        this.like_count,
        this.location,
        this.education,
        this.education_level,
        this.native_country,
        this.voice,
        this.topic,
        this.birthdate,
        this.form_teachings,
        this.voice_id,
      });

  factory Data_teacher.fromJson(Map<String, dynamic> json) => Data_teacher(
    education: Education.fromJson(
        json['education']
    ),
    voice: json['voice'],
    id: json['id'],
    role: json['role'],
    reset_password_token: json['reset_password_token'],
    experience: json['experience'],
    avatar: json['avatar'],
    activity_1: json['activity_1'],
    full_name: json['full_name'],
    address: json['address'],
    achievement: json['achievement'],
    video: json['video'],
    tuition_fee: json['tuition_fee'],
    number_class: json['number_class'],
    gender: json['gender'],
    available_coin: json['available_coin'],
    promotion_coin: json['promotion_coin'],
    booking: json['booking'],
    approval: json['approval'],
    active: json['active'],
    university: json['university'],
    school_year: json['school_year'],
    specialism: json['specialism'],
    education_level_id: json['education_level_id'],
    company: json['company'],
    native_country_id: json['native_country_id'],
    schedule_text: json['schedule_text'],
    voice_id: json['voice_id'],
    // native_country: NativeCountry.fromJson(json['native_country']),
    birthdate: json['birthdate'],
    topic: (json['topic'] as List)
        ?.map((e) =>
    e == null ? null : Topic.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    subject: (json['subject'] as List)
        ?.map((e) =>
    e == null ? null : Subject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    form_teachings: (json['form_teachings'] as List)
        ?.map((e) => e == null
        ? null
        : FormTeaching.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    subject_text: json['subject_text'],
    course_count: json['course_count'],
    like_count: json['like_count'],
//    location: Location.fromJson(json['location']),

  );

//  Map<String, dynamic> toJson() => <String, dynamic> {
//    'id' : id,
//    'name' : name,
//    'address' : address,
//  };
}

class Education {
  int id;
  String name;
  Education({this.id, this.name});
  factory Education.fromJson(Map<String, dynamic> json) => Education(
    name: json['name'],
    id: json['id'],
  );
  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
  };
}

class NativeCountry {
  int id;
  String name;
  NativeCountry({this.id, this.name});
  factory NativeCountry.fromJson(Map<String, dynamic> json) => NativeCountry(

      name: json['name'],
      id: json['id'],
    );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
  };
}

class FormTeaching {
  int id;
  String name;
  FormTeaching({this.id, this.name});
  factory FormTeaching.fromJson(Map<String, dynamic> json) => FormTeaching(
    name: json['name'],
    id: json['id'],
  );
  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
  };
}

class EducationLevel {
  int id;
  String name;
  EducationLevel({this.id, this.name});
  factory EducationLevel.fromJson(Map<String, dynamic> json) => EducationLevel(
    name: json['name'],
    id: json['id'],
  );
  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
  };
}

class Voice {
  int id;
  String name;
  Voice({this.id, this.name});
  factory Voice.fromJson(Map<String, dynamic> json) => Voice(
    name: json['name'],
    id: json['id'],
  );
  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
  };
}

class Topic {
  int id;
  String name;
  int subject_id;
  Topic({this.id, this.name, this.subject_id});
  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
    id: json['id'],
    name: json['name'],
    subject_id: json['subject_id'],
  );
  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
    'subject_id': subject_id,
  };
}

class Subject {
  int id;
  String name;
  String group;
  Subject(
      {this.id, this.name, this.group
        });

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    id: json['id'],
    name: json['name'],
    group: json['group'],
      );
  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
    'group': group,
  };
}
class Location {
int id ;
String name;
String group;

Location({this.id, this.name, this.group});

factory Location.fromJson(Map<String, dynamic> json) => Location(
id: json['id'] ,
name: json['name'],
group: json['group'],
);
Map<String, dynamic> toJson() => <String, dynamic>{
  'id': id ,
  'name': name,
  'group': group,
};
}
