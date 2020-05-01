class DataUser {
  int id;
  
  String role;
  String reset_password_token;
  String experience;
  String avatar;
  String activity_1;
  String full_name;
  String email;
  String about_me;
  String address;
  String achievement;
  String video;
  int tuition_fee;
  String phone_number;
  int number_class;
  int gender;
  int available_coin;
  int promotion_coin;
  int booking;
  int location_id;
  String approval;
  String active;
  String university;
  String facebook;
  int school_year;
  String specialism;
  int education_level_id;
  String company;
  int native_country_id;
  String schedule_text;
  String birthdate;
  List<Subject> subjects;
  String subject_text;
  int course_count;
  int like_count;
  Location location;
  int voice_id;
  Voice voice;
  EducationLevel education_level;
  NativeCountry native_country;
  List<Topic> topics;
  Education education;
  List<FormTeaching> form_teachings;

  DataUser(
      {this.id,
      this.location_id,
        this.role,
        this.about_me,
        this.phone_number,
        this.reset_password_token,
        this.experience,
       
        this.avatar,
        this.facebook,
        this.activity_1,
        this.voice_id,
        this.full_name,
        this.email,
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
        this.subjects,
        this.subject_text,
        this.course_count,
        this.like_count,
        this.location,
        this.education,
        this.education_level,
        this.native_country,
        this.voice,
        this.topics,
        this.birthdate,
        this.form_teachings
        });
  factory DataUser.fromJson(Map<String, dynamic> json) {
    return DataUser(
//      education: Education.fromJson(json['education']),
//      voice: Voice.fromJson(json['voice']),
      id: json['id'],
      role: json['role'],
      reset_password_token: json['reset_password_token'],
      experience: json['experience'],
      avatar: json['avatar'],
      activity_1: json['activity_1'],
      full_name: json['full_name'],
      address: json['address'],
      facebook: json['facebook'],
      email: json['email'],
      achievement: json['achievement'],
      video: json['video'],
      about_me: json['about_me'],
      tuition_fee: json['tuition_fee'],
      number_class: json['number_class'],
      gender: json['gender'],
      available_coin: json['available_coin'],
      promotion_coin: json['promotion_coin'],
      booking: json['booking'],
      approval: json['approval'],
      voice_id: json['voice_id'],
      active: json['active'],
      university: json['university'],
      school_year: json['school_year'],
      specialism: json['specialism'],
      education_level_id: json['education_level_id'],
      company: json['company'],
      location_id: json['location_id'],
      phone_number: json['phone_number'],
      native_country_id: json['native_country_id'],
   
      schedule_text: json['schedule_text'],
//       native_country: NativeCountry.fromJson(json['native_country']),
      birthdate: json['birthdate'],
      topics: (json['topics'] as List)
          ?.map((e) =>
      e == null ? null : Topic.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      subjects: (json['subjects'] as List)
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
//      location: Location.fromJson(json['location']),
    );
  }
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
