import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:project2/core/class/statusrequest.dart';
import 'package:project2/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;


class Crud
{
  Future<Either<StatusRequest,Map>> post(String url , Map data) async {

        print('111111111111111111111111111111111111111111');
        var response = await http.post(Uri.parse(url), body: data);
        print(response.statusCode);
        if(response.statusCode == 200)
        { print('222222222222222222222222222222222222222');
        Map responsebody = jsonDecode(response.body);
        print(responsebody);
        return Right(responsebody) ;
        }
        else {
          print('333333333333333333333333333333333333333333');
          return const Left(StatusRequest.serverfailure);
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