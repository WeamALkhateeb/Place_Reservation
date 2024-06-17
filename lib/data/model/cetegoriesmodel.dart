class CategoriesModel {
  int? id;
  String? name;
  String? image;
  String? createdAt;

  CategoriesModel(
      {this.id,
       this.name,
       this.image,
       this.createdAt});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    return data;
  }
}