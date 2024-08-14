import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/addrequest_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/validateinput.dart';
import '../widget/auth/materialbuttonauth.dart';
import '../widget/auth/textformfiledauth.dart';



class AddItemScreen extends StatefulWidget {
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {

  AddRequestcontrollerImp controller = Get.put(AddRequestcontrollerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: fourBackColor,
        elevation: 0,
        title: const Text(
            'Adding types in place' ,
            style: TextStyle(
                color: white,
                fontSize: 18)),
        centerTitle: true,
        flexibleSpace: Container(
            decoration:const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(50)),
                gradient: LinearGradient(colors: [sixBackColor,fourBackColor],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight
                ))),),

      body: Column(
          children: [
            const SizedBox(height: 30,),
            Textformfieldauth(
              mycontroller: controller.typeinformation,
              hinttext: 'Enter Type ',
              valid: (value ) {  return validate( value!);},
              iconDataprefix: Icons.wrap_text_sharp,
              iconDatasuffix: Icons.clear,
              onTapicon: (){
                controller.typeinformation.clear();
              },
              keyboardType: TextInputType.text,),

            MaterialButtonAuth(
                text: 'Add',
                onPressed: ()
                {
                  if (controller.typeinformation.text.isNotEmpty) {
                    controller.Type.add(controller.typeinformation.text.trim());
                    controller.typeinformation.clear(); }
                }
            )
          ]
      ),


    ) ;
  }
}