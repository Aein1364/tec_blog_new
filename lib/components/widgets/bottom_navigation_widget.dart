import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec_blog_new/components/my_colors.dart';
import 'package:tec_blog_new/components/storage_const.dart';
import 'package:tec_blog_new/controller/new_article_published_by_me_controller.dart';
import 'package:tec_blog_new/gen/assets.gen.dart';
import 'package:tec_blog_new/main.dart';

class BottomNavigationWidget extends StatelessWidget {
  BottomNavigationWidget({
    super.key,
    required this.selectedIndex,
  });
  NewArticlePublishedByMeController newArticlePublishedByMeController =
      Get.put(NewArticlePublishedByMeController());
  final RxInt selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 12.3,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
              colors: MyColors.bottomNavigationGradientColor,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
              onTap: () {
                selectedIndex.value = 0;
              },
              child: Assets.img.icons.home.image(scale: 2)),
          GestureDetector(
              onTap: () {
                if (GetStorage().read(StorageConst.token) == null) {
                  Get.toNamed(RoutPage.emptyStateScreen);
                } else {
                  Get.bottomSheet(Container(
                    height: Get.height / 3,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    child: Padding(
                      padding: EdgeInsets.all(Get.width / 20),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Assets.img.monkey.svg(width: Get.width / 8),
                              SizedBox(
                                width: Get.width / 20,
                              ),
                              Text(
                                'دونسته هات رو با بقیه به اشتراک بذار ...',
                                style: Theme.of(context).textTheme.titleSmall,
                              )
                            ],
                          ),
                          SizedBox(
                            height: Get.height / 30,
                          ),
                          Text(
                            '''فکر کن !!  اینجا بودنت به این معناست که یک گیک تکنولوژی هستی دونسته هات رو با  جامعه‌ی گیک های فارسی زبان به اشتراک بذار..''',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          SizedBox(
                            height: Get.height / 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  await newArticlePublishedByMeController
                                      .newArticleGetMethode();
                                  Navigator.of(context).pop();
                                  Get.toNamed(
                                      RoutPage.newArticlePublishedByMeScreen);
                                },
                                child: Container(
                                  // height: 40,
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Assets.img.icons.articleEditing
                                          .image(scale: 2.5),
                                      SizedBox(
                                        width: Get.width / 20,
                                      ),
                                      Text('مدیریت مقاله ها',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall)
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Assets.img.icons.podcastMicrophone
                                      .image(scale: 2.5),
                                  SizedBox(
                                    width: Get.width / 20,
                                  ),
                                  Text('مدیریت پادکست ها',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall)
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ));
                }
              },
              child: Assets.img.icons.edit.image(scale: 2)),
          GestureDetector(
              onTap: () {
                selectedIndex.value = 1;
              },
              child: Assets.img.icons.user.image(scale: 2)),
        ],
      ),
    );
  }
}
