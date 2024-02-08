import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec_blog_new/components/my_colors.dart';
import 'package:tec_blog_new/components/widgets/app_bar_widget.dart';
import 'package:tec_blog_new/components/widgets/drawer_widget.dart';
import 'package:tec_blog_new/gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      drawer: DrawerWidget(textTheme: textTheme),
      key: scaffoldKey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppBarWidget(
            scaffoldKey: scaffoldKey,
          ),
          SizedBox(
            height: Get.height / 13.6,
          ),
          Assets.img.profile.image(scale: 2),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.img.icons.pen.image(scale: 2),
              SizedBox(
                width: Get.width / 62.07,
              ),
              Text(
                'ویرایش عکس پروفایل',
                style: textTheme.headlineLarge,
              )
            ],
          ),
          SizedBox(
            height: Get.height / 12.6,
          ),
          Text(
            'فاطمه امیری',
            style: textTheme.headlineSmall!
                .copyWith(color: MyColors.purpleColor, fontSize: 17),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'fatemeamiri@gmail.com',
            style: textTheme.headlineSmall!.copyWith(fontSize: 15),
          ),
          SizedBox(
            height: 50,
          ),
          ProfileItems(
            textTheme: textTheme,
            title: 'مقالات مورد علاقه من',
          ),
          ProfileItems(
            textTheme: textTheme,
            title: 'پادکست های مورد علاقه من',
          ),
          ProfileItems(
            textTheme: textTheme,
            title: 'خروج از حساب کاربری',
          ),
        ],
      ),
    ));
  }
}

class ProfileItems extends StatelessWidget {
  ProfileItems({
    super.key,
    required this.textTheme,
    required this.title,
  });

  final TextTheme textTheme;
  String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Divider(
          endIndent: Get.width / 4.6,
          indent: Get.width / 4.6,
          thickness: 1,
          color: MyColors.dividerColor,
        ),
        SizedBox(
          height: 10,
        ),
        Text(title,
            style: textTheme.headlineMedium!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 17)),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
