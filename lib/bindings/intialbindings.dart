import 'package:get/get.dart';
import 'package:project2/core/class/curd.dart';

class initalBindings extends Bindings{
  @override
  void dependencies() {

   Get.put(Crud());

  }

}