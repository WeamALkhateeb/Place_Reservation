import '../../../../appLink.dart';
import '../../../../core/class/curd.dart';

class LoginData{
  Crud crud;
  LoginData(this.crud);

  postdata(  String user_name, String password)async{
    var response = await crud.post(AppLink.loginup, {
      "user_name" : user_name ,
      "password" :password ,
     },{});
    return response.fold((l) => l, (r) => r);
  }
}