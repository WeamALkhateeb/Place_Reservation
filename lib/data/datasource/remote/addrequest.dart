
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../../../../appLink.dart';
import '../../../../core/class/curd.dart';
import 'package:http/http.dart' as http;

class AddrequestData {
  Crud crud;

  AddrequestData(this.crud);

  static postdata(String name, String placename, String placedetails,
      File image, File images) async {
    /*var response = await Crud.post1(AppLink.addrequest, {
      "name": name,
      "extensions[0][name]": placename,
      "extensions[0][description]": placedetails,
    }, {}, image, images);


    return response.fold((l) => l, (r) => r);*/
  }



}