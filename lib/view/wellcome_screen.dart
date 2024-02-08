import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec_blog_new/components/my_colors.dart';
import 'package:tec_blog_new/controller/home_controller.dart';
import 'package:tec_blog_new/gen/assets.gen.dart';
import 'package:tec_blog_new/view/main_screen.dart';

class WellcomeScreen extends StatelessWidget {
  WellcomeScreen({super.key});
  HomeController homeController = Get.put(HomeController());
  RxList selectedCategoriesList = [].obs;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.img.monkey.svg(width: Get.width / 3),
            Text(
              '''تبریک میگم ، ایمیل با موفقیت تایید شد
      لطفا اطلاعات ثبت نام رو کامل کن''',
              textAlign: TextAlign.center,
              style:
                  textTheme.titleSmall!.copyWith(color: MyColors.purpleColor),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width / 10, vertical: Get.height / 20),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: Get.width / 10, vertical: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: 'نام و نام خانوادگی',
                    hintStyle: const TextStyle(color: Colors.grey)),
              ),
            ),
            Text('دسته بندی هایی که دوست داری رو انتخاب کن',
                style: textTheme.titleSmall!
                    .copyWith(color: MyColors.purpleColor)),
            SizedBox(
              height: Get.height / 30,
            ),
            SizedBox(
              height: Get.height / 10,
              child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: homeController.categoriesList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 15,
                      childAspectRatio: .3),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (!selectedCategoriesList.contains(
                            homeController.categoriesList[index].title)) {
                          selectedCategoriesList
                              .add(homeController.categoriesList[index].title);
                        }
                        log(selectedCategoriesList.toString());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: Get.height / 22.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                                colors: MyColors.tagsGradientColor,
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft)),
                        child: Text(
                            '# ${homeController.categoriesList[index].title}',
                            style: textTheme.titleSmall!
                                .copyWith(color: Colors.white)),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: Get.height / 30,
            ),
            Assets.img.icons.flesh.svg(width: Get.width / 6),
            SizedBox(
              height: Get.height / 30,
            ),
            Obx(() => SizedBox(
                  height: selectedCategoriesList.length <= 3
                      ? Get.height / 22
                      : Get.height / 10,
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: selectedCategoriesList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              selectedCategoriesList.length <= 3 ? 1 : 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 15,
                          childAspectRatio: .25),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            height: Get.height / 22.8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xffF2F2F2)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('${selectedCategoriesList[index]}',
                                      style: textTheme.titleSmall),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      selectedCategoriesList.removeAt(index);
                                    },
                                    child: Icon(
                                      Icons.remove_circle,
                                      size: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )),
            SizedBox(
              height: Get.height / 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => MainScreen());
                },
                child: Text('ادامه'))
          ],
        ),
      ),
    )));
  }
}
