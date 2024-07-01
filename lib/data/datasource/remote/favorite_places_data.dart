import '../../../appLink.dart';
import '../../../core/class/curd.dart';

class FavoriteData{
  Crud crud;
  FavoriteData(this.crud) ;

  addfavorite(String user_id, String place_id)async{
    var response = await crud.postWithToken(
        AppLink.addfav, {
          "user_id" : user_id,
          "place_id" : place_id  ,
        },globalAuthorizationToken!);
    return response.fold((l) => l, (r) => r);
  }

  deletefavorite(String user_id, String place_id,String link)async{
    var response = await crud.deleteWithToken(
        link, {
          "user_id" : user_id  ,
          "place_id" : place_id ,
        },globalAuthorizationToken!);
    return response.fold((l) => l, (r) => r);
  }
}