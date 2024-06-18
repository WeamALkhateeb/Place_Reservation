import 'package:project2/appLink.dart';
import '../../../../core/class/curd.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  postdata(String name, String username, String email, String password, String passwordconfimation)async{
    var response = await crud.post(AppLink.signup, {
      "name" : name ,
      "username" : username ,
      "email" : email ,
      "password" :password ,
      "passwordconfirmation" :passwordconfimation,});
    return response.fold((l) => l, (r) => r) ;

  }

}