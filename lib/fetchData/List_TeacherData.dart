import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: missing_return
Future<TeacherData> fetchTeacherData() async {
  final response =
  await http.get('https://giasu.htcon.vn/api/v1/parents/tutors?page=1&search_tutor=%7B%22location_id%22:1%7D');
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
  List<Subject> subject;
  String subject_text;
  int course_count;
  int like_count;

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

      });

  factory Data_teacher.fromJson(Map<String, dynamic> json) => Data_teacher(
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
    subject: (json['subject'] as List)
        ?.map((e) =>
    e == null ? null : Subject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    subject_text: json['subject_text'],
    course_count: json['course_count'],
    like_count: json['like_count'],

  );

//  Map<String, dynamic> toJson() => <String, dynamic> {
//    'id' : id,
//    'name' : name,
//    'address' : address,
//  };
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
