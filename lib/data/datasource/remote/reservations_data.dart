import '../../../appLink.dart';
import '../../../core/class/curd.dart';

class ReservationsData{
  Crud crud;
  ReservationsData(this.crud) ;

  addmakeHour(int place_id,int type_id,String date_and_time,String start_time,String end_time,List<dynamic> ? extensions)async{
    var response = await crud.postWithToken(
        AppLink.makeHour, {
      "place_id" : place_id ,
      "type_id" : type_id ,
      "date_and_time" : date_and_time ,
      "start_time" : start_time ,
      "end_time" : end_time ,
      "extensions" : extensions ,
    },globalAuthorizationToken!);
    return response.fold((l) => l, (r) => r);
  }

  addmakeDay(int place_id,int type_id,String date_and_time,int numOfDay, List<dynamic> ? extensions)async{
    var response = await crud.postWithToken(
        AppLink.makeDay, {
      "place_id" : place_id ,
      "type_id" : type_id ,
      "date_and_time" : date_and_time ,
      "numOfDay" : numOfDay,
      "extensions" : extensions ,
    },globalAuthorizationToken!);
    return response.fold((l) => l, (r) => r);
  }

  addReservationsHours(int place_id,int type_id,String date_and_time,String start_time,String end_time,List<dynamic> ? extensions)async{
    var response = await crud.postWithToken(
        AppLink.reservationsHours, {
      "place_id" : place_id ,
      "type_id" : type_id ,
      "date_and_time" : date_and_time ,
      "start_time" : start_time ,
      "end_time" : end_time ,
      "extensions" : extensions ,
    },globalAuthorizationToken!);
    return response.fold((l) => l, (r) => r);
  }

  addReservationsDays(int place_id,int type_id,String date_and_time,int numOfDay,List<dynamic> ? extensions)async{
    var response = await crud.postWithToken(
        AppLink.reservationsDays, {
      "place_id" : place_id ,
      "type_id" : type_id ,
      "date_and_time" : date_and_time ,
      "numOfDay" : numOfDay,
      "extensions" : extensions ,
    },globalAuthorizationToken!);
    return response.fold((l) => l, (r) => r);
  }

  getAvailableTimes(String link)async{
    var response = await crud.get(link,globalAuthorizationToken!);
    return response.fold((l) => l, (r) => r);
  }

  getMyReservations()async{
    var response = await crud.get(AppLink.myreservations,globalAuthorizationToken!);
    return response.fold((l) => l, (r) => r);
  }

  rating(int place_id, String text, int rate)async{
    var response = await crud.postWithToken(
        AppLink.rating,
        {
          "place_id": place_id ,
          "text" :    text ,
          "rate" :    rate ,
        },
        globalAuthorizationToken!
     );
    return response.fold((l) => l, (r) => r);
  }
}
