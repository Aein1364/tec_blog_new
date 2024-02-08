import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec_blog_new/components/my_colors.dart';
import 'package:tec_blog_new/components/widgets/bottom_navigation_widget.dart';
import 'package:tec_blog_new/components/widgets/loading_widget.dart';
import 'package:tec_blog_new/controller/home_controller.dart';
import 'package:tec_blog_new/view/home_screen.dart';
import 'package:tec_blog_new/view/profile_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  HomeController homeController = Get.put(HomeController());
  RxInt selectedIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: Obx(
        () => homeController.loading.value
            ? Stack(
                children: [
                  IndexedStack(
                    index: selectedIndex.value,
                    children: [
                      HomeScreen(
                          homeController: homeController, textTheme: textTheme),
                      ProfileScreen()
                    ],
                  ),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        height: Get.height / 7,
                        width: Get.width,
                        foregroundDecoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: MyColors.matedGradientColor,
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter)),
                      )),
                  Positioned(
                    bottom: 10,
                    left: Get.width / 7.3,
                    right: Get.width / 7.3,
                    child: BottomNavigationWidget(selectedIndex: selectedIndex),
                  ),
                ],
              )
            : const LoadingWidget(),
      ),
    ));
  }
}
