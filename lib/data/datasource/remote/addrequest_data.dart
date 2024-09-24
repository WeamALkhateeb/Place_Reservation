import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../core/class/curd.dart';
import '../../../core/class/statusrequest.dart';

class AddRequestData {
  Crud crud;
  AddRequestData(this.crud);

  Future<Either<StatusRequest, Map>> addRequest(
      String name,
      String goverment,
      String city,
      String area,
      String street,
      int maximumCapacity,
      String pricePerHour,
      String space,
      String categoryId,
      String dayHour,
      List<String>  types,
      List<List<String>> extensions,
      List<List<String>> availableTimes,
      File image,
      List<File> images,
      String token,
      ) async {
        print(availableTimes);
        print(extensions);
        print(types);
    var fields = <String, String>{
      "name": name,
      "goverment": goverment,
      "city": city,
      "area": area,
      "street": street,
      "maximum_capacity": maximumCapacity.toString(),
      "price_per_hour": double.parse(pricePerHour).toString(),
      "space": double.parse(space).toString(),
      "category_id": categoryId,
      "day_hour": dayHour,
    };
    for (var i = 0; i < types.length; i++) {
      fields['types[$i]'] = types[i];
    }
      for (var i = 0; i < extensions.length; i++) {
        fields['extensions[$i][name]'] = extensions[i][0];
        fields['extensions[$i][description]'] = extensions[i][1];
        fields['extensions[$i][price]'] = extensions[i][2];
      }
      for (var i = 0; i < availableTimes.length; i++) {
        fields['available_times[$i][day]'] = availableTimes[i][0];
        fields['available_times[$i][from_time]'] = availableTimes[i][1];
        fields['available_times[$i][to_time]'] = availableTimes[i][2];
        fields['available_times[$i][is_Active]'] = availableTimes[i][3];
      }
    return await crud.postMultipartWithToken(
      'http://192.168.140.203:8000/api/places',
      fields,
      token,
      image,
      images,
      'images[]',
    );
  }
}
