import 'dart:io';

import 'package:get/get.dart';

class CommonController extends GetxController {
  RxInt bottomIndex = 0.obs;
  Rx<File?>? image;
  RxBool isSelected = false.obs;
}
