import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:project2/core/class/statusrequest.dart';
import 'package:http/http.dart' as http;


class Crud
{
  Future<Either<StatusRequest,Map>> post(String url , Map data) async {


         try{
           print('222222222222222222222222');
           var response = await http.post(Uri.parse(url), body: data);
           print('333333333333333333333333333333333333333333');
           print(response.statusCode);
           if(response.statusCode == 200)
           { print('44444444444444444444444444');
           Map responsebody = jsonDecode(response.body);
           print(responsebody);
           return Right(responsebody) ;
           }
           else {
             print('5555555555555555555555555555555');
             return const Left(StatusRequest.serverfailure);
           }
         }
         catch(_)
    {
      return const Left(StatusRequest.serverException);
    }



  }
}