import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<PersonalInfor> createPersonalInfor(

  String full_name,
  String gender,
  String native_country,
  String birthdate,
  String voice,
  String facebook,
  String phone_number,
  String email,
  String teaching_address,
  String address,
) async {
  final http.Response response = await http.post(
    'https://giasu.htcon.vn/api/v1/users/2708',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'full_name': full_name,
      'gender': gender,
      'naticve_country': native_country,
      'birthdate': birthdate,
      'voice': voice,
      'facebook': facebook,
      'phone_number': phone_number,
      'email': email,
      'teaching_address': teaching_address,
      'address': address,
    }),
  );
  if (response.statusCode == 201) {
    return PersonalInfor.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

class PersonalInfor {
  int id;
  String full_name;
  String gender;
  String native_country;
  String birthdate;
  String voice;
  String facebook;
  String phone_number;
  String email;
  String teaching_address;
  String address;
  PersonalInfor({this.id,this.full_name,this.gender,this.native_country,this.birthdate,this.voice,this.facebook,this.phone_number,this.email,this.teaching_address,this.address});

  factory PersonalInfor.fromJson(Map<String,dynamic> json){
    return PersonalInfor(
      address: json['address'],
      full_name: json['full_name'],
      id: json['id'],
      gender: json['gender'],
      voice: json['voice'],
      native_country: json['native_country'],
      facebook: json['facebook'],
      phone_number: json['phone_number'],
      email: json['email'],
      teaching_address: json['teaching_address'],
      birthdate: json['birthdate'],
      );
  }
}
