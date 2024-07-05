class AppLink
{
  static const String url = "http://192.168.1.112:8000/api";
  static const String signup ="$url/auth/register";
  static const String loginup = "$url/auth/login";
  static const String categories ="$url/categories";
  static const String location ="$url/addresses";
  static const String addrequest ="$url/places";
  static const String places ="$url/places/getPlacesByCatId?id=";

  //=================== Favorite =======================
  static String addfav = "$url/favourites" ;
  static String deletefav = "$url/favourites/" ;
  static String viewfav = "$url/favourites";

  // ================================== Images ========================
  static const String image ="http://192.168.1.112:8000";
  static const String imageCategories ="$image/storage/app/public/categories/";


}