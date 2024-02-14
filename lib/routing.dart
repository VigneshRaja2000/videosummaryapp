import 'package:get/get.dart';
import 'package:video/constants/path.dart';
import 'package:video/homepage/homepage_binding.dart';
import 'package:video/homepage/homepage_view.dart';
import 'package:video/summarypage/summarypage_binding.dart';
import 'package:video/summarypage/summarypage_view.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: AppPaths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppPaths.summary,
      page: () => SummaryView(),
      binding: SummaryBinding(),
    )
  ];
}
