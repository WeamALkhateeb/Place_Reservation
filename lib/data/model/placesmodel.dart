import 'myfavorite.dart';

class PlacesModel {
  int? id;
  int? status;
  int? isFavourite;
  String? name;
  String? day_hour;
  Address? address;
  List<OwnerId>? ownerId;
  int? maximumCapacity;
  int? pricePerHour;
  int? space;
  String? rate;
  String? license;
  String? createdAt;
  List<Images>? images;
  List<AvailableTimes>? availableTimes;
  List<Types>? types;
  List<Extensions>? extensions;

  PlacesModel(
      {this.id,
        this.status,
        this.isFavourite,
        this.name,
        this.day_hour,
        this.address,
        this.ownerId,
        this.maximumCapacity,
        this.pricePerHour,
        this.space,
        this.rate,
        this.license,
        this.createdAt,
        this.images,
        this.availableTimes,
        this.types,
        this.extensions});

  PlacesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    isFavourite = json['is_favourite'];
    name = json['name'];
    day_hour = json['day_hour'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    if (json['owner_id'] != null) {
      ownerId = <OwnerId>[];
      json['owner_id'].forEach((v) {
        ownerId!.add(new OwnerId.fromJson(v));
      });
    }
    maximumCapacity = json['maximum_capacity'];
    pricePerHour = json['price_per_hour'];
    space = json['space'];
    rate = json['rate'];
    license = json['license'];
    createdAt = json['created_at'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    if (json['available_times'] != null) {
      availableTimes = <AvailableTimes>[];
      json['available_times'].forEach((v) {
        availableTimes!.add(new AvailableTimes.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(new Types.fromJson(v));
      });
    }
    if (json['extensions'] != null) {
      extensions = <Extensions>[];
      json['extensions'].forEach((v) {
        extensions!.add(new Extensions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['is_favourite'] = this.isFavourite;
    data['name'] = this.name;
    data['day_hour'] = this.day_hour;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    if (this.ownerId != null) {
      data['owner_id'] = this.ownerId!.map((v) => v.toJson()).toList();
    }
    data['maximum_capacity'] = this.maximumCapacity;
    data['price_per_hour'] = this.pricePerHour;
    data['space'] = this.space;
    data['rate'] = this.rate;
    data['license'] = this.license;
    data['created_at'] = this.createdAt;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.availableTimes != null) {
      data['available_times'] =
          this.availableTimes!.map((v) => v.toJson()).toList();
    }
    if (this.types != null) {
      data['types'] = this.types!.map((v) => v.toJson()).toList();
    }
    if (this.extensions != null) {
      data['extensions'] = this.extensions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
  int? id;
  String? goverment;
  String? city;
  String? area;
  String? street;

  Address({this.id, this.goverment, this.city, this.area, this.street});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goverment = json['goverment'];
    city = json['city'];
    area = json['area'];
    street = json['street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['goverment'] = this.goverment;
    data['city'] = this.city;
    data['area'] = this.area;
    data['street'] = this.street;
    return data;
  }
}

class OwnerId {
  String? name;

  OwnerId({this.name});

  OwnerId.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
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
    image = json['image'];
    placeId = json['place_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['place_id'] = this.placeId;
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
    day = json['day'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    isActive = json['is_Active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['from_time'] = this.fromTime;
    data['to_time'] = this.toTime;
    data['is_Active'] = this.isActive;
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
    name = json['name'];
    if (json['place'] != null) {
      place = <Place>[];
      json['place'].forEach((v) {
        place!.add(new Place.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.place != null) {
      data['place'] = this.place!.map((v) => v.toJson()).toList();
    }
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