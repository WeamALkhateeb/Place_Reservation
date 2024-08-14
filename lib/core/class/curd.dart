import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:project2/core/class/statusrequest.dart';
import 'package:http/http.dart' as http;
import 'dart:core';

// Declare a global variable
String? globalAuthorizationToken;

 class Crud {

   Future<Either<StatusRequest, Map>> post(String url, Map data, Map<String, String> headers,) async {
     var response = await http.post(
       Uri.parse(url),
       body: data,
     );
     final headers = response.headers;
     print('Headers: $headers');
     final authorization = headers['authorization'];

     globalAuthorizationToken = authorization;
     print(globalAuthorizationToken);

     var responsebody = jsonDecode(response.body);
     print(responsebody);
     print("55555${response.statusCode}");
     if (response.statusCode == 200) {
       return Right(responsebody);
     } else if (response.statusCode == 400 || response.statusCode == 401) {
       return const Left(StatusRequest.serverfailure);
     } else {
       return const Left(StatusRequest.offlinefailure);
     }
   }

   Future<Either<StatusRequest, Map>> get(String linkurl,String token) async {
    var response = await http.get(
    Uri.parse(linkurl),
    headers: {
    "authorization": 'Bearer $token' ,
    },
    );
    var responsebody = jsonDecode(response.body);
    print(responsebody);
    print(response);
    if (response.statusCode == 200 || response.statusCode == 201) {
    return Right(responsebody);
    } else if (response.statusCode == 400 || response.statusCode == 404) {
    return const Left(StatusRequest.failure);
    } else {
    return const Left(StatusRequest.offlinefailure);
    }
    }

   Future<Either<StatusRequest, Map>> postWithToken(String url, Map data, String token) async {
     try {
       var headers = {
         'Content-Type': 'application/json',
         'Authorization': 'Bearer $token',
       };

       var response = await http.post(
         Uri.parse(url),
         headers: headers,
         body: jsonEncode(data),
       );

       var responseBody = jsonDecode(response.body);
       print('Response Body: $responseBody');

       if (response.statusCode == 200) {
         return Right(responseBody);
       } else if (response.statusCode == 400 || response.statusCode == 401) {
         return Right(responseBody);
       } else {
         return Left(StatusRequest.offlinefailure);
       }
     } catch (e) {
       print('Exception in post request: $e');
       return Left(StatusRequest.offlinefailure);
     }
   }

   Future<Either<StatusRequest, Map>> deleteWithToken(String url, Map data, String token) async {
     try {
       var headers = {
         'Content-Type': 'application/json',
         'Authorization': 'Bearer $token',
       };

       var response = await http.delete(
         Uri.parse(url),
         headers: headers,
         body: jsonEncode(data),
       );

       var responseBody = jsonDecode(response.body);
       print('Response Body: $responseBody');

       if (response.statusCode == 200) {
         return Right(responseBody);
       } else if (response.statusCode == 400 || response.statusCode == 401) {
         return Left(StatusRequest.serverfailure);
       } else {
         return Left(StatusRequest.offlinefailure);
       }
     } catch (e) {
       print('Exception in delete request: $e');
       return Left(StatusRequest.offlinefailure);
     }
   }
 }

