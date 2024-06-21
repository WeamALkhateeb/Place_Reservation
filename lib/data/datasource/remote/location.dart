import '../../../appLink.dart';
import '../../../core/class/curd.dart';

class LocationData{
  Crud crud;
  LocationData(this.crud);

  postdata(  String goverment , String city ,String area , String street)async{
    var response = await crud.post(AppLink.location, {
      "goverment" : goverment ,
      "city" :city ,
      "area" :area,
      "street" :street ,
    },{});
    return response.fold((l) => l, (r) => r);
  }
}