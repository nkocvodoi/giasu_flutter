//class User {
//  int code;
//  DataUser user;
//  String token;
//  bool user_deactive;
//
//  User({
//    this.code,
//    this.user,
//    this.token,
//    this.user_deactive,
//  });
//
//  factory User.fromJson(Map<String, dynamic> json) => User(
//        code: json['code'],
//        user: DataUser.fromJson(json['user']),
//        token: json['token'],
//        user_deactive: json['user_deactive'],
//      );
//
//  Map<String, dynamic> toJson() => <String, dynamic>{
//        'code': code,
//        'user': user,
//        'token': token,
//        'user_deactive': user_deactive,
//      };
//}

//class DataUser {
//  int id;
//  String email;
//  String role;
//  String identification_number;
//  bool full_info;
//  String full_name;
//  String phone_number;
//  String avatar;
//
//  DataUser({
//    this.id,
//    this.email,
//    this.role,
//    this.identification_number,
//    this.full_info,
//    this.full_name,
//    this.phone_number,
//    this.avatar,
//
//
//  });
//
//  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
//      id: json['id'],
//      email: json['email'],
//      role: json['role'],
//      identification_number: json['identification_number'],
//      full_info: json['full_info'],
//      full_name: json['full_name'],
//      phone_number: json['phone_number']);
//
//  Map<String, dynamic> toJson() => <String, dynamic>{
//        'id': id,
//        'email': email,
//        'role': role,
//        'identification_number': identification_number,
//        'full_info': full_info,
//        'full_name': full_name,
//        'phone_number': phone_number,
//      };
//}

import 'List_TeacherData.dart';

class DataUser {
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
//  String schedule_text;
  String birthdate;
//  List<Subject> subject;
//  String subject_text;
//  int course_count;
//  int like_count;
//  Location location;
//  Voice voice;
//  EducationLevel education_level;
//  NativeCountry native_country;
//  List<Topic> topic;
//  Education education;
//  List<FormTeaching> form_teachings;

  DataUser(
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
//        this.schedule_text,
//        this.subject,
//        this.subject_text,
//        this.course_count,
//        this.like_count,
//        this.location,
//        this.education,
//        this.education_level,
//        this.native_country,
//        this.voice,
//        this.topic,
        this.birthdate,
//        this.form_teachings
        });
  factory DataUser.fromJson(Map<String, dynamic> json) {
    return DataUser(
//      education: Education.fromJson(json['education']),
//      voice: json['voice'],
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
//      schedule_text: json['schedule_text'],
      // native_country: NativeCountry.fromJson(json['native_country']),
      birthdate: json['birthdate'],
//      topic: (json['topic'] as List)
//          ?.map((e) =>
//      e == null ? null : Topic.fromJson(e as Map<String, dynamic>))
//          ?.toList(),
//      subject: (json['subject'] as List)
//          ?.map((e) =>
//      e == null ? null : Subject.fromJson(e as Map<String, dynamic>))
//          ?.toList(),
//      form_teachings: (json['form_teachings'] as List)
//          ?.map((e) => e == null
//          ? null
//          : FormTeaching.fromJson(e as Map<String, dynamic>))
//          ?.toList(),
//      subject_text: json['subject_text'],
//      course_count: json['course_count'],
//      like_count: json['like_count'],
//      location: Location.fromJson(json['location']),
    );
  }
}
