import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:video/constants/asset.dart';
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
            body: Stack(
              children: [
                Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppAssets.topImage,
                          fit: BoxFit.cover,
                          // Adjust fit according to your needs
                        ),
                        searchbar(context),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: InkWell(
                            onTap: () {
                              controller.convert();
                            },
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.blue, // Set blue background color
                                borderRadius: BorderRadius.circular(
                                    10), // Set rounded border radius
                              ),
                              child: Container(
                                width: double
                                    .infinity, // Take the total width of the screen
                                padding:
                                    EdgeInsets.all(10), // Add padding as needed
                                alignment:
                                    Alignment.center, // Align text in center
                                child: const Text(
                                  "Convert",
                                  style: TextStyle(
                                    color:
                                        Colors.white, // Set text color to white
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        controller.thumbnailUrl.value == ""
                            ? Container()
                            : Image.network(controller.thumbnailUrl.value)
                      ],
                    )),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(AppAssets.homeImage),
                ),
                Positioned(
                  bottom: 50,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(AppAssets.design),
                ),
              ],
            )));
  }

  Widget searchbar(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.90,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 0.5, color: Colors.grey), // Border properties
      ),
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
          border: InputBorder.none,
        ),
      ),
    );
  }
}
