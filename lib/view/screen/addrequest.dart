import 'dart:core';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/controller/addrequest_controller.dart';
import 'package:project2/core/class/curd.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/validateinput.dart';
import '../widget/auth/materialbuttonauth.dart';
import '../widget/auth/textformfiledauth.dart';
import 'addItemscreen.dart';
import 'availabletimes.dart';
import 'extensions.dart';

class AddRequest extends StatefulWidget {
  const AddRequest({Key? key}) : super(key: key);

  @override
  State<AddRequest> createState() => _AddRequestState();
}

class _AddRequestState extends State<AddRequest> {
  List<String> _selection = ["DAYS", "HOURS"];
  File? image;
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageFiles = [];
  late AddRequestcontrollerImp controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(AddRequestcontrollerImp());
  }

  Future<void> _selectImages() async {
    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    if (selectedImages != null && selectedImages.isNotEmpty) {
      setState(() {
        _imageFiles = selectedImages;
      });
    }
  }

  Future<void> _uploadImage() async {
    final pickedImage = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sixBackColor,
      appBar: AppBar(
        backgroundColor: firstBackColor,
        elevation: 0,
        title: Text(
          'Add request'.tr,
          style: const TextStyle(color: white, fontFamily: 'DeliciousHandrawn', fontSize: 25),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60), bottomRight: Radius.circular(50)),
            gradient: LinearGradient(
              colors: [sixBackColor, firstBackColor],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formstate,
          child: GetBuilder<AddRequestcontrollerImp>(
            builder: (controller) => Column(
              children: [
                const SizedBox(height: 25),
              //  قائمة التصنيفات
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: "Select Category",
                      border: OutlineInputBorder(),
                    ),
                    value: controller.categoriesSelection.isEmpty ? null : controller.categoriesSelection,
                    items: controller.categories.map((category) {
                      return DropdownMenuItem<String>(
                        value: category['id'].toString(),
                        child: Text(category['name']),
                      );
                    }).toList(),
                    onChanged: (value) {
                      controller.categoriesSelection = value!;
                      controller.update();
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a category';
                      }
                      return null;
                    },
                  ),
                ),

                Textformfieldauth(
                  mycontroller: controller.placename,
                  hinttext: 'Enter place name ',
                  valid: (value) => validate(value!),
                  iconDataprefix: Icons.place,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                // Place maximum capacity
                Textformfieldauth(
                  mycontroller: controller.placemaximumcapacity,
                  hinttext: 'Maximum capacity for place',
                  valid: (value) => validate(value!),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                // Price per hour
                Textformfieldauth(
                  mycontroller: controller.priceperhour,
                  hinttext: 'Enter price per hour',
                  valid: (value) => validate(value!),
                  iconDataprefix: Icons.price_change_outlined,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                // Place space
                Textformfieldauth(
                  mycontroller: controller.placespace,
                  hinttext: 'Enter place space',
                  valid: (value) => validate(value!),
                  iconDataprefix: Icons.space_bar_sharp,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                // Location
                const SafeArea(
                  child: Text(
                    'Enter place location :',
                    style: TextStyle(fontSize: 16, color: firstBackColor, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 15),
                Textformfieldauth(
                  mycontroller: controller.goverment,
                  hinttext: 'Enter goverment ',
                  valid: (value) => validate(value!),
                  iconDataprefix: Icons.location_city,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 5),
                Textformfieldauth(
                  mycontroller: controller.city,
                  hinttext: 'Enter city ',
                  valid: (value) => validate(value!),
                  iconDataprefix: Icons.location_city,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 5),
                Textformfieldauth(
                  mycontroller: controller.area,
                  hinttext: 'Enter area',
                  valid: (value) => validate(value!),
                  iconDataprefix: Icons.location_city,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 5),
                Textformfieldauth(
                  mycontroller: controller.street,
                  hinttext: 'Enter street ',
                  valid: (value) => validate(value!),
                  iconDataprefix: Icons.location_city,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20),
                // Available times
                const Text(
                  'Choose Days or Hours :',
                  style: TextStyle(fontSize: 16, color: firstBackColor, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < _selection.length; i++)
                      Row(
                        children: [
                          Radio(
                            value: _selection[i],
                            groupValue: controller.selectiontime,
                            onChanged: (value) {
                              setState(() {
                                controller.selectiontime = value.toString();
                              });
                            },
                          ),
                          Text(_selection[i]),
                          const SizedBox(width: 15),
                        ],
                      ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 80, left: 60),
                  child: Row(
                    children: [
                      const Text(
                        "If it's Hours, Click ",
                        style: TextStyle(fontSize: 15),
                      ),
                      const Icon(Icons.forward),
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Availabletimes()),
                          );
                        },
                        child: const Text(
                          'Add Hours',
                          style: TextStyle(color: fourBackColor),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                // Add extensions
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: Row(
                    children: [
                      const Text(
                        "To add extensions, Click ",
                        style: TextStyle(fontSize: 15),
                      ),
                      const Icon(Icons.forward),
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ExtensionScreen()),
                          );
                        },
                        child: const Text(
                          'Add extensions',
                          style: TextStyle(color: fourBackColor),
                        ),
                      ),
                    ],
                  ),
                ),
                // Type
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 40),
                  child: Row(
                    children: [
                      const Text(
                        'To add types of halls, click ',
                        style: TextStyle(fontSize: 15),
                      ),
                      const Icon(Icons.forward),
                      const SizedBox(height: 10),
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddItemScreen()),
                          );
                        },
                        child: const Text(
                          'Add Type ',
                          style: TextStyle(color: fourBackColor),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                // Images for place
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        _selectImages();
                      },
                      child: Container(
                        height: 130,
                        width: 310,
                        decoration: BoxDecoration(
                          border: Border.all(color: fourBackColor),
                        ),
                        child: _imageFiles != null && _imageFiles!.isEmpty
                            ? const Center(child: Text('To download a photo of the place,\n click here .. '))
                            : GridView.builder(
                          itemCount: _imageFiles!.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                          itemBuilder: (BuildContext context, int index) {
                            return Image.file(
                              File(_imageFiles![index].path),
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                // License
                InkWell(
                  onTap: () {
                    _uploadImage();
                  },
                  child: Container(
                    height: 130,
                    width: 310,
                    decoration: BoxDecoration(
                      border: Border.all(color: fourBackColor),
                    ),
                    child: image != null
                        ? Image.file(
                      image!.absolute,
                      fit: BoxFit.cover,
                    )
                        : const Center(child: Text('To download a copy of the license,\n click here .. ')),
                  ),
                ),
                const SizedBox(height: 20),
                MaterialButtonAuth(
                  text: 'Send order',
                  onPressed: () {
                    if (controller.formstate.currentState!.validate()) {
                      List<File> filesToSend = _imageFiles!.map((xFile) => File(xFile.path)).toList();
                      if (image != null) {
                        var maximumCapacityInt = int.tryParse(controller.placemaximumcapacity.text.trim());
                        controller.sendRequest(
                          controller.placename.text.trim(),
                          controller.goverment.text.trim(),
                          controller.city.text.trim(),
                          controller.area.text.trim(),
                          controller.street.text.trim(),
                          maximumCapacityInt!,
                          controller.priceperhour.text.trim(),
                          controller.placespace.text.trim(),
                          controller.categoriesSelection,
                          controller.selectiontime,
                          controller.types,
                          controller.extensions,
                          controller.availableTimes,
                          image!,
                          filesToSend,
                          globalAuthorizationToken!,
                        );
                      } else {
                        Get.snackbar(
                          "Error",
                          "Please upload a license image.",
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
