class AnouncementData {
  int id;
  int course_id;
  String content;
  String url;
  String status;
  String created_at;
  AnouncementData({
    this.id,
    this.course_id,
    this.content,
    this.url,
    this.status,
    this.created_at,
});

  factory AnouncementData.fromJson(Map<String, dynamic> json) => AnouncementData(
    id: json['id'],
    course_id: json['course_id'],
    content: json['content'],
    url: json['url'],
    status: json['status'],
    created_at: json['created_at'],
  );

}