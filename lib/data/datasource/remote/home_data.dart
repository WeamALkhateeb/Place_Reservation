import 'package:project2/appLink.dart';
import '../../../../core/class/curd.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  getdata()async{
    var response = await crud.get(AppLink.categories,);
    return response.fold((l) => l, (r) => r);

  }

}