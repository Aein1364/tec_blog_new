import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec_blog_new/gen/assets.gen.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({
    super.key,
    required this.scaffoldKey,
  });
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          Get.width / 12.38, Get.height / 43.6, Get.width / 12.38, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () => scaffoldKey.currentState!.openDrawer(),
              child: const Icon(Icons.menu)),
          SizedBox(
              height: Get.width / 8,
              child: Assets.img.logo.image(fit: BoxFit.cover)),
          const Icon(Icons.search),
        ],
      ),
    );
  }
}
