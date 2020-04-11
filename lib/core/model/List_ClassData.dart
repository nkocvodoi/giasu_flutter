import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
Future<CLassData> fetchClassData() async {
  final response =
  await http.get('https://giasu.htcon.vn/api/v1/parents/courses');
  Map<String, dynamic> mapResponse = json.decode(response.body);
  print(mapResponse["total"]);
  if (response.statusCode == 200) {
//    Map<String, dynamic> mapResponse = json.decode(response.body);
    return CLassData.fromJson(mapResponse);
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load ');
  }
}

// ignore: missing_return
class CLassData {
  int code;
  List<Data_class> data;
  String status;
  String page;
  int per_page;
  int total;

  CLassData({
    this.code,
    this.data,
    this.status,
    this.page,
    this.per_page,
    this.total,
  });

  factory CLassData.fromJson(Map<String, dynamic> json) => CLassData(
    code: json['code'],
    data: (json['data'] as List)
        ?.map((e) =>
    e == null ? null : Data_class.fromJson(e as Map<String, dynamic>))
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

class Data_class {
  int id;
  String name;
  String grade;
  int location_id;
  int subject_id;
  int parentt_id;
  String status;
  String lesson_per_week;
  int student_per_class;
  int tuition_fee;
  double time_per_lesson;
  String phone_number;
  int form_teaching_id;
  String about_course;
  String address;
  String tutor_gender;
  int debt;
  int class_fee;
  String parent_number;
  String form_teaching_name;
  Parent parent;
  int recommend_number;
  Subject subject;
  List<ScheduleCourses> schedule_courses;

  Data_class(
      {this.id,
        this.name,
        this.grade,
        this.location_id,
        this.subject_id,
        this.parentt_id,
        this.status,
        this.lesson_per_week,
        this.student_per_class,
        this.tuition_fee,
        this.time_per_lesson,
        this.phone_number,
        this.form_teaching_id,
        this.about_course,
        this.address,
        this.tutor_gender,
        this.debt,
        this.class_fee,
        this.parent_number,
        this.form_teaching_name,
        this.parent,
        this.recommend_number,
        this.subject,
        this.schedule_courses,
        });

  factory Data_class.fromJson(Map<String, dynamic> json) => Data_class(
    id: json['id'],
    name: json['name'],
    grade: json['grade'],
    location_id: json['location_id'],
    subject_id: json['subject_id'],
    parentt_id: json['parentt_id'],
    status: json['status'],
    lesson_per_week: json['lesson_per_week'],
    student_per_class: json['student_per_class'],
    tuition_fee: json['tuition_fee'],
    time_per_lesson: json['time_per_lesson'],
    phone_number: json['phone_number'],
    form_teaching_id: json['form_teaching_id'],
    about_course: json['about_course'],
    address: json['address'],
    tutor_gender: json['tutor_gender'],
    debt: json['debt'],
    class_fee: json['class_fee'],
    parent_number: json['parent_number'],
    form_teaching_name: json['form_teaching_name'],
    parent: Parent.fromJson(json['parent']),
    recommend_number: json['recommend_number'],
    subject: Subject.fromJson(json['subject']),
    schedule_courses: (json['data'] as List)
        ?.map((e) =>
    e == null ? null : ScheduleCourses.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );

//  Map<String, dynamic> toJson() => <String, dynamic> {
//    'id' : id,
//    'name' : name,
//    'address' : address,
//  };
}

class ScheduleCourses {
  Schedule schedule;
  ScheduleCourses({this.schedule});
  factory ScheduleCourses.fromJson(Map<String,dynamic>json)=> ScheduleCourses(schedule: json['schedule']);
  Map<String,dynamic> toJson() => <String,dynamic>{
    'schedule' : schedule,
  };
}

class Schedule {
  int id;
  int day;
  int session;
  Schedule({this.id,this.day,this.session});
  factory Schedule.fromJson(Map<String,dynamic>json) => Schedule(day: json['day'],session: json['session']);
  Map<String,dynamic> toJson() => <String,dynamic>{
    'id' : id,
    'day': day,
    'session': session,
  };
  Map<String,dynamic> toMap() => <String,dynamic>{
  'day' : day,
  'session': session,
  };
}

class Subject {
  String name;
  String group;
  Subject({this.name, this.group});
  factory Subject.fromJson(Map<String, dynamic> json) =>
      Subject(group: json['group'], name: json['name']);
  Map<String, dynamic> toJson() => <String, dynamic>{
    'name': name,
    'group': group,
  };
}

class Parent {
  int id;
  String role;
  String avatar;
  String full_name;
  String address;
  String about_me;
  Parent(
      {this.id,
        this.role,
        this.avatar,
        this.full_name,
        this.address,
        this.about_me});

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
      id: json['id'],
      role: json['role'],
      avatar: json['avatar'],
      full_name: json['full_name'],
      address: json['address'],
      about_me: json['about_me']);
  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'role': role,
    'avatar': avatar,
    'full_name': full_name,
    'address': address,
    'about_me': about_me,
  };
}
