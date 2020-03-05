import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'List_TeacherData.dart';

// ignore: missing_return
Future<TeacherDetail> fetchTeacherDetail(Data_teacher teacher) async {
  print(teacher.id.toString());
  final response = await http
      .get('https://giasu.htcon.vn/api/v1/parents/tutors/${teacher.id}');
  
  Map<String, dynamic> mapResponse = json.decode(response.body);
 print(mapResponse["data"]["native_country"]);print('svgcsgcsg');

  if (response.statusCode == 200) {
//    Map<String, dynamic> mapResponse = json.decode(response.body);
    return TeacherDetail.fromJson(mapResponse);
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load ');
  }
}

class TeacherDetail {
  int code;
  Detail_teacher data;

  TeacherDetail({this.code, this.data});

  factory TeacherDetail.fromJson(Map<String, dynamic> json) => TeacherDetail(
        code: json['code'],
        data: json['data'],
      );
}

class Detail_teacher {
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
  Detail_teacher(
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
      this.form_teachings});
  factory Detail_teacher.fromJson(Map<String, dynamic> json) {
    print(json['native_country'].toString());
    print(json['voice'].toString());
    return Detail_teacher(
      education: Education.fromJson(json['education']),
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
      location: Location.fromJson(json['location']),
    );
  }
}
