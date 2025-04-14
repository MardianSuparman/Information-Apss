class InformationResponse {
  bool? success;
  String? message;
  List<Data>? data;

  InformationResponse({this.success, this.message, this.data});

  InformationResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? content;
  int? categoryId;
  int? userId;
  String? image;
  String? approvalStatus;
  String? createdAt;
  String? updatedAt;
  String? slug;
  Category? category;

  Data(
      {this.id,
      this.title,
      this.content,
      this.categoryId,
      this.userId,
      this.image,
      this.approvalStatus,
      this.createdAt,
      this.updatedAt,
      this.slug,
      this.category});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    categoryId = json['category_id'];
    userId = json['user_id'];
    image = json['image'];
    approvalStatus = json['approval_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    slug = json['slug'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['category_id'] = categoryId;
    data['user_id'] = userId;
    data['image'] = image;
    data['approval_status'] = approvalStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['slug'] = slug;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? slug;

  Category({this.id, this.name, this.createdAt, this.updatedAt, this.slug});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['slug'] = slug;
    return data;
  }
}
