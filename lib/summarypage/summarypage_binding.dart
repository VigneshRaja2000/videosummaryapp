import 'package:get/get.dart';
import 'package:video/summarypage/summarypage_controller.dart';

class SummaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SummaryController>(
      () => SummaryController(),
    );
  }
}
