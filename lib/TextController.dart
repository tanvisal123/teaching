

import 'package:get/get.dart';
class TextController extends GetxController{
   RxString name = "Visal".obs;

  void changeText(){
    name.value ="Meng";

  }
}