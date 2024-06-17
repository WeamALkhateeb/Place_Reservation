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
}