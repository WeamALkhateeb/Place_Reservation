import 'dart:io';
import '../../../../appLink.dart';
import '../../../../core/class/curd.dart';
import 'package:http/http.dart' as http;


class AddrequestData {
  Crud crud;
  AddrequestData(this.crud);

  static  postdata(
      String placename ,
      String goverment ,
      String city ,
      String area ,
      String street ,
      String placemaximumcapacity,
      String priceperhour,
      String placespace ,
      String categorieselection ,
      String extensionsJson,
      String typesJson,
      String availabletimesJson ,
      String selectiontime ,
      List<File> images ,
      File image) async {


    var headers = {
      'Authorization': globalAuthorizationToken ?? '',
    };

    var request = http.MultipartRequest('POST', Uri.parse(AppLink.addrequest));


    request.fields.addAll({
      'name': placename,
        'goverment': 'goverment' ,
        'city': 'city' ,
        'area': 'area' ,
        'street': 'street',

      'maximum_capacity': placemaximumcapacity,
      'price_per_hour': priceperhour,
      'space': placespace,
      'category_id' : categorieselection ,
      'extensions[][]': extensionsJson,
      'types[]': typesJson ,
      'available_times[][]': availabletimesJson,
      'day_hour': selectiontime ,
    });

    if (images.isNotEmpty) {
      for (var image in images) {
        request.files.add(await http.MultipartFile.fromPath('images[]', image.path));
      }
    }


    if (image != null) {
      request.files.add(await http.MultipartFile.fromPath('license', image.path));
    }

    request.headers.addAll(headers);


     var response = await Crud().postWithToken( AppLink.addrequest,
        {
          'name': placename,
          'goverment': goverment ,
          'city': city ,
          'area': area ,
          'street': street,
          'maximum_capacity': placemaximumcapacity,
          'price_per_hour': priceperhour,
          'space': placespace,
          'category_id' : categorieselection ,
          'extensions[][]': extensionsJson,
          'types[]': typesJson ,
          'available_times[][]': availabletimesJson,
          'day_hour': selectiontime ,
        }, globalAuthorizationToken!);



    return response.fold((l) => l, (r) => r);
  }
}
