import '../../../appLink.dart';
import '../../../core/class/curd.dart';

class SettingData {
  Crud crud;
  SettingData(this.crud);
  logoutdata()async{
    var response = await crud.postWithToken(
        AppLink.logout,
        {},
        globalAuthorizationToken!
    );
    return response.fold((l) => l, (r) => r);
  }
}