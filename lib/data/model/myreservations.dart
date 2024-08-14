class MyReservationsModel {
  int? id;
  Place? place;
  List<Extension>? extension;
  User? user;
  Type? type;
  int? totalPrice;
  String? dateAndTime;
  String? day;
  String? startTime;
  String? endTime;

  MyReservationsModel(
      {this.id,
        this.place,
        this.extension,
        this.user,
        this.type,
        this.totalPrice,
        this.dateAndTime,
        this.day,
        this.startTime,
        this.endTime});

  MyReservationsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    place = json['place'] != null ? new Place.fromJson(json['place']) : null;
    if (json['extension'] != null) {
      extension = <Extension>[];
      json['extension'].forEach((v) {
        extension!.add(new Extension.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
    totalPrice = json['total_price'];
    dateAndTime = json['date_and_time'];
    day = json['day'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.place != null) {
      data['place'] = this.place!.toJson();
    }
    if (this.extension != null) {
      data['extension'] = this.extension!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    data['total_price'] = this.totalPrice;
    data['date_and_time'] = this.dateAndTime;
    data['day'] = this.day;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    return data;
  }
}

class Place {
  int? id;
  String? name;
  int? ownerId;
  int? maximumCapacity;
  int? pricePerHour;
  int? space;
  String? license;
  int? categoryId;
  int? status;
  String? dayHour;
  String? createdAt;
  String? updatedAt;

  Place(
      {this.id,
        this.name,
        this.ownerId,
        this.maximumCapacity,
        this.pricePerHour,
        this.space,
        this.license,
        this.categoryId,
        this.status,
        this.dayHour,
        this.createdAt,
        this.updatedAt});

  Place.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ownerId = json['owner_id'];
    maximumCapacity = json['maximum_capacity'];
    pricePerHour = json['price_per_hour'];
    space = json['space'];
    license = json['license'];
    categoryId = json['category_id'];
    status = json['status'];
    dayHour = json['day_hour'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['owner_id'] = this.ownerId;
    data['maximum_capacity'] = this.maximumCapacity;
    data['price_per_hour'] = this.pricePerHour;
    data['space'] = this.space;
    data['license'] = this.license;
    data['category_id'] = this.categoryId;
    data['status'] = this.status;
    data['day_hour'] = this.dayHour;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Extension {
  int? id;
  String? name;
  String? description;
  int? price;

  Extension({this.id, this.name, this.description, this.price});

  Extension.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? userName;
  String? role;
  int? balance;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.name,
        this.email,
        this.userName,
        this.role,
        this.balance,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    userName = json['user_name'];
    role = json['role'];
    balance = json['balance'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['user_name'] = this.userName;
    data['role'] = this.role;
    data['balance'] = this.balance;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Type {
  int? id;
  String? name;
  int? placeId;
  String? createdAt;
  String? updatedAt;

  Type({this.id, this.name, this.placeId, this.createdAt, this.updatedAt});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    placeId = json['place_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['place_id'] = this.placeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}