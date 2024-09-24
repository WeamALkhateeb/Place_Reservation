class AppLink
{
  static const String url = "http://192.168.140.203:8000/api";
  static const String signup ="$url/auth/register";
  static const String loginup = "$url/auth/login";
  static String logout= "$url/auth/logout" ;
  static const String categories ="$url/categories";
  static const String location ="$url/addresses";
  static const String addrequest ="$url/places";
  static const String places ="$url/places/getPlacesByCatId?id=";

  //=================== Favorite ====================================
  static String addfav = "$url/favourites" ;
  static String deletefav = "$url/favourites/" ;
  static String viewfav = "$url/favourites";

  // ================================== Images ======================
  static const String image ="http://192.168.140.203:8000";
  static const String imageCategories ="$image/storage/app/public/categories/";

  //=============================== Reservations ====================
  static String reservationsHours = "$url/reservations/test" ;
  static String reservationsDays = "$url/reservations/storeFromDay" ;
  static String makeHour = "$url/reservations/makeHour" ;
  static String makeDay = "$url/reservations/makeDay";
  static String availableTimes = "$url/availableTimes/";
  static String myreservations= "$url/reservations/myReservation" ;
  static String searchplaces = "$url/places/search?name=";
  static String rating = "$url/rateWithComments";

}