class Post {
  String? body;
  int? id;
  String? title;
  int? userId;

  Post({this.body, this.id, this.title, this.userId});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      body: json['body'],
      id: json['id'],
      title: json['title'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['body'] = body;
    data['id'] = id;
    data['title'] = title;
    data['userId'] = userId;
    return data;
  }
}
