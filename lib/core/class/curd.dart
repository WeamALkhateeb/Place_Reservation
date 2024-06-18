import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:project2/core/class/statusrequest.dart';
import 'package:http/http.dart' as http;


class Crud
{
  Future<Either<StatusRequest,Map>> post(String url , Map data) async {

           print('222222222222222222222222');
           var response = await http.post(
               Uri.parse(url),
               body: data,
           );
           print('333333333333333333333333333333333333333333');
           var responsebody = jsonDecode(response.body) ;
           print(responsebody);
           print("55555$response.statusCode");
           if(response.statusCode == 200) {
             print('44444444444444444444444444');
           // Map responsebody = jsonDecode(response.body);
           // print(responsebody);
           return Right(responsebody) ;
           }
           else if (response.statusCode == 400 || response.statusCode == 401) {
             print('5555555555555555555555555555555');
             return const Left(StatusRequest.serverfailure);
           }
           else {
             return const Left(StatusRequest.offlinefailure) ;
           }
  }

  Future <Either<StatusRequest, Map>> get(String linkurl) async {
    var response = await http.get(
      Uri.parse(linkurl),
    );

    //
    var responsebody = jsonDecode(response.body) ;
    print(responsebody);

    //
    print("tttttttttttttt");
    print(response);
    if(response.statusCode==200 || response.statusCode==201)
    {

      return  Right(responsebody) ; //responsebody ;

    }
    else if (response.statusCode==400 || response.statusCode==404)
    {
      print("mohmsad");
      return  const Left(StatusRequest.failure) ; //response.statusCode;
    }
    else{
      print("asmaa");
      return const Left(StatusRequest.offlinefailure) ;
    }
  }
}