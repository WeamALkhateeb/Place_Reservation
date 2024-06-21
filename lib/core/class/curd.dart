import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:project2/core/class/statusrequest.dart';
import 'package:http/http.dart' as http;

// Declare a global variable
String? globalAuthorizationToken;

class Crud {
  Future<Either<StatusRequest, Map>> post(String url, Map data, Map<String, String> headers) async {
      var response = await http.post(
      Uri.parse(url),
      body: data,
    );
    final headers = response.headers;
    print('Headers: $headers');
    final authorization = headers['authorization'];

    // Store the authorization header in the global variable
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
}
