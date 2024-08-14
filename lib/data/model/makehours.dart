class MakeHoursModels {
  int totalPrice;
  int placeId;
  int typeId;
  String dateAndTime;
  String startTime;
  String endTime;
  List<dynamic> extensions;

  MakeHoursModels({
    required this.totalPrice,
    required this.placeId,
    required this.typeId,
    required this.dateAndTime,
    required this.startTime,
    required this.endTime,
    required this.extensions,
  });

  factory MakeHoursModels.fromJson(Map<String, dynamic> json) {
    return MakeHoursModels(
      totalPrice: (json['total_price'] as num).toInt(),
      placeId: (json['place_id'] as num).toInt(),
      typeId: (json['type_id'] as num).toInt(),
      dateAndTime: json['date_and_time'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      extensions: json['extensions'],
    );
  }
}


