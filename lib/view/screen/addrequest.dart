import 'dart:core';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/controller/addrequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/validateinput.dart';
import '../widget/auth/materialbuttonauth.dart';
import '../widget/auth/textformfiledauth.dart';
import 'package:http/http.dart' as http;


class AddRequest extends StatefulWidget{
  const AddRequest({Key? key}) : super(key: key);

  @override
  State<AddRequest> createState() => _AddRequestState();
}


class _AddRequestState extends State<AddRequest> {

  File? image;
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageFiles = [];

  Future _selectImages() async {
    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      setState(() {
        _imageFiles = selectedImages;
      });
    }
  }
      //.map((xFile) => File(xFile.path)).cast<XFile>().toList()
   Future UploadImage() async {
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




  Future sendRequest(String name , String placename , String placedetails , File image , List<File> images ) async {
    print('111111');
    var headers = {
      'Authorization': '••••••'
    };
    var request = http.MultipartRequest('POST', Uri.parse('http://192.168.1.101:8000/api/places'));
    print('222222222');
    request.fields.addAll({
      'name':  name ,
      'extensions[0][name]': placename,
      'extensions[0][description]': placedetails ,
    });

    print('33333');
    if (image!= null) {
      request.files.add(await http.MultipartFile.fromPath('license', image.path));
    }

    print('3333333333333333333333333');
    for (var _imageFiles in images) {
      request.files.add(await http.MultipartFile.fromPath('images[]', _imageFiles.path)); // Adjust 'images[]' if needed
    }


    request.headers.addAll(headers);

    print('444444444444444444444');

    http.StreamedResponse response = await request.send();

    print("response : ${response.statusCode}");

    print(await response.stream.bytesToString());

    if (response.statusCode == 200) {
      print('5555555555555555');
      print(await response.stream.bytesToString());
    }
    else {
      print('66666666666');
      print(response.reasonPhrase);
    }

  }

  @override
  Widget build(BuildContext context) {
    AddRequestcontrollerImp controller = Get.put(AddRequestcontrollerImp());

    return Scaffold(

      body:SingleChildScrollView(
          child: Form(
            key: controller.formstate,
            child: GetBuilder<AddRequestcontrollerImp>(
                builder: (controller) => Column(
                children: [
                  const SizedBox(height: 60,),
                  Textformfieldauth(
                    mycontroller:controller.username,
                    hinttext:  'Enter user name',
                    valid: (value) {  return validateinput(value!, 5 , 25); },
                    iconDataprefix: Icons.person,
                    keyboardType: TextInputType.name,),
                  const SizedBox(height: 10,),
                  Textformfieldauth(
                    mycontroller:controller.placename,
                    hinttext:  'Enter place name ',
                    valid: (value) {  return validate( value!); },
                    iconDataprefix: Icons.place,
                    keyboardType: TextInputType.text,),
                  const SizedBox(height: 10,),
                  Textformfieldauth(
                    mycontroller:controller.placedetails,
                    hinttext:  ' Write the details for the place ',
                    valid: (value) { return validate( value!); },
                    iconDataprefix: Icons.short_text,
                    iconDatasuffix: Icons.clear,
                    onTapicon: (){
                      controller.placedetails.clear();
                    },
                    keyboardType: TextInputType.text,),
                  const SizedBox(height: 15,),
                  Column(
                children: [
                  InkWell(
                    onTap: (){_selectImages();},
                    child: Container(
                      height: 130,
                      width: 310,
                      decoration: BoxDecoration(
                        border: Border.all(color: fourBackColor),
                      ),
                      child: _imageFiles!= null && _imageFiles!.isEmpty
                          ? Center(child: Text('To download a photo of the place,\n click here .. '))
                          : GridView.builder(
                        itemCount: _imageFiles!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        itemBuilder: (BuildContext context , int index){
                          return Image.file(File(_imageFiles![index].path),fit:BoxFit.cover);},
                      ),
                    ),
                  ),
                ],
              ),
                  const SizedBox(height: 15,),
                  InkWell(onTap:(){UploadImage();},
                    child: Container(
                        height: 130,
                        width: 310,
                        decoration: BoxDecoration(
                          border: Border.all(color: fourBackColor),
                        ),
                        child: image != null ? Image.file(image!.absolute,
                          fit: BoxFit.cover,) : Center(child:Text('To download a copy of the license ,\n click here .. ')))),
                 /* const SizedBox(height: 20,),
                  SafeArea(child: Text('Enter place location')),
                  const SizedBox(height: 15,),
                  Textformfieldauth(
                    mycontroller:controller.goverment,
                    hinttext:  'Enter goverment ',
                    valid: (value) { return validate( value!); },
                    iconDataprefix: Icons.location_city,
                    keyboardType: TextInputType.text,),
                  const SizedBox(height: 5,),
                  Textformfieldauth(
                    mycontroller:controller.city,
                    hinttext:  'Enter city ',
                    valid: (value) { return validate( value!); },
                    iconDataprefix: Icons.location_city,
                    keyboardType: TextInputType.text,),
                  const SizedBox(height: 5,),
                  Textformfieldauth(
                    mycontroller:controller.area,
                    hinttext:  'Enter area',
                    valid: (value) { return validate( value!); },
                    iconDataprefix: Icons.location_city,
                    keyboardType: TextInputType.text,),
                  const SizedBox(height: 5,),
                  Textformfieldauth(
                    mycontroller:controller.street,
                    hinttext:  'Enter street ',
                    valid: (value) { return validate( value!); },
                    iconDataprefix: Icons.location_city,
                    keyboardType: TextInputType.text,),*/
                  const SizedBox(height: 25,),
                  MaterialButtonAuth(text: 'Send order',
                    /*onPressed: () {
                      if (image!= null && _imageFiles!= null) {
                       controller.Sendrequest( image , _imageFiles);
                      }
                      else {
                        print("Please select an image and multiple images.");
                      }
                    },*/
                    onPressed: (){
                      List<File> filesToSend = _imageFiles!
                          .map((xFile) => File(xFile.path))
                          .toList(); // تحويل كائنات XFile إلى كائنات File

                      sendRequest(controller.username.text, controller.placename.text, controller.placedetails.text, image!, filesToSend);
                    },
                  )
                ],
                ),
    ))));
  }}


