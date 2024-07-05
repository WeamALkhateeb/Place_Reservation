import '../../../appLink.dart';
import '../../../core/class/curd.dart';

class MyFavoriteData{
  Crud crud;
  MyFavoriteData(this.crud) ;

  getData()async{
    var response = await crud.get(AppLink.viewfav,globalAuthorizationToken!);
    return response.fold((l) => l, (r) => r);
  }
}