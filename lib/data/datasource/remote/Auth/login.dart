import '../../../../appLink.dart';
import '../../../../core/class/curd.dart';


class LoginData{
  Crud crud;
  LoginData(this.crud);

  postdata(  String username, String password)async{
    var response = await crud.post(AppLink.loginup, {
      "username" : username ,
      "password" :password ,
     });
    return response.fold((l) => l, (r) => r);

  }

}