import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hack/constants/path.dart';
import 'package:hack/pages/homepage_view.dart';
import 'package:hack/routing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeView(),
      initialRoute: AppPaths.home,
      // initialBinding: AppPages.initialBinding,
    );
  }
}
