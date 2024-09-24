import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/addrequest_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/validateinput.dart';
import '../widget/auth/materialbuttonauth.dart';
import '../widget/auth/textformfiledauth.dart';

class ExtensionScreen extends StatefulWidget {
  @override
  _ExtensionScreenState createState() => _ExtensionScreenState();
}

class _ExtensionScreenState extends State<ExtensionScreen> {
  AddRequestcontrollerImp controller = Get.put(AddRequestcontrollerImp());
  List<List<String>> extensions = []; // قائمة لتخزين الإضافات

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: fourBackColor,
        elevation: 0,
        title: const Text(
          'Adding Extension in place',
          style: TextStyle(color: white, fontSize: 18),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60),
              bottomRight: Radius.circular(50),
            ),
            gradient: LinearGradient(
              colors: [sixBackColor, fourBackColor],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30,),
          Textformfieldauth(
            mycontroller: controller.namevalue,
            hinttext: 'Enter name',
            valid: (value) { return validate(value!); },
            iconDataprefix: Icons.person,
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 15,),
          Textformfieldauth(
            mycontroller: controller.descriptionvalue,
            hinttext: 'Write description',
            valid: (value) { return validate(value!); },
            iconDataprefix: Icons.wrap_text_sharp,
            iconDatasuffix: Icons.clear,
            onTapicon: () {
              controller.descriptionvalue.clear();
            },
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 15,),
          Textformfieldauth(
            mycontroller: controller.pricevalue,
            hinttext: 'Enter price',
            valid: (value) { return validate(value!); },
            iconDataprefix: Icons.price_change_outlined,
            keyboardType: TextInputType.number,
          ),
          MaterialButtonAuth(
            text: 'Add',
            onPressed: () {
              if (controller.namevalue.text.isNotEmpty &&
                  controller.descriptionvalue.text.isNotEmpty &&
                  controller.pricevalue.text.isNotEmpty) {
                List<String> newExtension = [
                  controller.namevalue.text.trim(),
                  controller.descriptionvalue.text.trim(),
                  controller.pricevalue.text.trim(),
                ];
                setState(() {
                  controller.extensions.add(newExtension);
                });
                controller.namevalue.clear();
                controller.descriptionvalue.clear();
                controller.pricevalue.clear();
              }
              print(controller.extensions);
            },
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: controller.extensions.length,
              itemBuilder: (context, index) {
                var extension = controller.extensions[index];
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: ${extension[0]}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Description: ${extension[1]}',
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Price: ${extension[2]} s.p',
                        style: TextStyle(fontSize: 14, color: Colors.green[700]),
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
