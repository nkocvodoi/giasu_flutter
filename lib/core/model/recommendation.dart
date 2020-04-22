
import 'package:test_giasu/core/model/List_TeacherData.dart';





class Recommendation {
  String status;
  int course_id;
  Data_teacher tutor;
  Location location;
  Subject subject;
  int user_id;
  Recommendation({this.status, this.course_id, this.location, this.subject, this.tutor, this.user_id});

  factory Recommendation.fromJson(Map<String, dynamic> json) => Recommendation(
    status: json['status'],
    course_id: json['course_id'],
    location: Location.fromJson(json['location']),
    subject: json['subject'],
    tutor: Data_teacher.fromJson(
        json['tutor'],
    ),
    user_id: json['user_id']
  );


}
