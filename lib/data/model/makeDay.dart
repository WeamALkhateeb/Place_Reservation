class MakeDayModel {
  int? totalPrice;
  int? placeId;
  int? typeId;
  String? dateAndTime;
  int? numOfDay;
  List<int>? extensions;

  MakeDayModel(
      {this.totalPrice,
        this.placeId,
        this.typeId,
        this.dateAndTime,
        this.numOfDay,
        this.extensions});

  MakeDayModel.fromJson(Map<String, dynamic> json) {
    totalPrice = json['total_price'];
    placeId = json['place_id'];
    typeId = json['type_id'];
    dateAndTime = json['date_and_time'];
    numOfDay = json['numOfDay'];
    extensions = json['extensions'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_price'] = this.totalPrice;
    data['place_id'] = this.placeId;
    data['type_id'] = this.typeId;
    data['date_and_time'] = this.dateAndTime;
    data['numOfDay'] = this.numOfDay;
    data['extensions'] = this.extensions;
    return data;
  }
}