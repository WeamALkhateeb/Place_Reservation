class PlacesModel {
  int? id;
  String? name;
  AddressId? addressId;
  String? ownerId;
  int? maximumCapacity;
  int? pricePerHour;
  int? space;
  double? rate;
  String? license;
  String? categoryId;
  String? createdAt;
  List<Images>? images;
  List<AvailableTimes>? availableTimes;
  List<Types>? types;
  List<Extensions>? extensions;

  PlacesModel({
    this.id,
    this.name,
    this.addressId,
    this.ownerId,
    this.maximumCapacity,
    this.pricePerHour,
    this.space,
    this.rate,
    this.license,
    this.categoryId,
    this.createdAt,
    this.images,
    this.availableTimes,
    this.types,
    this.extensions,
  });

  PlacesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] is String ? json['name'] : null;
    addressId = json['address_id'] != null ? AddressId.fromJson(json['address_id']) : null;
    ownerId = json['owner_id'] is String ? json['owner_id'] : null;
    maximumCapacity = json['maximum_capacity'];
    pricePerHour = json['price_per_hour'];
    space = json['space'];
    rate = json['rate'] != null ? json['rate'].toDouble() : null;
    license = json['license'] is String ? json['license'] : null;
    categoryId = json['category_id'] is String ? json['category_id'] : null;
    createdAt = json['created_at'] is String ? json['created_at'] : null;
    images = json['images'] != null && json['images'] is List
        ? json['images'].map<Images>((v) => Images.fromJson(v)).toList()
        : null;
    availableTimes = json['available_times'] != null && json['available_times'] is List
        ? json['available_times'].map<AvailableTimes>((v) => AvailableTimes.fromJson(v)).toList()
        : null;
    types = json['types'] != null && json['types'] is List
        ? json['types'].map<Types>((v) => Types.fromJson(v)).toList()
        : null;
    extensions = json['extensions'] != null && json['extensions'] is List
        ? json['extensions'].map<Extensions>((v) => Extensions.fromJson(v)).toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (addressId != null) {
      data['address_id'] = addressId!.toJson();
    }
    data['owner_id'] = ownerId;
    data['maximum_capacity'] = maximumCapacity;
    data['price_per_hour'] = pricePerHour;
    data['space'] = space;
    data['rate'] = rate;
    data['license'] = license;
    data['category_id'] = categoryId;
    data['created_at'] = createdAt;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (availableTimes != null) {
      data['available_times'] = availableTimes!.map((v) => v.toJson()).toList();
    }
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    if (extensions != null) {
      data['extensions'] = extensions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AddressId {
  int? id;
  String? government;
  String? city;
  String? area;
  String? street;

  AddressId({this.id, this.government, this.city, this.area, this.street});

  AddressId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    government = json['government'] is String ? json['government'] : null;
    city = json['city'] is String ? json['city'] : null;
    area = json['area'] is String ? json['area'] : null;
    street = json['street'] is String ? json['street'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['government'] = government;
    data['city'] = city;
    data['area'] = area;
    data['street'] = street;
    return data;
  }
}

class Images {
  int? id;
  String? image;
  int? placeId;

  Images({this.id, this.image, this.placeId});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'] is String ? json['image'] : null;
    placeId = json['place_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['place_id'] = placeId;
    return data;
  }
}

class AvailableTimes {
  String? day;
  String? fromTime;
  String? toTime;
  int? isActive;

  AvailableTimes({this.day, this.fromTime, this.toTime, this.isActive});

  AvailableTimes.fromJson(Map<String, dynamic> json) {
    day = json['day'] is String ? json['day'] : null;
    fromTime = json['from_time'] is String ? json['from_time'] : null;
    toTime = json['to_time'] is String ? json['to_time'] : null;
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['from_time'] = fromTime;
    data['to_time'] = toTime;
    data['is_active'] = isActive;
    return data;
  }
}

class Types {
  int? id;
  String? name;
  List<Place>? place;

  Types({this.id, this.name, this.place});

  Types.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] is String ? json['name'] : null;
    place = json['place'] != null && json['place'] is List
        ? json['place'].map<Place>((v) => Place.fromJson(v)).toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (place != null) {
      data['place'] = place!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Place {
  String? name;

  Place({this.name});

  Place.fromJson(Map<String, dynamic> json) {
    name = json['name'] is String ? json['name'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class Extensions {
  int? id;
  String? name;
  String? description;
  int? price;

  Extensions({this.id, this.name, this.description, this.price});

  Extensions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] is String ? json['name'] : null;
    description = json['description'] is String ? json['description'] : null;
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    return data;
  }
}
