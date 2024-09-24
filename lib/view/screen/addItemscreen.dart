import 'dart:core';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/validateinput.dart';
import '../../controller/addrequest_controller.dart';
import '../widget/auth/materialbuttonauth.dart';
import '../widget/auth/textformfiledauth.dart';

class AddItemScreen extends StatefulWidget {
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  AddRequestcontrollerImp controller = Get.put(AddRequestcontrollerImp());
  List<String> items = []; // قائمة لتخزين العناصر المدخلة

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: fourBackColor,
        elevation: 0,
        title: const Text(
            'Adding types in place',
            style: TextStyle(
                color: white,
                fontSize: 18)),
        centerTitle: true,
        flexibleSpace: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(50)),
                gradient: LinearGradient(
                    colors: [sixBackColor, fourBackColor],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight
                ))),
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Textformfieldauth(
            mycontroller: controller.typeinformation,
            hinttext: 'Enter Type ',
            valid: (value) { return validate(value!); },
            iconDataprefix: Icons.wrap_text_sharp,
            iconDatasuffix: Icons.clear,
            onTapicon: () {
              controller.typeinformation.clear();
            },
            keyboardType: TextInputType.text,
          ),
          MaterialButtonAuth(
            text: 'Add',
            onPressed: () {
              if (controller.typeinformation.text.isNotEmpty) {
                setState(() {
                  controller.types.add(controller.typeinformation.text.trim());
                  controller.typeinformation.clear();
                });
              }
              print(controller.types);
            },
          ),
          const SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
              itemCount: controller.types.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.label, color: Colors.blueAccent),
                      SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          controller.types[index],
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
