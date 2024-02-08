import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec_blog_new/gen/assets.gen.dart';
import 'package:tec_blog_new/view/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4))
        .then((value) => Get.to(() => MainScreen()));
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceInOut);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: animation,
          child:
              SizedBox(width: size.width / 2, child: Assets.img.logo.image()),
        ),
      ),
    ));
  }
}
