import 'dart:io';
import '../../../../appLink.dart';
import '../../../../core/class/curd.dart';
import 'package:http/http.dart' as http;


class AddrequestData {
  Crud crud;
  AddrequestData(this.crud);

  static postdata(String name, String placename, String placedetails, File image, List<File> images) async {

    var headers = {
      'Authorization': globalAuthorizationToken ?? '',
    };

    var request = http.MultipartRequest('POST', Uri.parse(AppLink.addrequest));

    request.fields.addAll({
      'name':  name ,
      'extensions[0][name]': placename,
      'extensions[0][description]': placedetails
    });

    if (image!= null) {
      request.files.add(await http.MultipartFile.fromPath('license', image.path));
    }

    for (var _imageFiles in images) {
      request.files.add(await http.MultipartFile.fromPath('images[]', _imageFiles.path)); // Adjust 'images[]' if needed
    }

    request.headers.addAll(headers);

    var dataToSend = {
      'name':  name ,
      'extensions[0][name]': placename,
      'extensions[0][description]': placedetails
    };


    var responsee = await Crud().postWithToken(AppLink.addrequest, dataToSend  , globalAuthorizationToken!);

    return responsee.fold((l) => l, (r) => r);
  }

}
