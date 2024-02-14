import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video/constants/strings.dart';
import 'package:video/summarypage/summarypage_controller.dart';

class SummaryView extends GetResponsiveView<SummaryController> {
  SummaryView({Key? key}) : super(key: key) {
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
      title: const Text(AppStrings.summary),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
    );
  }
}
