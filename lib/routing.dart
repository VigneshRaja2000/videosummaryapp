import 'package:get/get.dart';
import 'package:hack/constants/path.dart';
import 'package:hack/pages/homepage_binding.dart';
import 'package:hack/pages/homepage_view.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: AppPaths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    )
  ];
}
