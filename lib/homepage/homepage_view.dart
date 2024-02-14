import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video/homepage/homepage_controller.dart';

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
            body: Column(children: [
              searchbar(context),
            ])));
  }

  _mainAppBar(context) {
    return AppBar(
      title: const Text('Home'),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
    );
  }

  searchbar(context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.90,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: controller.url,
        onSubmitted: (value) {
          controller.convert();
        },
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(top: 4),
            prefixIcon: IconButton(
              onPressed: null,
              icon: Icon(Icons.search),
            ),
            hintText: "covert",
            border: InputBorder.none),
      ),
    );
  }
}
