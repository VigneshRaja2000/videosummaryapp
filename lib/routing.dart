import 'package:get/get.dart';
import 'package:video/constants/path.dart';
import 'package:video/pages/homepage_binding.dart';
import 'package:video/pages/homepage_view.dart';

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
