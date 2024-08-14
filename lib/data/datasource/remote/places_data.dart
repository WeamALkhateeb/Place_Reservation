import '../../../core/class/curd.dart';

class PlacesData{
  Crud crud;
  PlacesData(this.crud);

    getdata(String link) async {
      var response = await crud.get(link,globalAuthorizationToken!);
      return response.fold((l) => l, (r) => r) ;
    }
  }
