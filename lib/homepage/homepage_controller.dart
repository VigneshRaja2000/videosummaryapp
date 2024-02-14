import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video/constants/path.dart';
import 'package:video/homepage/homepage_variables.dart';

class HomeController extends GetxController with HomeVariables {
  init() async {}
  convert() async {
    Get.toNamed(AppPaths.summary);
  }
}
