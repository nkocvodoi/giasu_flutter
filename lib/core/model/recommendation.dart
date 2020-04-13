class RecommendationData {
  int id;
  int course_id;
  String status;

  RecommendationData({this.id, this.course_id, this.status});

  factory RecommendationData.fromJson(Map<String, dynamic> json) =>
      RecommendationData(
        id: json['id'],
        course_id: json['course_id'],
        status: json['status'],
      );
}
