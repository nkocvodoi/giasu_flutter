import 'dart:math';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  int code;
  CurrentUser user;
  String token;
  bool user_deactive;

  User({
    this.code,
    this.user,
    this.token,
    this.user_deactive,
  });

  List<Object> get props => [code, user, token, user_deactive];

  factory User.fromJson(Map<String, dynamic> json) => User(
        code: json['code'],
        user: CurrentUser.fromJson(json['user']),
        token: json['token'],
        user_deactive: json['user_deactive'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code,
        'user': user,
        'token': token,
        'user_deactive': user_deactive,
      };
}

class CurrentUser extends Equatable {
  int id;
  String email;
  String role;
  String identification_number;
  String avatar;
  bool full_info;
  String full_name;
  String phone_number;
  int available_coin;
  int promotion_coin;
  int debt;
  int booking;
  String approval;
  String active;
//  String notification;

  CurrentUser({
    this.id,
    this.email,
    this.role,
    this.identification_number,
    this.full_info,
    this.full_name,
    this.phone_number,
    this.available_coin,
    this.promotion_coin,
    this.debt,
    this.booking,
    this.approval,
    this.active,
//    this.notification,
    this.avatar,
  });

//  List<Object> get props => [
//        id,
////        avatar,
//        email,
//        role,
//        identification_number,
//        full_info,
//        full_name,
//        phone_number,
//        available_coin,
//        promotion_coin,
//        debt,
//        booking,
//        approval,
//        active,
////        notification
//      ];

  factory CurrentUser.fromJson(Map<String, dynamic> json) => CurrentUser(
        id: json['id'],
        email: json['email'],
        avatar: json['avatar'],
        role: json['role'],
        identification_number: json['identification_number'],
        full_info: json['full_info'],
        full_name: json['full_name'],
        phone_number: json['phone_number'],
        available_coin: json['available_coin'],
        promotion_coin: json['promotion_coin'],
        debt: json['debt'],
        booking: json['booking'],
        approval: json['approval'],
        active: json['active'],
//        notification: json['notification'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'email': email,
        'avatar': avatar,
        'role': role,
        'identification_number': identification_number,
        'full_info': full_info,
        'full_name': full_name,
        'phone_number': phone_number,
        'available_coin': available_coin,
        'promotion_coin': promotion_coin,
        'debt': debt,
        'booking': booking,
        'approval': approval,
        'active': active,
//        'notification': notification,
      };
}
