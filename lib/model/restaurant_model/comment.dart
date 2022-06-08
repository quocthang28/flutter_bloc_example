class ResComment {
  int? total;
  List<CommentData>? data;

  ResComment({this.total, this.data});

  ResComment.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['data'] != null) {
      data = <CommentData>[];
      json['data'].forEach((v) {
        data!.add(new CommentData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CommentData {
  String? sId;
  String? restaurantId;
  String? content;
  String? title;
  String? avatarUrl;
  String? displayName;
  int? fakeId;
  String? createdDate;
  String? updatedDate;
  int? iV;

  CommentData(
      {this.sId,
      this.restaurantId,
      this.content,
      this.title,
      this.avatarUrl,
      this.displayName,
      this.fakeId,
      this.createdDate,
      this.updatedDate,
      this.iV});

  CommentData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    restaurantId = json['restaurant_id'];
    content = json['content'];
    title = json['title'];
    avatarUrl = json['avatar_url'];
    displayName = json['display_name'];
    fakeId = json['fake_id'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['restaurant_id'] = this.restaurantId;
    data['content'] = this.content;
    data['title'] = this.title;
    data['avatar_url'] = this.avatarUrl;
    data['display_name'] = this.displayName;
    data['fake_id'] = this.fakeId;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    data['__v'] = this.iV;
    return data;
  }
}
