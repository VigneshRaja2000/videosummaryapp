import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video/pages/homepage_controller.dart';

class HomeView extends GetResponsiveView<HomeController> {
  HomeView({Key? key}) : super(key: key) {
    Get.put(HomeController());
    controller.init();

    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            appBar: _mainAppBar(context),
            body: Container()));
  }

  _mainAppBar(context) {
    return AppBar(
      title: const Text('Home'),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
    );
  }
}
