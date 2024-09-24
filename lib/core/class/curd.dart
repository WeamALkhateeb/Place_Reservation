import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:project2/core/class/statusrequest.dart';
import 'package:http/http.dart' as http;
import 'dart:core';
import 'package:http_parser/http_parser.dart';
import '../../../core/class/statusrequest.dart';


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

   Future<Either<StatusRequest, Map>> postMultipartWithToken(
       String url,
       Map<String, String> fields,
       String token,
       File licenseFile,
       List<File> files,
       String fileFieldName,
       ) async {
     try {
       var headers = {
         'Authorization': 'Bearer $token',
       };
       var uri = Uri.parse(url);
       var request = http.MultipartRequest('POST', uri);
       request.headers.addAll(headers);

       fields.forEach((key, value) {
         request.fields[key] = value;
       });

       request.files.add(await http.MultipartFile.fromPath(
         'license',
         licenseFile.path,
       ));
       print("Files to be uploaded: ${files.map((file) => file.path).toList()}");

       for (File file in files) {
         request.files.add(await http.MultipartFile.fromPath(
           fileFieldName,
           file.path,
           contentType: MediaType('image', 'jpg'),
         ));
       }

       var response = await request.send();
       var responseBody = await http.Response.fromStream(response);
       var decodedResponse = jsonDecode(responseBody.body);

       print('Response Body: $decodedResponse');
       if (response.statusCode == 200) {
         return Right(decodedResponse);
       } else if (response.statusCode == 400 || response.statusCode == 401) {
         return Right(decodedResponse);
       } else {
         return Left(StatusRequest.failure);
       }
     } catch (e) {
       print('Exception in multipart request: $e');
       return Left(StatusRequest.offlinefailure);
     }
   }


 }

// Future<Either<StatusRequest, Map>> postMultipartWithToken(
//     String url,
//     Map<String, String> fields,
//     String token,
//     File licenseFile,
//     List<File> files,
//     String fileFieldName,
//     ) async {
//   try {
//     // إضافة التوكن في الهيدر
//     var headers = {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $token',
//     };
//     var uri = Uri.parse(url);
//     var request = http.MultipartRequest('POST', uri);
//
//     var response = await http.post(
//       uri,
//       headers: headers,
//       body: jsonEncode(fields),
//     );
//     // for (File file in files) {
//     //   request.files.add(await http.MultipartFile.fromPath(
//     //     fileFieldName,
//     //     file.path,
//     //     contentType: MediaType('image', 'jpeg'), // تأكد من استخدام نوع المحتوى الصحيح
//     //   ));
//     // }
//     // إضافة ملف الترخيص الثابت
//     request.files.add(await http.MultipartFile.fromPath(
//       'license', // اسم الحقل للملف
//       licenseFile.path,
//       contentType: MediaType('image', 'jpg'), // نوع المحتوى
//     ));
//     // var response = await request.send();
//     print(response);
//     print(request);
// //http.StreamedResponse response= await request.send();
//     // تحويل الاستجابة إلى نص لتتمكن من تحليلها
//     // var responseBody = await http.Response.fromStream(response);
//     // var decodedResponse = jsonDecode(responseBody.body);
//     var responseBody = jsonDecode(response.body);
//     print('Response Body: $responseBody');
//     if (response.statusCode == 200) {
//       return Right(responseBody);
//     } else if (response.statusCode == 400 || response.statusCode == 401) {
//       return Right(responseBody);
//     } else {
//       return Left(StatusRequest.failure);
//     }
//   } catch (e) {
//     print('Exception in multipart request: $e');
//     return Left(StatusRequest.offlinefailure);
//   }
// }