import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:project2/core/constant/color.dart';

import '../../controller/setting_controller.dart';
import '../../core/constant/routes.dart';
import '../../core/localization/changelocal.dart';


class Setting extends StatelessWidget {
  Setting({Key? key}) : super(key: key);
 // final ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    SettingController controller = Get.put(SettingController());
    LocaleController langcontroller = Get.find() ;
    return Container(
      color: white,
      child: ListView(
        children:[
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color:firstBackColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: Get.width/2.5,
               // child: Text("Setting"),
              ),
            ],),
          const SizedBox(height: 100,),
          Container(
            padding:const EdgeInsets.symmetric(horizontal: 15),
            child: Card(child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text("Dark mode".tr),
                  trailing: IconButton(
                    onPressed:(){},
                  //  _themeController.toggleTheme,
                    icon: const Icon(Icons.dark_mode,color: Colors.black,),
                  ),
                ),
                const Divider(),
                ListTile(
                  title: Text("Language".tr),
                  trailing: IconButton(
                    onPressed: (){
                      if(langcontroller.myServices.sharedPreferances.getString("lang") == "ar")
                      {langcontroller.changeLang("en");}
                      else if(langcontroller.myServices.sharedPreferances.getString("lang") == "en")
                      {langcontroller.changeLang("ar");
                      }
                    } ,
                    icon:const Icon(Icons.translate,color: thirdBackColor,),
                  ),
                ),
                const Divider(),
                ListTile(
                  onTap: (){
                    Get.offNamed(AppRoute.aboutas);
                  },
                  title: Text("About us".tr),
                  trailing: const Icon(Icons.account_balance_outlined,color: Colors.green,),
                ),
                const Divider(),
                ListTile(
                  onTap: (){
                    Get.offNamed(AppRoute.contactas);
                  },
                  title: Text("Contact us".tr),
                  trailing: const Icon(Icons.phone,color: Colors.deepOrangeAccent,),
                ),
                const Divider(),
                ListTile(
                  onTap: (){
                   controller.logout();
                  },
                  title: Text("Logout".tr),
                  trailing: const Icon(Icons.exit_to_app,color: Colors.deepPurple,),
                ),
              ],),
            ),
          ),
        ],
      ),
    );
  }
}
