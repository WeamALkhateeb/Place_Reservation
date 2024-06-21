import 'package:project2/appLink.dart';
import '../../../../core/class/curd.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  postdata(String name, String user_name, String email, String password, String password_confirmation)async{
    var response = await crud.post(AppLink.signup, {
      "name" : name ,
      "user_name" : user_name ,
      "email" : email ,
      "password" :password ,
      "password_confirmation" :password_confirmation,},{});
    return response.fold((l) => l, (r) => r) ;

  }

}